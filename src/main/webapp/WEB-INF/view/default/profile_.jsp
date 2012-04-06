<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>wadharkka</title>

        <!-- <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" /> -->

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>

        <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/ui-lightness/jquery-ui.css" />

    </head>
    <body>
        <div id="top">
            <h1>
                Wadharkka
                <a href="${pageContext.request.contextPath}/default/profile/${principalName}">${principalName}</a> 
                <a href="<c:url value="/j_spring_security_logout" />" >Logout</a>
            </h1>
        </div>

        <div id="navigation">
            <ul class="navigation">
                <li class="navigation"><a  class="navigation" href="${pageContext.request.contextPath}/default/home">Home</a></li>
                <li class="navigation"><a  class="navigation" href="${pageContext.request.contextPath}/default/search">Search</a></li>
                <li class="navigation"><a  class="navigation" href="${pageContext.request.contextPath}/default/userlist">List all users</a></li>
            </ul>
        </div>

        <div id="maincontent">

            <sec:authorize access="hasRole('admin')">
                <h3>Roles</h3>
                <ul>
                    <c:forEach var="role" items="${user.roles}">
                        <li>${role.rolename}</li>
                    </c:forEach>
                </ul>
            </sec:authorize>

            <div id="profile">
                <h2>&lt;${user.username}&gt;</h2>
                <div class="image">
                    <img src="${pageContext.request.contextPath}/image/getprofile/${user.username}" />
                    <div class="desc">${user.profileImage.description}</div>
                </div>
            </div>

            <div id="otherimages">
                <h2>Images</h2>
                <c:forEach var="image" items="${images}">
                    <div class="image">
                        <a href="${pageContext.request.contextPath}/default/profile/${user.username}/${image.id}">
                            <img src="${pageContext.request.contextPath}/image/getimage/${image.id}" alt="image" width="140" height="110" />
                        </a>
                        <div class="desc">${image.description}<br/><a href="setprofile/${image.id}">set as profile image</a></div>
                    </div>
                </c:forEach>
            </div>

            <div id="upload">
                <sec:authorize access="hasRole('${user.username}')">
                    <h2>Add images</h2>
                    <form method="post" action="form" enctype="multipart/form-data">
                        <input type="text" name="description"/>
                        <input type="file" name="file"/>
                        <input type="submit" value="Send"/>
                    </form>
                </sec:authorize>
            </div>

        </div>

        <input type="file" id="files" name="files[]" multiple />
        <output id="list"></output>

        <div id="progressbar"></div>
        
        <script>
	$(function() {
		$( "#progressbar" ).progressbar({
			value: 1
		});
	});
	</script>

        <script>
            function updateProgress(evt) {
                alert('ASDF!');
                        if (evt.lengthComputable) {
                            // evt.loaded and evt.total are ProgressEvent properties
                            var loaded = (evt.loaded / evt.total);
                            alert(evt.loaded);
                            alert(evt.total);
                            alert(loaded);
                            if (loaded < 1) {
                                // Increase the prog bar length
                                $( "#progressbar" ).progressbar("option", "value", 37);
                            }
                        }
                    }
            
            function handleFileSelect(evt) {
                var files = evt.target.files; // FileList object
                
                // Loop through the FileList and render image files as thumbnails.
                for (var i = 0, f; f = files[i]; i++) {
                    
                    // Only process image files.
                    if (!f.type.match('image.*')) {
                        continue;
                    }
                    
                    var reader = new FileReader();
                    
                    reader.onprogress = updateProgress;
                    
                    // Closure to capture the file information.
                    reader.onload = (function(theFile) {
                        return function(e) {
                            // Render thumbnail.
                            var span = document.createElement('span');
                            span.innerHTML = ['<img class="thumb" src="', e.target.result,
                                '" title="', escape(theFile.name), '"/>'].join('');
                            document.getElementById('list').insertBefore(span, null);
                        };
                    })(f);
                    
                    // Read in the image file as a data URL.
                    reader.readAsDataURL(f);
                }
            }
            
            document.getElementById('files').addEventListener('change', handleFileSelect, false);
        </script>

    </body>
</html>
