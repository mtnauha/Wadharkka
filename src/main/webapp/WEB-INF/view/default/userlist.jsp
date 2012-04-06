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
                <li class="navigation"><a  class="navigation" href="${pageContext.request.contextPath}/default/home">Home</a></li>
                <li class="navigation"><a  class="navigation" href="${pageContext.request.contextPath}/default/search">Search</a></li>
                <li class="navigation"><a  id="active" href="userlist">List all users</a></li>
            </ul>
        </div>

        <div id="maincontent">
            <table id="userlist">
                <tr>
                    <th>Username</th>
                    <th>Picture</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><a class="userlist" href="profile/${user.username}">${user.username}</a></td>

                        <td>
                            <c:choose>
                                <c:when test="${user.hasProfileImage}">
                                    <img src="${pageContext.request.contextPath}/image/getprofile/${user.username}" width="50" height="50" />
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value="/resources/img/lolcat.jpeg" />" alt="default profile" width="50" height="50" />
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </body>
</html>
