<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Diary - Login</title>
<link href="resources/css/login.css" rel="stylesheet">
<script src="resources/js/jquery-1.9.1.min.js"></script>
<script src="resources/js/jquery.validate.js"></script>
<script src="resources/js/login.js"></script>
<script src="resources/js/bpopUp.js"></script>
<script src="resources/js/ForgotAccount.js"></script>
</head>
<body onload='document.loginForm.username.focus();'>

<!-- popUp forgot a password -->
<div id="firstPopUp" class="popUpLogin">
<h1>Please enter your email: </h1>
<div class="formEmail">
<button id="closeEmailForm" class="b-close" value="X"></button>
<input id="email" type="email" name="email" />
<input type="submit" onclick="resultOfForgotAccount()" value="Submit"/>
</div>
</div>

<div id="secondPopUp" class="popUpLogin">
<h1>Response:</h1>
<p id="responseEmail"></p>
<button id="closeEmailForm" class="b-close" value="X"></button>
</div>

    <div id="login">
       <c:if test="${not empty error}">
        <div class="error-login">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>
    
        <h1><a href="/DiaryClient/">${title}</a></h1>
        <form id="loginForm" name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST' role="form">
            <input id="username" type='text' name='username' placeholder='username' />
            <input id="password" type='password' name='password' placeholder="password" />
            <input name='submit' type='submit' value='Log in' /><br>
            <label><input type="checkbox" name="remember" class="checkbox"/> Remember me</label>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="register">Can't access your account? <a id="forgotAccount" href="#">Remind</a></div>
            <div class="register">Not registered yet? <a href="/DiaryClient/signup">Register here</a></div>
        </form>
    </div>
</body>
</html>