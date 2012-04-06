<%-- 
    Document   : search
    Created on : Apr 4, 2012, 7:35:14 PM
    Author     : mtnauha
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wadharkka</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Le styles -->
        <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link href="http://twitter.github.com/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Le fav and touch icons -->
        <link rel="shortcut icon" href="../assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body>

        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Wadharkka</a>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li><a href="${pageContext.request.contextPath}/default/home">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/default/search">Search</a></li>
                            <li><a href="${pageContext.request.contextPath}/default/userlist">List all users</a></li>

                            <li class="divider-vertical"></li>

                            <li class="active"><a href="${pageContext.request.contextPath}/default/profile/${principalName}">${user.username}</a></li>
                            <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div class="container">

            <!-- Example row of columns -->
            <div class="row">
                <div class="span4">
                    <h2>&lt;${user.username}&gt;</h2>
                    <ul class="thumbnails">
                        <li class="span4">
                            <a href="#" class="thumbnail">
                                <img src="${pageContext.request.contextPath}/image/getprofile/${user.username}" alt="profile image">
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="span8">
                    <h2>Pictures</h2>
                    <ul class="thumbnails">
                        <c:forEach var="image" items="${images}">
                            <li class="span2">
                                <a href="${pageContext.request.contextPath}/default/profile/${user.username}/${image.id}" class="thumbnail" style="text-align:center">
                                    <img src="${pageContext.request.contextPath}/image/getimage/${image.id}" alt="image here">
                                    ${image.description}
                                </a>
                                <div class="btn-group">
                                    <a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">
                                        Select action
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="setprofile/${image.id}">Set as profile</a>
                                        </li>
                                        <li>
                                            <a href="#">Change description</a>
                                        </li>
                                        <li>
                                            <a href="#">Delete</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <sec:authorize access="hasRole('${user.username}')">
                    <div class="span12">
                        <h2>Add images</h2>
                        <form class="form-horizontal" enctype="multipart/form-data">
                            <fieldset>
                                <legend>Upload one or more images</legend>
                                <div class="control-group">
                                    <label class="control-label" for="input01">Image description</label>
                                    <div class="controls">
                                        <input type="text" class="input-xlarge" id="input01" name="description">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="input02">Select images</label>
                                    <div class="controls">
                                        <input type="file" class="input-xlarge" id="input02" name="files[]" multiple />
                                        <p class="help-block">Press down CTRL-key while selecting images, and you can select more than one image at once</p>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div id="progressbar" class="bar"
                                         style="width: 0%;"></div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">Add image</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </sec:authorize>
            </div>

            <input type="file" id="files" name="filu" />
            <output id="list"></output>

            <a href="/wadharkka/default/profile/form">this link</a>

            <hr>

            <footer>
                <p>&copy; Matti Nauha 2012</p>
            </footer>

        </div> <!-- /container -->

        <!-- Le javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="http://twitter.github.com/bootstrap/assets/js/jquery.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-transition.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-alert.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-modal.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-dropdown.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-scrollspy.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tab.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-tooltip.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-popover.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-button.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-collapse.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-carousel.js"></script>
        <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap-typeahead.js"></script>
        <script>
            function handleFileSelect(evt) {
                var files = evt.target.files; // FileList object
                
                // Loop through the FileList
                var len = files.length;
                for (var i = 0; i < len; i++) {
                    var f = files[i];
                    
                    // Only process image files.
                    if (!f.type.match('image.*')) {
                        continue;
                    }
                    
                    var reader = new FileReader();
                    
                    // Read in the image file as a data URL.
                    reader.readAsDataURL(f);
                    
                    reader.onprogress = updateProgress;
                    reader.onload = loaded(f);
                    
                }
            }
            
            function updateProgress(evt) {
                if (evt.lengthComputable) {
                    // evt.loaded and evt.total are ProgressEvent properties
                    var loaded = (evt.loaded / evt.total);
                    //var percentLoaded = Math.round((evt.loaded / evt.total) * 100);
                    if (loaded < 1) {
                        // Increase the prog bar length
                        $( "#progressbar" ).css({width: "50%"});
                    }
                    else {
                        $( "#progressbar" ).css({width: "100%"});
                    }
                }
            }
            
            function loaded(theFile) {
                
                var data = new FormData();
                data.append("filu", theFile);
                
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/wadharkka/default/profile/form', true);
                xhr.send(data);
            }
            
            document.getElementById('files').addEventListener('change', handleFileSelect, false);
        </script>

    </body>
</html>