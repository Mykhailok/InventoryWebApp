<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Owner Page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
    <a href="../../index.jsp">Back to main menu</a>
    <br/>
    <br/>

    <h1>Owner List</h1>

    <c:if test="${!empty listOwners}">
        <table class="tg">
            <tr>
                <th width="80">ID</th>
                <th width="120">First Name</th>
                <th width="120">Last Name</th>
                <th width="60">Edit</th>
                <th width="120">Delete</th>
            </tr>
            <c:forEach items="${listOwners}" var="owner">
                <tr>
                    <td>${owner.id}</td>
                    <td>${owner.firstName}</td>
                    <td><a href="/ownerdata/${owner.id}" target="_blank">${owner.lastName}</a></td>
                    <td><a href="<c:url value='/editOwner/${owner.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/removeOwner/${owner.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>


    <%--<select name="listOfOwners">--%>
        <%--<option>Выберите владельца</option>--%>
        <%--<c:forEach items="${listOwners}" var="listOwners">--%>
            <%--<option value=${listOwners.id} >${listOwners.firstName}--%>
                                            <%--${listOwners.lastName}--%>
            <%--</option>--%>
        <%--</c:forEach>--%>
    <%--</select>--%>



    <h1>Add an Owner</h1>

    <c:url var="addAction" value="/owners/add"/>

    <form:form action="${addAction}" commandName="owner">
        <table>
            <c:if test="${!empty owner.lastName}">
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
                    <form:label path="firstName">
                        <spring:message text="First Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="firstName"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="lastName">
                        <spring:message text="Last Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="lastName"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <c:if test="${!empty owner.lastName}">
                        <input type="submit"
                               value="<spring:message text="Edit Owner"/>"/>
                    </c:if>
                    <c:if test="${empty owner.lastName}">
                        <input type="submit"
                               value="<spring:message text="Add Owner"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>
