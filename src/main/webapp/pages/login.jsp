<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Car Rental - LuxoDrive</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
</head>

<body>

    <!-- login-form section start -->

    <div class="login-image">
        <div class="login-container">
            <h2>Login</h2>
            <!-- Error / Success messages -->
            <c:if test="${not empty sessionScope.loginErrorMsg}">
                <div class="custom-error">${sessionScope.loginErrorMsg}</div>
                <c:remove var="loginErrorMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty sessionScope.signupSuccessMsg}">
                <div class="custom-success">${sessionScope.signupSuccessMsg}</div>
                <c:remove var="signupSuccessMsg" scope="session"/>
            </c:if>
            <form action="loginProcess.jsp" method="post">
                <div class="form-page">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="email" placeholder="Enter your username" required />
                </div>

                <div class="form-page">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                </div>
				<div class="btn-login">
					<button type="submit">Log In</button>
				</div>
                <!-- <p class="forgot-password"><a href="forgotpass.html">Forgot Password?</a></p> -->

                <p class="signup-link">
                    Don't have an account? <a href="signup.jsp">Sign Up</a>
                </p>
            </form>
        </div>
    </div>

    <!-- login-form section end -->

</body>

</html>