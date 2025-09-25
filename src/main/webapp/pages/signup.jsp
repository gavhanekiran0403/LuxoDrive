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

    <!-- signup-form section start -->

    <div class="signup-image">

        <div class="signup-container">
            <h2>Create Account</h2>
            <!-- JSTL error message display -->
    		<c:if test="${not empty signupErrorMsg}">
        		<div class="custom-error">${signupErrorMsg}</div>
    		</c:if>
            <form action="signupProcess.jsp" method="post">
                <div class="form-page">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullName" placeholder="Enter your full name" required />
                </div>
                <div class="form-page">
                    <label for="phoneNo">Phone No.</label>
                    <input type="text" id="phoneNo" name="phoneNo" placeholder="Enter your phone number" required />
                </div>
                <div class="form-page">
                    <label for="Email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required />
                </div>
                <div class="form-page">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                </div>
                <div class="form-page">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Enter your confirm password" required />
                </div>

                <button type="submit">Sing Up</button>
                <p class="signup-link">Already have account? <a href="login.jsp">Log In</a></p>
            </form>
        </div>
    </div>

    <!-- signup-form section end -->

</body>

</html>