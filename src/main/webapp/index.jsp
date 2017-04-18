<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Inventory</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/welcome.css" rel="stylesheet">
    <style>
        body {
            background-image: url(resources/images/test.jpg);
            background-repeat: no-repeat;
            background-color: #ffffff;
        }
    </style>
</head>
<body>

<a href="<c:url value="/registration"/>" class="button7">Start</a>
<hr>
<br/>
<%--<a href="<c:url value="/registration"/>" target="_blank">Press to Start</a>--%>
<p>
    We present you the inventory service.
    The service will help you keep track of all inventory that will be stored in one convenient place for you.
    <span class="word">Inventarium</span> provides the ability to add, delete, edit inventory items.
</p>


<%--a href="<c:url value="/products"/>" target="_blank">Product list</a>
<br/>
<br/>
<a href="<c:url value="/owners"/>" target="_blank">Owner list</a>
<br/--%>
</body>
</html>
