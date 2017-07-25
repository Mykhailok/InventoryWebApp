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
        <button class="btnAdd">add a product +</button>
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

            </tbody>
        </table>
    </div>

    <%--<table class="tg">--%>
        <%--<tr>--%>
            <%--<th width="80">ID</th>--%>
            <%--<th width="120">Name</th>--%>
            <%--<th width="120">Manufacturer</th>--%>
            <%--<th width="120">Owner</th>--%>
            <%--<th width="120">Price</th>--%>
            <%--<th width="120">Description</th>--%>
            <%--<th width="60">Edit</th>--%>
            <%--<th width="120">Delete</th>--%>
        <%--</tr>--%>
    <script type="text/template" id="table-template">
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
                        <button class="btnShowEditPage" value="/editProduct/${product.id}" data-value="/editProduct/${product.id}"></button>
                    </div>
                </td>
                <td>
                    <div class="wrapSquaredBut">
                        <%--<a href="<c:url value='/removeProduct/${product.id}'/>">Delete</a>--%>
                        <button class="delBtn" value="/removeProduct/${product.id}" data-value="/removeProduct/${product.id}"></button>
                    </div>
                </td>
            </tr>
        </c:forEach>

    </script>
    <%--</table>--%>
</c:if>


<h1>Add a product</h1>
    <div class="wrapEditHide" id="wrEdit">
        <div class="wrapForm">
        <c:url var="addAction" value="/products/add"/>


            <%--<form action="#" class="formEdit">    --%>

                <form:form action="${addAction}" commandName="product" class="formEdit">
                    <table>
                        <c:if test="${!empty product.productName}">
                            <tr>
                                <td>
                                    <div class="wrapEditLabel">
                                    <form:label class="editInput" path="id">
                                        <spring:message text="ID"/>
                                    </form:label>
                                    </div>
                                </td>
                                <td>
                                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                                    <form:hidden path="id"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td>
                                <form:label path="productName">
                                    <spring:message text="Name"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="productName"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form:label path="productManufacturer">
                                    <spring:message text="Manufacturer"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="productManufacturer"/>
                            </td>
                        </tr>
                        <%--<tr>--%>
                            <%--<td>--%>
                                <%--<form:label path="owner_id">--%>
                                    <%--<spring:message text="Owner"/>--%>
                                <%--</form:label>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                <%--<form:input path="owner_id"/>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                        <tr>
                            <td>
                                <form:label path="owner_id">
                                    <spring:message text="Owner"/>
                                </form:label>
                            </td>
                            <td>

                                <%--<select name="listOfOwners">--%>
                                    <%--<option>Choose owner</option>--%>
                                    <%--<c:forEach items="${listProducts}" var="listProducts">--%>
                                        <%--<option value=${listProducts.id} >${listProducts.owners.toString().replaceAll("[\\[\\]]","")}--%>
                                        <%--</option>--%>
                                    <%--</c:forEach>--%>
                                <%--</select>--%>

                                <select name="listOfOwners">
                                    <option>Choose owner</option>
                                    <c:forEach items="${listFullOwners}" var="listFullOwners">
                                        <option value=${listFullOwners.id} >${listFullOwners.firstName.toString().replaceAll("[\\[\\]]","")}
                                                                            ${listFullOwners.lastName.toString().replaceAll("[\\[\\]]","")}
                                        </option>
                                    </c:forEach>
                                </select>


                            </td>
                        </tr>



                        <tr>
                            <td>
                                <form:label path="price">
                                    <spring:message text="Price"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="price"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <form:label path="productDescription">
                                    <spring:message text="Description"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="productDescription"/>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <c:if test="${!empty product.productName}">
                                    <input type="submit"
                                           value="<spring:message text="Edit Product"/>"/>
                                </c:if>
                                <c:if test="${empty product.productName}">
                                    <input type="submit"
                                           value="<spring:message text="Add Product"/>"/>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </form:form>
            <%--</form>--%>
        </div>
    </div>
</div>
<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/resources/js/lodash.js"></script>
<script src="${contextPath}/resources/js/scriptProduct.js"></script>
</body>
</html>
