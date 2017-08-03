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
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleProduct.css">
</head>
<body>


<%--<h2>Welcome ${pageContext.request.userPrincipal.name}</a></h2>--%>
<%--<a href="${contextPath}">Back to main menu</a>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<a href="${contextPath}/admin/">Admin</a>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<a href="${contextPath}/owners/">Owners</a>--%>
<%--<br/>--%>
<%--<br/>--%>
<%--<a href="${contextPath}/users/">Users</a>--%>


<%--<br/>--%>
<%--<br/>--%>

<%--<select name="listOfOwners">--%>
    <%--<option>Выберите Владельца</option>--%>
    <%--<c:forEach items="${listProducts}" var="listProducts">--%>
        <%--<option value=${listProducts.id} >${listProducts.owners.toString().replaceAll("[\\[\\]]","")}--%>

        <%--</option>--%>
    <%--</c:forEach>--%>
<%--</select>--%>

<div class="container">
    <div class="wrapBattonAdd">
        <%--<button class="btnAdd">add a product +</button>--%>
        <a href="<c:url value="${contextPath}/productAdd"/>" class="btnAdd">add a product +</a>
    </div>

<%--<h1>Product List</h1>--%>

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
                <th data-type="string">Delete</th>
            </tr>
            <tr ></tr>
            </thead>
            <tbody class="ttbody" id="tbody">
                <c:forEach items="${listProducts}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td><a href="${contextPath}/productdata/${product.id}" target="_blank">${product.productName}</a></td>
                        <td>${product.productManufacturer}</td>
                            <%--<td>${product.owners}</td>--%>
                        <td>${product.owners.toString().replaceAll("[\\[\\]]","")}</td>
                            <%--<td>${product.price/100}${product.price%100}</td>--%>
                        <td>${product.price}</td>
                        <td>${product.productDescription}</td>
                        <td>
                            <div class="wrapSquaredBut">
                                    <%--<a href="<c:url value='/editProduct/${product.id}'/>">Edit</a>--%>
                                    <%--<button class="btnShowEditPage" value="/editProduct/${product.id}" data-value="/editProduct/${product.id}"></button>--%>
                                <a href="<c:url value='${contextPath}/productEdit/${product.id}'/>" class="btnShowEditPage"></a>
                            </div>
                        </td>
                        <td>
                            <div class="wrapSquaredBut">
                                <a href="<c:url value='/removeProduct/${product.id}'/>" onclick="return confirm('Are you sure that you want to delete?')" class="delBtn"></a>
                                    <%--<button class="delBtn" value="/removeProduct/${product.id}" data-value="/removeProduct/${product.id}"></button>--%>
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
<%--<script src="${contextPath}/resources/js/scriptProduct.js"></script>--%>
</body>
</html>
