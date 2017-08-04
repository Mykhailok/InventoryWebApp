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
    <link rel="stylesheet" href="/resources/css/style_add_product.css">
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
    </div>
<c:forEach items="${listProducts}" var="product">
</c:forEach>
<div class="container">
    <header class="header">
            <nav class="menu">
                <ul class="menu__list resp__menu">
                    <li class="menu__item">
                        <a href="<c:url value="/users"/>" class="menu__link">
                            <div class="users_menu icon_menu"></div>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="<c:url value="/owners"/>" class="menu__link">
                            <div class="owners_menu icon_menu"></div>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="<c:url value="/admin"/>" class="menu__link">
                            <div class="admin_menu icon_menu"></div>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="<c:url value="/"/>" class="menu__link">
                            <div class="main_menu icon_menu"></div>
                        </a>
                    </li>
                </ul>
            </nav>
            <nav class="header__menu-drop menu-drop menu">
                <img class="main-menu__drop" src="/resources/images/menu_button.png" alt="menu">
                <ul class="menu-drop__list resp__menu">
                    <li class="menu-drop__item">
                        <a href="<c:url value="/users"/>" class="menu__link">
                            <div class="users_menu"></div>
                        </a>
                    </li>
                    <li class="menu-drop__item">
                        <a href="<c:url value="/owners"/>" class="menu__link">
                            <div class="owners_menu"></div>
                        </a>
                    </li>
                    <li class="menu-drop__item">
                        <a href="<c:url value="/admin"/>" class="menu__link">
                            <div class="admin_menu"></div>
                        </a>
                    </li>
                    <li class="menu-drop__item">
                        <a href="<c:url value="/"/>" class="menu__link">
                            <div class="main_menu"></div>
                        </a>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="content__container">
            <div class="add_product">
                <c:url var="addAction" value="/products/add"/>
                <%--<form id="add_product" action="#">--%>
                <form:form action="${addAction}" commandName="product" class="formEdit">
                    <h1>EDIT PRODUCT</h1>
                    <c:if test="${!empty product.productName}">
                        <form:label class="editInput" path="id">
                            <spring:message text="ID"/>
                        </form:label>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </c:if>
                    <%--<input type="text" name="productName" placeholder="NAME" required>--%>
                    <form:input path="productName" name="productName" placeholder="NAME"/>
                    <%--<input type="text" name="productManufacturer" placeholder="MANUFACTURE" required>--%>
                    <form:input path="productManufacturer" name="productManufacturer" placeholder="MANUFACTURE"/>
                    <%--<input type="text" name="productOwner"  placeholder="OWNER" required>--%>
                    <span class="ownerEdit">OWNER</span>
                    <%--<select name="CHOOSE OWNER" form="add_product" required>--%>
                        <%--<option selected="selected">Choose Owner</option>--%>
                        <%--<option>user</option>--%>
                    <%--</select>--%>
                    <select name="listOfOwners">
                        <option>Choose owner</option>
                        <c:forEach items="${listFullOwners}" var="listFullOwners">
                            <option value=${listFullOwners.id} >${listFullOwners.firstName.toString().replaceAll("[\\[\\]]","")}
                                    ${listFullOwners.lastName.toString().replaceAll("[\\[\\]]","")}
                            </option>
                        </c:forEach>
                    </select>
                    <%--<input type="text" name="productPrice" placeholder="PRICE" required>--%>
                    <form:input path="price" name="productPrice" placeholder="PRICE"/>
                    <%--<input type="text" name="productDescription" placeholder="DESCRIPTION" required>--%>
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
                        <a href="<c:url value="${contextPath}/products"/>" class="btnCancel">CANCEL</a>
                    </div>
                </form:form>
            </div>
        </div>
</div>

</body>
</html>
