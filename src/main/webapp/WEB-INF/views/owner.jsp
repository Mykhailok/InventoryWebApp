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
    <title>Owner Page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleBackgroundMain.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleMainNav.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleOwners.css">

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
        <%--<a href="<c:url value="/owners"/>" class="main-nav-link owners">Owners</a>--%>
        <a href="<c:url value="/users"/>" class="main-nav-link users">Users</a>
    </nav>
    <div class="center">
        <div class="wrapTables">
        <%--<h1>Owner List</h1>--%>

        <c:if test="${!empty listOwners}">
            <table id="gridOwner" class="tableOwner">
                <thead class="thead" id="theadOwner">
                    <tr>
                        <th >ID</th>
                        <th >First Name</th>
                        <th >Last Name</th>
                        <th >Edit</th>
                        <th >Del</th>
                    </tr>
                    <tr></tr>
                </thead>
                <tbody class="tbody" id="tbodyOwner">
                    <c:forEach items="${listOwners}" var="owner">
                        <tr>
                            <td>${owner.id}</td>
                            <td>${owner.firstName}</td>
                            <td>
                                <a href="${contextPath}/ownerdata/${owner.id}" target="_blank">${owner.lastName}</a>
                            </td>
                            <td>
                                <div class="wrapSquaredBut">
                                    <a href="<c:url value='/editOwner/${owner.id}'/>" class="btnEd" >Edit</a>
                                </div>
                            </td>
                            <td>
                                <div class="wrapSquaredBut">
                                    <a href="<c:url value='/removeOwner/${owner.id}'/>" class="btnDel">Del</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        </div>
        <%--надо сделать привязки--%>
<div class="wrapForm">
        <form action="" class="formAdd formAddOwner">
            <h1>Add an Owner</h1>
            <%--<input type="text" id="idOwner" placeholder="id Owner" disabled="true">--%>
            <input type="text" id="firstNameOwner" placeholder="First Name">
            <input type="text" id="lastNameOwner" placeholder="Last Name">
            <input type="submit" value="ADD OWNER">
        </form>
</div>


        <%--<h1>Add an Owner</h1>--%>
        <%--<c:url var="addAction" value="/owners/add"/>--%>
        <%--<form:form action="${addAction}" commandName="owner">--%>
            <%--<table>--%>
                <%--<c:if test="${!empty owner.lastName}">--%>
                    <%--<tr>--%>
                        <%--<td>--%>
                            <%--<form:label path="id">--%>
                                <%--<spring:message text="ID"/>--%>
                            <%--</form:label>--%>
                        <%--</td>--%>
                        <%--<td>--%>
                            <%--<form:input path="id" readonly="true" size="8" disabled="true"/>--%>
                            <%--<form:hidden path="id"/>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</c:if>--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<form:label path="firstName">--%>
                            <%--<spring:message text="First Name"/>--%>
                        <%--</form:label>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<form:input path="firstName"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<form:label path="lastName">--%>
                            <%--<spring:message text="Last Name"/>--%>
                        <%--</form:label>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<form:input path="lastName"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td colspan="2">--%>
                        <%--<c:if test="${!empty owner.lastName}">--%>
                            <%--<input class="add_User" type="submit"--%>
                                   <%--value="<spring:message text="Edit Owner"/>"/>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${empty owner.lastName}">--%>
                            <%--<input class="add_User" type="submit"--%>
                                   <%--value="<spring:message text="Add Owner"/>"/>--%>
                        <%--</c:if>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</table>--%>
        <%--</form:form>--%>
    </div>
</div>
</body>
</html>
