<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/buttonFonts.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/buttonStyle320.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/buttonStyle480.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/buttonStyle768.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/normalize.css">
    <%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="${contextPath}/resources/css/common.css" rel="stylesheet">--%>
</head>

<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <%--<h6> ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()"></a>--%>
        <%--</h6>--%>
    </c:if>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<%--<a href="${contextPath}">Back to main menu</a>--%>

<%--<br/>--%>
<%--<br/>--%>
<%--<a href="${contextPath}/owners/">Owners</a>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<a href="${contextPath}/products/">Products</a>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<a href="${contextPath}/users/">Users</a>--%>

<%--</body>--%>
<%--</html>--%>

<div class="container">
    <div class="button users"><a href="${contextPath}/users/"><img src="${contextPath}/resources/images/user.png" alt=""></a><h1>USERS</h1></div>
    <div class="button owners"><a href="${contextPath}/owners/"><img src="${contextPath}/resources/images/owner.png" alt=""></a><h1>OWNERS</h1></div>
    <div class="button admin"><a href="${contextPath}/products/"><img src="${contextPath}/resources/images/admin1.png" alt=""></a><h1>ADMIN</h1></div>
    <div class="button main_menu"><a href="<c:url value="/"/>"><img src="${contextPath}/resources/images/main_menu4.png" alt=""></a><h1>MAIN MENU</h1></div>
</div>
<div class="fonIcons">
    <i class="iconsOne"></i>
    <i class="iconsTwo"></i>
    <i class="iconsThree"></i>
    <i class="iconsFour"></i>
    <i class="iconsFive"></i>
    <i class="iconsSix"></i>
    <i class="iconsSeven"></i>
    <i class="iconsEight"></i>
    <i class="iconsNine"></i>
    <i class="iconsTen"></i>
    <i class="iconsEleven"></i>
    <i class="iconsTwelve"></i>
</div>
</body>
</html>