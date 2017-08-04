<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">

      <title>Admin</title>

      <link rel="stylesheet" href="${contextPath}/resources/css/buttonFonts.css">
      <link rel="stylesheet" href="${contextPath}/resources/css/buttonStyle320.css">
      <link rel="stylesheet" href="${contextPath}/resources/css/buttonStyle480.css">
      <link rel="stylesheet" href="${contextPath}/resources/css/buttonStyle768.css">
      <link rel="stylesheet" href="${contextPath}/resources/css/normalize.css">
  </head>

  <body>
  <div class="container">
      <c:if test="${pageContext.request.userPrincipal.name != null}">
          <form id="logoutForm" method="post" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>
          <%--<h6> ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()"></a>--%>
          <%--</h6>--%>
      </c:if>
  </div>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <script src="${contextPath}/resources/js/bootstrap.min.js"></script>

  <div class="container">
      <div class="button users"><a href="${contextPath}/users/"><img src="${contextPath}/resources/images/user.png" alt=""></a><h1>USERS</h1></div>
      <div class="button owners"><a href="${contextPath}/owners/"><img src="${contextPath}/resources/images/owner.png" alt=""></a><h1>OWNERS</h1></div>
      <div class="button admin"><a href="${contextPath}/products/"><img src="${contextPath}/resources/images/products.png" alt=""></a><h1>PRODUCTS</h1></div>
      <div class="button main_menu"><a href="<c:url value="/"/>"><img src="${contextPath}/resources/images/main_menu4.png" alt=""></a><h1>MAIN MENU</h1></div>
  </div>

  <div class="backgrount-icons">
      <i class="icon__one"></i>
      <i class="icon__two"></i>
      <i class="icon__three"></i>
      <i class="icon__four"></i>
      <i class="icon__five"></i>
      <i class="icon__six"></i>
      <i class="icon__seven"></i>
      <i class="icon__eight"></i>
      <i class="icon__nine"></i>
      <i class="icon__ten"></i>
      <i class="icon__eleven"></i>
      <i class="icon__twelve"></i>
      <i class="icon__thirteen"></i>
      <i class="icon__fourteen"></i>
      <i class="icon__fifteen"></i>
      <i class="icon__sixteen"></i>
      <i class="icon__seventeen"></i>
      <i class="icon__eighteen"></i>
      <i class="icon__nineteen"></i>
  </div>

  </body>
</html>