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
    <title>User Page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleBackgroundMain.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleMainNav.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleUsers.css">

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
        <a href="<c:url value="/owners"/>" class="main-nav-link owners">Owners</a>
        <%--<a href="<c:url value="/users"/>" class="main-nav-link users">Users</a>--%>
    </nav>
    <div class="center">
        <div class="wrapTables">
            <%--<h1>User List</h1>--%>
            <c:if test="${!empty listUsers}">
            <table id="gridUser" class="tableOwner tableUsers ">
                <thead class="thead" id="theadUsers">
                        <tr>
                            <th >ID</th>
                            <th >Username</th>
                            <th >Role</th>
                            <th >Edit</th>
                            <th >Delete</th>
                        </tr>
                        <tr></tr>
                </thead>
                <tbody class="tbody" id="tbodyUsers">
                    <c:forEach items="${listUsers}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>
                                <a href="${contextPath}/userdata/${user.id}" target="_blank">${user.username}</a>
                            </td>
                            <td>${user.roles.toString().replaceAll("[\\[\\]]","")}</td>
                            <td>
                                <div class="wrapSquaredBut">
                                    <a href="<c:url value='/editUser/${user.id}'/>" class="btnEd">Edit</a>
                                </div>
                            </td>
                            <td>
                                <div class="wrapSquaredBut">
                                    <a href="<c:url value='/removeUser/${user.id}'/>" class="btnDel">Del</a>
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
                <h1>Add a User</h1>
                <input type="text" id="idUser" placeholder="id Owner" disabled="true">
                <input type="text" id="nameUser" placeholder="Name User">
                <input type="text" id="passwordUser" placeholder="Password">
                <input type="submit" value="ADD USER">
            </form>
        </div>

        <%--<c:url var="addAction" value="/users/add"/>--%>

    <%--<form:form action="${addAction}" commandName="user">--%>
        <%--<table>--%>
            <%--<c:if test="${empty user.username}">--%>
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

            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="username">--%>
                        <%--<spring:message text="Name"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="username"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="password">--%>
                        <%--<spring:message text="password"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="password"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--</c:if>--%>
            <%--<tr>--%>

                <%--<td colspan="2">--%>
                    <%--<c:if test="${!empty user.username}">--%>
                        <%--<input class="add_User" type="submit"--%>
                               <%--value="<spring:message text="Edit User"/>"--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${empty user.username}">--%>
                        <%--<input class="add_User" type="submit"--%>
                               <%--value="<spring:message text="Add User"/>"--%>
                    <%--</c:if>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</form:form>--%>
</div>
</div>
</body>
</html>
