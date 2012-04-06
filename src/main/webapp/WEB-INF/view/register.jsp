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

            <form:form commandName="user" action="${pageContext.request.contextPath}/user" method="POST">
                Real name: <form:input path="name" /><form:errors path="name" /><br/>
                Username: <form:input path="username" /><form:errors path="username" /><br/>
                Password: <form:input path="password" /><form:errors path="password" /><br/>
                <input type="submit" value="Register">
            </form:form>
        </div>

    </body>
</html>
