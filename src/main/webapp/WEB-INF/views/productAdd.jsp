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
    <title>Add a product</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/font.css">
    <link rel="stylesheet" href="/resources/css/styleProduct.css">
</head>
<body>
<c:forEach items="${listProducts}" var="product">
</c:forEach>
<div class="container">

    <%--<h1>Add a product</h1>--%>
    <%--<div class="wrapEditHide" id="wrEdit">--%>
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
                            <div class="wrapEditLabel">
                                <form:label path="productName">
                                    <spring:message text="Name"/>
                                </form:label>
                            </div>
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
    <%--</div>--%>
</div>
<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/resources/js/lodash.js"></script>
<script src="${contextPath}/resources/js/scriptProduct.js"></script>
</body>
</html>
