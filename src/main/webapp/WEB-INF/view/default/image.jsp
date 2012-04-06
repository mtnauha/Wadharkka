<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

            <h2>${user.username}</h2>

            <div class="image">
                <a href="${pageContext.request.contextPath}/default/profile/${user.username}">
                    <img src="${pageContext.request.contextPath}/image/getimage/${image.id}" />
                </a>
                <div class="desc">${image.description}</div>
            </div>

            <div id="upload">
                    Write a comment:
                    <form method="post" action="${image.id}/comment">
                        <input type="text" name="comment"/>
                        <input type="submit" value="Send"/>
                    </form>
                        
                    <c:forEach var="comment" items="${image.comments}">
                        <p>${comment}</p>
                    </c:forEach>
            </div>

        </div>

    </body>
</html>
