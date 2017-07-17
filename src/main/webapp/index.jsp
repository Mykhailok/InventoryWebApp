<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Inventory</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <style>
        body {
            background-image: url(resources/images/test.jpg);
            background-repeat: no-repeat;
            background-color: #ffffff;
        }

        a.button7 {
            display: inline-block;
            color: dodgerblue;
            height: 40px;
            width: 100px;
            font-size: large;
            text-align: center  ;
            font-weight: 500;
            text-decoration: none;
            user-select: none;
            position: relative;
            left: 650px;
            top: 185px;
            outline: none;
            border: 2px solid;
            border-radius: 1px;
            transition: 0.2s;
        }
        a.button7:hover { background: ghostwhite; }
        a.button7:active { background: aliceblue; }


        hr {
            position: relative;
            top: 365px;
            border: none;
            background-color: darkslateblue;
            color: darkslateblue;
            height: 2px;
        }
        .word{
            color: skyblue;
        }

        p {
            position: relative;
            top: 400px;
            text-align: center;
            margin-left: 60px;
            margin-right: 10px;
            font-size: 20pt;
            font-family: Oriya MN;
            color: lightslategrey;
        }

    </style>

</head>
<body>

<a href="<c:url value="/login"/>" class="button7">Start</a>
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
