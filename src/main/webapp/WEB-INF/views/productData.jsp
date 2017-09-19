<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Product Data</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleBackgroundMain.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleMainNav.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleProductData.css">

</head>
<body>
<div class="fonIcons">
    <i class="iconsOne"></i>
    <%--<i class="iconsTwo"></i>--%>
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
    <nav class="mainNav">
        <a href="<c:url value="/"/>" class="main-nav-link main-menu">Main menu</a>
        <a href="<c:url value="/products"/>" class="main-nav-link products">Products</a>
        <a href="<c:url value="/admin"/>" class="main-nav-link admin">Admin</a>
        <a href="<c:url value="/owners"/>" class="main-nav-link owners">Owners</a>
        <a href="<c:url value="/users"/>" class="main-nav-link users">Users</a>
    </nav>
    <h1>Product Details</h1>
    <div class="wrapTableData">
        <table id="gridProductData" class="tablesData tableProductData ">
            <thead class="thead" id="theadProductData">
                <tr>
                    <th >ID</th>
                    <th>Name</th>
                    <th>Manufacturer</th>
                    <th >Owner</th>
                    <th >Price</th>
                    <th>Description</th>
                </tr>
                <tr></tr>
            </thead>
            <tbody class="tbodyData" id="tbodyProductData">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.productName}</td>
                    <td>${product.productManufacturer}</td>
                    <td>${product.owners.toString().replaceAll("[\\[\\]]","")}</td>
                    <td>${product.price}</td>
                    <td>${product.productDescription}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>