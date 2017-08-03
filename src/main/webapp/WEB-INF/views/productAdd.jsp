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
    <title>Add a product - Inventarium</title>
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
                        <a href="#" class="menu__link">
                            <div class="users_menu icon_menu"></div>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="#" class="menu__link">
                            <div class="owners_menu icon_menu"></div>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="#" class="menu__link">
                            <div class="admin_menu icon_menu"></div>
                        </a>
                    </li>
                    <li class="menu__item">
                        <a href="#" class="menu__link">
                            <div class="main_menu icon_menu"></div>
                        </a>
                    </li>
                </ul>
            </nav>
            <nav class="header__menu-drop menu-drop menu">
                <img class="main-menu__drop" src="/resources/images/menu_button.png" alt="menu">
                <ul class="menu-drop__list resp__menu">
                    <li class="menu-drop__item">
                        <a href="#" class="menu__link">
                            <div class="users_menu"></div>
                        </a>
                    </li>
                    <li class="menu-drop__item">
                        <a href="#" class="menu__link">
                            <div class="owners_menu"></div>
                        </a>
                    </li>
                    <li class="menu-drop__item">
                        <a href="#" class="menu__link">
                            <div class="admin_menu"></div>
                        </a>
                    </li>
                    <li class="menu-drop__item">
                        <a href="#" class="menu__link">
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
                    <h1>ADD A PRODUCT</h1>
                    <input type="text" name="productName" placeholder="NAME" required>
                    <input type="text" name="productManufacturer" placeholder="MANUFACTURE" required>
                    <input type="text" name="productOwner" placeholder="OWNER" required>
                    <select name="CHOOSE OWNER" form="add_product" required>
                        <option selected="selected">Choose Owner</option>
                        <option>user</option>
                    </select>
                    <input type="text" name="productPrice" placeholder="PRICE" required>
                    <input type="text" name="productDescription" placeholder="DESCRIPTION" required>
                </form:form>
                <button type="submit" form="add_product">ADD</button>
            </div>
        </div>
    </div>
<%--<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>--%>
<%--<script src="${contextPath}/resources/js/lodash.js"></script>--%>
<%--<script src="${contextPath}/resources/js/scriptProduct.js"></script>--%>
</body>
</html>
