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
                    <h1>EDIT A PRODUCT</h1>
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
                    <span class="owner">OWNER</span>
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
                               value="<spring:message text="Edit Product"/>"/>
                    </c:if>
                    <c:if test="${empty product.productName}">
                        <input type="submit"
                               value="<spring:message text="ADD"/>"/>
                    </c:if>
                </form:form>
            </div>
        </div>
    <%--<div class="wrapForm">
        <c:url var="addAction" value="/products/add"/>

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
                        <div class="wrapEditLabel">
                            <form:label path="productManufacturer">
                                <spring:message text="Manufacturer"/>
                            </form:label>
                        </div>
                    </td>
                    <td>
                        <form:input path="productManufacturer"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="wrapEditLabel">
                            <form:label path="owner_id">
                                <spring:message text="Owner"/>
                            </form:label>
                        </div>
                    </td>
                    <td>
                        <div class="wrapEditLabel">
                            <select name="listOfOwners">
                                <option>Choose owner</option>
                                <c:forEach items="${listFullOwners}" var="listFullOwners">
                                    <option value=${listFullOwners.id} >${listFullOwners.firstName.toString().replaceAll("[\\[\\]]","")}
                                            ${listFullOwners.lastName.toString().replaceAll("[\\[\\]]","")}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>


                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="wrapEditLabel">
                            <form:label path="price">
                                <spring:message text="Price"/>
                            </form:label>
                        </div>
                    </td>
                    <td>
                        <form:input path="price"/>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="wrapEditLabel">
                            <form:label path="productDescription">
                                <spring:message text="Description"/>
                            </form:label>
                        </div>
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
    </div>--%>
</div>

</body>
</html>
