<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.luxodrive.jdbc.connection.DBConnection" %>
<%
    String fullName = (String) session.getAttribute("fullName");
    String email = (String) session.getAttribute("email");

    if(fullName == null || fullName.isEmpty()){ 
        fullName = "Guest"; 
    }

    // Fetch phone_no from DB
    String dbPhone = "";
    if(email != null && !email.isEmpty()){
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT phone_no FROM users WHERE email=?");
            ps.setString(1, email.trim());
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                dbPhone = rs.getString("phone_no");
            }
        } catch(Exception e){ e.printStackTrace(); }
    }
%>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top px-4 px-lg-5 py-lg-0">
    <a href="userDashboard.jsp" class="navbar-brand p-0">
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
            <a href="aboutus.jsp" class="nav-item nav-link">About Us</a>
            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
        </div>

        <div class="d-flex align-items-center">

            <!-- User Dropdown -->
            <div class="dropdown me-3">
                <button class="btn btn-link dropdown-toggle fw-bold text-primary p-0" 
                        type="button" 
                        id="userDropdown" 
                        data-bs-toggle="dropdown" 
                          data-bs-toggle="dropdown" 
            			data-bs-auto-close="outside"
                        aria-expanded="false"
                        style="text-decoration:none;">
                    👤 <%= fullName %>
                </button>
                <ul class="dropdown-menu dropdown-menu-end p-3" aria-labelledby="userDropdown" style="min-width: 230px;">
                    <li class="mb-2"><strong>Email:</strong> <%= email %></li>
                    <li class="mb-2"><strong>Phone:</strong> <%= dbPhone %></li>
                </ul>
            </div>

            <!-- Logout button -->
            <a href="logout.jsp" class="btn btn-danger" onclick="return confirm('Are you sure you want to logout?');">
                Logout
            </a>

        </div>
    </div>
</nav>

<!-- Bootstrap JS (required for dropdowns) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
