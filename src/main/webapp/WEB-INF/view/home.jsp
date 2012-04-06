<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
            </h1>
        </div>

        <div id="maincontent">
            <p><a href="default/home">Login</a></p>
            <p><a href="admin/home">Admin Login</a></p>
            <p><a href="register">Register</a></p>

        </div>

    </body>
</html>
