<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>wadharkka</title>

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" />
    </head>
    <body>
        <div id="top">
            <h1>
                Wadharkka
                <a href="profile/${principalName}">${principalName}</a> 
                <a href="<c:url value="/j_spring_security_logout" />" >Logout</a>
            </h1>
        </div>

        <div id="navigation">
            <ul class="navigation">
                <li class="navigation"><a class="navigation" href="${pageContext.request.contextPath}/default/home">Home</a></li>
                <li class="navigation"><a id="active" href="${pageContext.request.contextPath}/default/search">Search</a></li>
                <li class="navigation"><a class="navigation" href="userlist">List all users</a></li>
            </ul>
        </div>

        <div id="maincontent">
            <p>Search</p>
        </div>

    </body>
</html>
