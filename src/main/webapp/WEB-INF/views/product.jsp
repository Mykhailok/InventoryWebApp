<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <style type="text/css">
        input {
            width: 200px;
        }
        select {
            width: 206px;
        }

        h2{
            text-align: right;
            position: relative;
            right: 10px;

        }

        table {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 14px;
            border-radius: 10px;
            border-spacing: 0;
            text-align: center;
        }
        th {
            background: #BCEBDD;
            color: dodgerblue;
            text-shadow: 0 1px 1px #2D2020;
            padding: 10px 20px;
        }
        th, td {
            border-style: solid;
            border-width: 0 1px 1px 0;
            border-color: white;
        }
        th:first-child, td:first-child {
            text-align: left;
        }
        th:first-child {
            border-top-left-radius: 10px;
        }
        th:last-child {
            border-top-right-radius: 10px;
            border-right: none;
        }
        td {
            padding: 10px 20px;
            background: #F8E391;
        }
        tr:last-child td:first-child {
            border-radius: 0 0 0 10px;
        }
        tr:last-child td:last-child {
            border-radius: 0 0 10px 0;
        }
        tr td:last-child {
            border-right: none;
        }

    </style>
</head>
<body>


<h2>Welcome ${pageContext.request.userPrincipal.name}</a></h2>
<a href="../../index.jsp">Back to main menu</a>
<br/>
<br/>
<a href="../../admin">Admin</a>


<br/>
<br/>

<%--<select name="listOfOwners">--%>
    <%--<option>Выберите Владельца</option>--%>
    <%--<c:forEach items="${listProducts}" var="listProducts">--%>
        <%--<option value=${listProducts.id} >${listProducts.owners.toString().replaceAll("[\\[\\]]","")}--%>

        <%--</option>--%>
    <%--</c:forEach>--%>
<%--</select>--%>

<h1>Product List</h1>

<c:if test="${!empty listProducts}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="120">Manufacturer</th>
            <th width="120">Owner</th>
            <th width="120">Price</th>
            <th width="120">Description</th>
            <th width="60">Edit</th>
            <th width="120">Delete</th>
        </tr>
        <c:forEach items="${listProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td><a href="/productdata/${product.id}" target="_blank">${product.productName}</a></td>
                <td>${product.productManufacturer}</td>
                <%--<td>${product.owners}</td>--%>
                <td>${product.owners.toString().replaceAll("[\\[\\]]","")}</td>
                <%--<td>${product.price/100}${product.price%100}</td>--%>
                <td>${product.price}</td>
                <td>${product.productDescription}</td>
                <td><a href="<c:url value='/editProduct/${product.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/removeProduct/${product.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add a product</h1>

<c:url var="addAction" value="/products/add"/>

<form:form action="${addAction}" commandName="product">
    <table>
        <c:if test="${!empty product.productName}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
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

                <select name="listOfOwners">
                    <option>Choose owner</option>
                    <c:forEach items="${listProducts}" var="listProducts">
                        <option value=${listProducts.id} >${listProducts.owners.toString().replaceAll("[\\[\\]]","")}
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
</body>
</html>
