<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.luxodrive.dao.BookingOpeartion" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>

<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myBooking.css">
</head>
<body>

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
                <a href="userDashboard.jsp" class="nav-item nav-link active">Home</a>
                <a href="cars.jsp" class="nav-item nav-link">Cars</a>
                <a href="booking.jsp" class="nav-item nav-link">Booking</a>
                <a href="services.jsp" class="nav-item nav-link">Services</a>
                <a href="services.jsp" class="nav-item nav-link">My Booking</a>
                <a href="aboutus.jsp" class="nav-item nav-link">Aboutus</a>
                <a href="contact.jsp" class="nav-item nav-link">Contact</a>
            </div>
            <a href="logout.jsp" class="logout-btn" onclick="return confirm('Are you sure you want to logout?');">
                Logout
            </a>
        </div>
    </nav>
    
    <!-- Navbar end -->

       <%
  
    // Get the logged-in userId from session
    
    User user = (User) session.getAttribute("loggedUser");
       

    List<Booking> bookings = new ArrayList<>();

    if (user != null) {
    	
    int userId = user.getUserId();
    	
        bookings = BookingOpeartion.getBookingsByUser(userId);
        
    }

    request.setAttribute("bookings", bookings); 
    %>
  

  

    <!-- ✅ Success / Error Messages -->
    <c:if test="${not empty successMsg}">
        <div class="alert-box success">
            ${successMsg}
        </div>
        <c:remove var="successMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty errorMsg}">
        <div class="alert-box error">
            ${errorMsg}
        </div>
        <c:remove var="errorMsg" scope="session"/>
    </c:if>

    <div class="list-container">
        <div class="header-row">
            <h1>My Booking</h1>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Booking Id</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Pickup Date</th>
                    <th>Pickup Time</th>
                    <th>Return Date</th>
                    <th>Driving Option</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Car</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="b" items="${bookings}">
                    <tr>
                        <td>${b.bookingId}</td>
                        <td>${b.pickupLocation}</td>
                        <td>${b.dropLocation}</td>
                        <td>${b.pickupDate}</td>
                        <td>${b.pickupTime}</td>
                        <td>${b.returnDate}</td>
                        <td>${b.drivingOption}</td>
                        <td>${b.totalAmount}</td>
                        <td>${b.status}</td>
                        <td>${b.car.carNo}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
