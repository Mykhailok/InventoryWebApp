<%--@elvariable id="_csrf" type="org.springframework.web.bind.MissingServletRequestParameterException"--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${contextPath}/resources/css/normalize.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/loginFonts.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/loginStyle.css">

    <title>Log in with your account</title>

    <%--<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="${contextPath}/resources/css/common.css" rel="stylesheet">--%>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

</head>

<body>
<div class="wrapper">
    <div class="container">
        <%--<form class="login-form">form-signin--%>
            <form method="POST" action="${contextPath}/login" class="login-form">
                <%--<h2 class="form-heading">Log in</h2>--%>

                <div class="form-group ${error != null ? 'has-error' : ''}">
                    <span>${message}</span>
                </div>
                        <h1>log in to your account</h1>
                        <input name="username" type="text" class="form-control" placeholder="USERNAME" autofocus="true"/>
                        <input name="password" type="password" class="form-control" placeholder="PASSWORD"/>
                        <span>${error}</span>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">log in</button>
                        <p class="message">Not registered? <a href="${contextPath}/registration">Create an account!</a></p>
                        <%--<input name="username" type="text" class="form-control" placeholder="Username"--%>
                               <%--autofocus="true"/>--%>
                        <%--<input name="password" type="password" class="form-control" placeholder="Password"/>--%>
                        <%--<span>${error}</span>--%>
                        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>

                        <%--<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>--%>
                        <%--<h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>--%>

            </form>
        <%--</form>--%>

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
    <!-- /container -->
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>
    <%--<script src="${contextPath}/resources/js/bootstrap.min.js"></script>--%>
</div>
</body>
</html>