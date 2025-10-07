<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.dao.UserOperation"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar Page</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/userDashboard.css">
</head>
<body>
<%
    String email = (String) session.getAttribute("email");
    User user = null;

    if(email != null && !email.isEmpty()){
        user = UserOperation.getUserByEmail(email);
    }
    
    User loggedUser = (User) session.getAttribute("loggedUser");
	request.setAttribute("loggedUser", loggedUser);
%>

	<!-- Navbar start -->
    
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top px-4 px-lg-5 py-lg-0">
        <a href="#" class="navbar-brand p-0">
            <img src="../images/luxodrive11-removebg-preview.png" alt="LuxoDrive Logo" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    <span class="fa fa-bars"></span>
  </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
    			<c:choose>
    				<c:when test="${empty sessionScope.loggedUser}">
        			<a href="home.jsp" class="nav-item nav-link active">Home</a>
        			<a href="services.jsp" class="nav-item nav-link">Services</a>
        			<a href="aboutus.jsp" class="nav-item nav-link">About Us</a>
        			<a href="contact.jsp" class="nav-item nav-link">Contact</a>
    			</c:when>

    			<c:otherwise>
        			<a href="userDashboard.jsp" class="nav-item nav-link active">Home</a>
        			<a href="cars.jsp" class="nav-item nav-link">Cars</a>
        			<a href="myBooking.jsp" class="nav-item nav-link">My Bookings</a>
        			<a href="services.jsp" class="nav-item nav-link">Services</a>
        			<a href="aboutus.jsp" class="nav-item nav-link">About Us</a>
        			<a href="contact.jsp" class="nav-item nav-link">Contact</a>
        			<a href="userNotification.jsp" class="nav-item nav-link">Notifications</a>
           	</div>

           	<div class="d-flex align-items-center">
    			<% if(user != null){ %>
    				<a href="userProfile.jsp" class="username-badge me-3">
        				<i class="fa fa-user-circle"></i> <%= user.getFullName() %>
    				</a>
				<% } else { %>
    				<a href="login.jsp" class="btn btn-outline-primary me-3">Login</a>
				<% } %>

            		<a href="logout.jsp" class="logout-btn" onclick="return confirm('Are you sure you want to logout?');">
                Logout
            </a>
        </div>
    </c:otherwise>
</c:choose>
    </nav>
    
    <!-- Navbar end -->
    
</body>
</html>