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


    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleBackgroundMain.css">
    <%--<link rel="stylesheet" href="${contextPath}/resources/css/styleMainNav.css">--%>
    <link rel="stylesheet" href="${contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/styleLogin.css">

    <title>Log in with your account</title>

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
<div class="wrapper">
    <div class="container">
            <form method="POST" action="${contextPath}/login" class="login-form">
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
            </form>
    </div>
</div>
</body>
</html>