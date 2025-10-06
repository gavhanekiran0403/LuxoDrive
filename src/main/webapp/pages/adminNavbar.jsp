<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Navbar</title>

    <link rel="stylesheet" href="../css/adminDashboard.css">
</head>
<body>

	<!-- Sidebar start -->
	<div class="sidebar">
		<div class="logo">
			<img src="../images/luxodrive11-removebg-preview.png"
				alt="LuxoDrive Logo" height="50">
		</div>
		<ul class="menu">
			<li><a href="adminDashboard.jsp">Home</a></li>
			<li><a href="userList.jsp">User Management</a></li>
			<!-- <li><a href="#">Car Category Management</a></li> -->
			<li><a href="carList.jsp">Car Management</a></li>
			<li><a href="carOwnerList.jsp">Car Owner Management</a></li>
			<li><a href="driverList.jsp">Driver Management</a></li>
			<li><a href="bookingList.jsp">Booking Management</a></li>
			<li><a href="bankAccountList.jsp">Bank Account Management</a></li>
			<li><a href="#">Payment Management</a></li>
		</ul>
	</div>

	<!-- Sidebar End -->

	<!-- Top Navbar -->
	<div class="topbar">
		<div class="search-box">
			<!-- <input type="text" placeholder="Type in to Search..."> -->
		</div>
		<div class="profile-section">
    			<a class="nav-link" href="adminNotifications.jsp">Notifications</a>
        				<%-- <% if(unreadCount > 0){ %>
            				<span class="badge"><%= unreadCount %></span>
        				<% } %> --%>
    			
            <span class="username"><%= session.getAttribute("fullName") != null ? session.getAttribute("fullName") : "Admin" %></span>
            <a href="logout.jsp" class="logout-btn" onclick="return confirm('Are you sure you want to logout?');">
                Logout
            </a>
        </div>
	</div>

</body>
</html>