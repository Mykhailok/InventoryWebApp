<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>User Page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <style type="text/css">
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

        input {
            width: 200px;
        }
        select {
            width: 206px;
        }

    </style>
</head>
<body>
<a href="${contextPath}/InventoryWebApp">Back to main menu</a>
<br/>
<br/>
<a href="${contextPath}/admin/">Admin</a>
<br/>
<br/>
<a href="${contextPath}/products/">Products</a>
<br/>
<br/>
<a href="${contextPath}/owners/">Owners</a>


<h1>User List</h1>



<c:if test="${!empty listUsers}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Username</th>
            <th width="120">Role</th>
            <th width="60">Edit</th>
            <th width="120">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="${contextPath}/userdata/${user.id}" target="_blank">${user.username}</a></td>
                <td>${user.roles.toString().replaceAll("[\\[\\]]","")}</td>
                <td><a href="<c:url value='/editUser/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/removeUser/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add a User</h1>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${empty user.username}">
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

            <tr>
                <td>
                    <form:label path="username">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="username"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="password">
                        <spring:message text="password"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="password"/>
                </td>
            </tr>
            <tr>
                </c:if>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.username}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"
                </c:if>
                <c:if test="${empty user.username}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
