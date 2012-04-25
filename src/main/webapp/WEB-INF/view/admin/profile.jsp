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

                            <li class="active"><a href="${pageContext.request.contextPath}/default/profile/${principalName}">${principalName}</a></li>
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
                                    <img src="${pageContext.request.contextPath}/image/${image.id}" alt="image here">
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
            </div>

            <sec:authorize access="hasRole('${user.username}')">
                <div class="row">
                    <div class="span9">
                        <h2>Add images</h2>
                        <form class="form-horizontal" id="form1" enctype="multipart/form-data">
                            <fieldset>
                                <legend>Upload one or more images</legend>
                                <div class="control-group">
                                    <label class="control-label" for="files">Select images</label>
                                    <div class="controls">
                                        <input type="file" class="input-xlarge" id="files" name="files" onchange="fileSelected();"/>
                                        <p class="help-block">Press down CTRL-key while selecting images, and you can select more than one image at once</p>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="input01">Image description</label>
                                    <div class="controls">
                                        <input type="text" class="input-xlarge" id="input01" name="description">
                                    </div>
                                </div>
                                <div class="progress">
                                    <div id="progressbar" class="bar"
                                         style="width: 0%;">
                                    </div>
                                </div>
                                <button class="btn btn-primary" onclick="startRead()">Add image</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </sec:authorize>

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
            function startRead() {
  
                //                // FileList object
                //                var files = document.getElementById('files').files;
                //                if(files){
                //                    getAsDataURL(files);
                //                }
                
                var xhr = new XMLHttpRequest();
                alert("joo1");
                var fd = new FormData();
                alert("joo2");
                fd.append("description", "default");
                alert("joo3");
                fd.append("theFile", document.getElementById('files').files[0]);
                alert("joo4");

                /* event listners */
                xhr.upload.addEventListener("progress", uploadProgress, false);
                xhr.addEventListener("load", uploadComplete, false);
                xhr.addEventListener("error", uploadFailed, false);
                xhr.addEventListener("abort", uploadCanceled, false);
                /* Be sure to change the url below to the url of your upload server side script */
                xhr.open("POST", "/wadharkka/image", true);
                xhr.send(fd);
            }
            
            function uploadProgress(evt) {
                if (evt.lengthComputable) {
                    var percentComplete = Math.round(evt.loaded * 100 / evt.total);
                    $( "#progressbar" ).css({width: percentComplete + "%"});
                }
                else {
                    document.getElementById('progressNumber').innerHTML = 'unable to compute';
                }
            }

            function uploadComplete(evt) {
                /* This event is raised when the server send back a response */
                alert(evt.target.responseText);
            }

            function uploadFailed(evt) {
                alert("There was an error attempting to upload the file.");
            }

            function uploadCanceled(evt) {
                alert("The upload has been canceled by the user or the browser dropped the connection.");
            }  
            
            function getAsDataURL(files) {
                
                // Loop through the FileList
                var len = files.length;
                for (var i = 0; i < len; i++) {
                    var f = files[i];
                    
                    // Only process image files.
                    //if (!f.type.match('image.*')) {
                    //    continue;
                    //}
                    
                    var reader = new FileReader();
                    
                    // Read in the image file as a data URL.
                    reader.readAsDataURL(f);
                    
                    reader.onprogress = updateProgress;
                    reader.onload = loaded(f);
                    
                }
            }

            
            function fileSelected() {
                //                var files = evt.target.files; // FileList object
                //                
                //                // Loop through the FileList
                //                var len = files.length;
                //                for (var i = 0; i < len; i++) {
                //                    var f = files[i];
                //                    
                //                    // Only process image files.
                //                    if (!f.type.match(/image.*/)) {
                //                        continue;
                //                    }
                //                    
                //                    //TODO: Create description fields for each file
                //                }
                
                var file = document.getElementById('files').files[0];
                if (file) {
                    var fileSize = 0;
                    if (file.size > 1024 * 1024)
                        fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
                    else
                        fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
          
                    document.getElementById('fileName').innerHTML = 'Name: ' + file.name;
                    document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
                    document.getElementById('fileType').innerHTML = 'Type: ' + file.type;
                }
            }
            
            //function updateProgress(evt) {
            //                if (evt.lengthComputable) {
            //                    // evt.loaded and evt.total are ProgressEvent properties
            //                    var percentLoaded = Math.round((evt.loaded / evt.total) * 100);
            //                    if (percentLoaded < 100) {
            //                        // Increase the prog bar length
            //                        $( "#progressbar" ).css({width: percentLoaded + "%"});
            //                    }
            //                    else {
            //                        $( "#progressbar" ).css({width: "100%"});
            //                    }
            //                }
            //}
            
            function loaded(theFile) {
                
                var data = new FormData();
                data.append("description", "default");
                data.append("theFile", theFile);
                
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/wadharkka/image', true);
                xhr.send(data);
            }
            
            //document.getElementById('files').addEventListener('change', handleFileSelect, false);
        </script>

    </body>
</html>