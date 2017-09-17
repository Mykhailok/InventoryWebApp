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
    <title>Edit a product - Inventarium</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleBackgroundMain.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleMainNav.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleProductEdit.css">
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
<c:forEach items="${listProducts}" var="product">
</c:forEach>
<div class="container">
    <nav class="mainNav">
        <a href="<c:url value="/"/>" class="main-nav-link main-menu">Main menu</a>
        <a href="<c:url value="/products"/>" class="main-nav-link products">Products</a>
        <a href="<c:url value="/admin"/>" class="main-nav-link admin">Admin</a>
        <a href="<c:url value="/owners"/>" class="main-nav-link owners">Owners</a>
        <a href="<c:url value="/users"/>" class="main-nav-link users">Users</a>
    </nav>
    <header class="header">

        </header>
        <div class="content__container">
            <div class="add_product">
                <c:url var="addAction" value="/products/add"/>

                <form:form action="${addAction}" commandName="product" class="formEdit">
                    <h1>EDIT PRODUCT</h1>
                    <c:if test="${!empty product.productName}">
                        <form:label class="editInput" path="id">
                            <spring:message text="ID"/>
                        </form:label>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </c:if>

                    <form:input path="productName" name="productName" placeholder="NAME"/>

                    <form:input path="productManufacturer" name="productManufacturer" placeholder="MANUFACTURE"/>

                    <span class="ownerEdit">OWNER</span>

                    <select name="listOfOwners">
                        <option>Choose owner</option>
                        <c:forEach items="${listFullOwners}" var="listFullOwners">
                            <option value=${listFullOwners.id} >${listFullOwners.firstName.toString().replaceAll("[\\[\\]]","")}
                                    ${listFullOwners.lastName.toString().replaceAll("[\\[\\]]","")}
                            </option>
                        </c:forEach>
                    </select>

                    <form:input path="price" name="productPrice" placeholder="PRICE"/>
                    <form:input path="productDescription" name="productDescription" placeholder="DESCRIPTION"/>
                    <c:if test="${!empty product.productName}">
                        <input type="submit"
                               value="<spring:message text="EDIT PRODUCT"/>"/>
                    </c:if>
                    <c:if test="${empty product.productName}">
                        <input type="submit"
                               value="<spring:message text="ADD PRODUCT"/>"/>
                    </c:if>
                    <div class="battonCancel">
                        <a href="<c:url value="/products"/>" class="btnCancel">CANCEL</a>
                    </div>
                </form:form>
            </div>
        </div>
</div>

</body>
</html>
