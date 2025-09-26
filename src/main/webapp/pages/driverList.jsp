<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.model.Driver"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driver List</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/driverList.css">
</head>
<body>

	<jsp:include page="adminNavbar.jsp"></jsp:include>
<%

		List<Driver> drivers = DriverOperation.getAllDrivers();
		request.setAttribute("drivers", drivers); 
		
		System.out.println(drivers);


	%>
	<div class="list-container">
		<div class="header-row">
		
		<a href="driverForm.jsp" class="btn">Add New Driver</a>
            <h1>Driver List</h1>
            
        </div>
		<table>
		<thead>
			<tr>
				<th>Driver Id</th>
				<th>Full Name</th>
				<th>License No</th>
				<th>Phone No</th>
				<th>Email</th>
				<th>Address</th>
				<th>Bank Account</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		
		
		
			<c:forEach var="driver" items="${drivers}">
			<tr>
				<td>${driver.driverId}</td>
				<td>${driver.fullName}</td>
				<td>${driver.licenseNo}</td>
				<td>${driver.phoneNo}</td>
				<td>${driver.email}</td>
				<td>${driver.address}</td>
				<td>${driver.bankAccount.accHolderName}</td>
				
				<td>
					   <a class="link-update" href="driverForm.jsp?driverId=${driver.driverId}">Update</a> | 
                        <a class="link-delete" href="delete.jsp?driverId=${driver.driverId}">Delete</a>
                </td>      
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>