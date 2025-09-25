<%@page import="com.luxodrive.model.BankAccount"%>
<%@page import="com.luxodrive.dao.BankAccountOperation"%>
<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@page import="com.luxodrive.model.Car"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.dao.CarOperation"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LuxoDrive - Admin Dashboard</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../css/adminDashboard.css">
</head>
<body>

<jsp:include page="adminNavbar.jsp"></jsp:include>
<%
	List<Car> cars = CarOperation.getAllCars();
	int totalCars = (cars != null) ? cars.size() : 0;
	request.setAttribute("totalCars", totalCars);
	
	List<CarOwner> carOwners = CarOwnerOperation.getAllCarOwner();
	int totalOwners = (carOwners != null) ? carOwners.size() : 0;
	request.setAttribute("totalOwners", totalOwners);
	
	List<BankAccount> bankAccounts = BankAccountOperation.getAllBankAccount();
	int totalBankAccounts = (bankAccounts != null) ? bankAccounts.size() : 0;
	request.setAttribute("totalBankAccounts", totalBankAccounts);

%>
<div class="content">
	<div class="heading-dashboard">
		<h2>Admin Dashboard</h2>
	</div>
		<!-- Quick stats -->
	<div class="card-section users">
		<div class="card-body">
			<a href="#">
				<h6>Users</h6>
				<h3>Total Users : <c:out value="${totalUsers != null ? totalUsers : 0}"/></h3>
			</a>
		</div>
	</div>

	<div class="card-section categories">
		<div class="card-body">
			<a href="#">
				<h6>Categories</h6>
				<h3>Total Categories : <c:out value="${totalCategories != null ? totalCategories : 0}"/></h3>
			</a>
		</div>
	</div>
	
	<div class="card-section cars">
		<div class="card-body">
			<a href="carList.jsp">
				<h6>Cars</h6>
				<h3>Total Cars : <c:out value="${totalCars}"/></h3>
			</a>
		</div>
	</div>

	<div class="card-section owners">
		<div class="card-body">
			<a href="carOwnerList.jsp">
				<h6>Car Owners</h6>
				<h3>Total Car Owners : <c:out value="${totalOwners}"/></h3>
			</a>
		</div>
	</div>

	<div class="card-section drivers">
		<div class="card-body">
			<a href="#">
				<h6>Drivers</h6>
				<h3>Total Drivers : <c:out value="${totalDrivers != null ? totalDrivers : 0}"/></h3>
			</a>
		</div>
	</div>

	<div class="card-section bookings">
		<div class="card-body">
			<a href="#">
				<h6>Bookings</h6>
				<h3>Total Bookings : <c:out value="${totalBookings != null ? totalBookings :0}"/></h3>
			</a>
		</div>
	</div>
	
	<div class="card-section bankAccounts">
		<div class="card-body">
			<a href="#">
				<h6>Bank Accounts</h6>
				<h3>Total Bank Accounts : <c:out value="${totalBankAccounts != null ? totalBankAccounts : 0}"/></h3>
			</a>
		</div>
	</div>
</div>
</body>
</html>
