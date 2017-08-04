<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventory</title>
    <link rel="stylesheet" href="resources/css/homeFonts.css">
    <link rel="stylesheet" href="resources/css/homeStyle320.css">
    <link rel="stylesheet" href="resources/css/homeStyle768.css">
    <link rel="stylesheet" href="resources/css/normalize.css">
    <%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="${contextPath}/resources/css/common.css" rel="stylesheet">--%>
</head>
<body>
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
    <i class="iconThirteen"></i>
    <i class="iconFourteen"></i>
    <i class="iconFifteen"></i>
    <i class="iconSixteen"></i>
    <i class="iconSeventeen"></i>
    <i class="iconEighteen"></i>
    <i class="iconNineteen"></i>
    <i class="iconTwenty"></i>
    <i class="iconTwentyOne"></i>
    <i class="iconTwentyTwo"></i>
    <i class="iconTwentyThree"></i>
</div>
<div class="container">
    <header  class="header">
        <%--<a href="login.html" class="inventarium">INVENTARIUM</a>--%>
        <a href="<c:url value="/login"/>" class="inventarium">INVENTARIUM</a>
    </header>
    <main class="main">
        <p class="text">Inventarium and its channel network provide software  solutions for a number of verticals and industries</p>
    </main>
</div>
<%--<a href="<c:url value="/login"/>" class="button7">Start</a>--%>
<%--<hr>--%>
<%--<br/>--%>
<%--<a href="<c:url value="/registration"/>" target="_blank">Press to Start</a>--%>
<%--<p>--%>
    <%--We present you the inventory service.--%>
    <%--The service will help you keep track of all inventory that will be stored in one convenient place for you.--%>
    <%--<span class="word">Inventarium</span> provides the ability to add, delete, edit inventory items.--%>
<%--</p>--%>


<%--a href="<c:url value="/products"/>" target="_blank">Product list</a>
<br/>
<br/>
<a href="<c:url value="/owners"/>" target="_blank">Owner list</a>
<br/--%>
<footer class="footer">
    <ul class="contacts">
        <li><a href="https://www.facebook.com" target="_blank"><img src="resources/images/1.png" alt=""></a></li>
        <li><a href="https://twitter.com" target="_blank"><img src="resources/images/2.png" alt=""></a></li>
        <li><a href="https://plus.google.com" target="_blank"><img src="resources/images/3.png" alt=""></a></li>
        <li><a href="https://www.instagram.com" target="_blank"><img src="resources/images/4.png" alt=""></a></li>
        <li><a href="https://www.youtube.com" target="_blank"><img src="resources/images/5.png" alt=""></a></li>
    </ul>
</footer>
</body>
</html>
