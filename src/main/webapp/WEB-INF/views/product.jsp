<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleBackgroundMain.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleMainNav.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleProduct.css">

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
        <a href="<c:url value="/productAdd"/>" class="btnAdd">add a product +</a>
    <nav class="mainNav">
        <a href="<c:url value="/"/>" class="main-nav-link main-menu">Main menu</a>
        <%--<a href="<c:url value="/products"/>" class="main-nav-link products">Products</a>--%>
        <a href="<c:url value="/admin"/>" class="main-nav-link admin">Admin</a>
        <a href="<c:url value="/owners"/>" class="main-nav-link owners">Owners</a>
        <a href="<c:url value="/users"/>" class="main-nav-link users">Users</a>
    </nav>
<c:if test="${!empty listProducts}">
    <div class="wrapTable">
        <table id="grid" class="table">
            <thead class="thead" id="theadFix">
            <tr>
                <th data-type="number">ID</th>
                <th data-type="string">Name</th>
                <th data-type="string">Manufacturer</th>
                <th data-type="string">Owner</th>
                <th data-type="number">Price</th>
                <th data-type="string">Description</th>
                <th data-type="string">Edit</th>
                <th data-type="string">Del</th>
            </tr>
            <tr></tr>
            </thead>
            <tbody class="ttbody" id="tbody">
                <c:forEach items="${listProducts}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td><a href="${contextPath}/productdata/${product.id}" target="_blank">${product.productName}</a></td>
                        <td>${product.productManufacturer}</td>
                        <td>${product.owners.toString().replaceAll("[\\[\\]]","")}</td>
                        <td>${product.price}</td>
                        <td>${product.productDescription}</td>
                        <td>
                            <div class="wrapSquaredBut">
                                <a href="<c:url value='/productEdit/${product.id}'/>" class="btnShowEditPage"></a>
                            </div>
                        </td>
                        <td>
                            <div class="wrapSquaredBut">
                                <a href="<c:url value='/removeProduct/${product.id}'/>" onclick="return confirm('Are you sure that you want to delete?')" class="delBtn"></a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</c:if>

</div>
<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/resources/js/lodash.js"></script>
</body>
</html>
