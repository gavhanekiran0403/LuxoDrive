<%@page import="com.luxodrive.model.Driver"%>
<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driver Form Page</title>
<link rel="stylesheet" type="text/css" href="../css/driverForm.css">
</head>
<body>
	<jsp:include page="adminNavbar.jsp"></jsp:include>

<%
	String driverIdStr = request.getParameter("driverId");
	int driverId = 0;
	if(driverIdStr != null){
		driverId = Integer.parseInt(driverIdStr);
	}
	
	Driver driver = DriverOperation.getDriverById(driverId);
	request.setAttribute("driver", driver);
%>
	<div class="form-container">
		
		<c:choose>
			<c:when test="${driver != null }">
				<h1>Update Driver</h1>
			</c:when>
			<c:otherwise>
				<h1>Add New Driver</h1>
			</c:otherwise>
		</c:choose>
		
		<!-- Add enctype for file uploads -->
		<form action="driverFormProcess.jsp" method="post">
			<div class="card-grid">
				
				<!-- driver details -->
				<div class="driver-section">
					<h2>Driver Details</h2>
					
					<c:if test="${driver != null }">
						<input type="hidden" name="driverId" value="${driver.driverId }">
					</c:if>
					
					<label>Full Name :</label>
					<input type="text" name="fullName" value="${driver.fullName }" placeholder="Enter the Full Name" required>
					
					<label>License No :</label>
					<input type="text" name="licenseNo" value="${driver.licenseNo }" placeholder="Enter the License No" required>
				
					<label>Phone No. :</label>
					<input type="tel" name="phoneNo" value="${driver.phoneNo }" placeholder="Enter the phone number" required>
				
					<label>Email :</label>
					<input type="email" name="email" value="${driver.email }" placeholder="Enter the email" required>
				
					<label>Address :</label>
					<input type="text" name="address" value="${driver.address }"placeholder="Enter the address">
					
				</div>
			
				<!-- Bank details -->
				<div class="bank-section">
					<h2>Bank Account Details</h2>
				
					<c:if test="${driver != null }">
						<input type="hidden" name="bankAccId" value="${driver.bankAccount.bankAccId }">
					</c:if>
					
					<label>Bank Name :</label>
					<input type="text" name="bankName" value="${driver.bankAccount.bankName }" placeholder="Enter the bank name" required>
				
					<label>Account Number :</label>
					<input type="text" name="accountNo" value="${driver.bankAccount.accountNo }" placeholder="Enter the account number" required>
				
					<label>IFSC No. :</label>
					<input type="text" name="ifscNo" value="${driver.bankAccount.ifscNo }" placeholder="Enter the IFSC number" required>
				</div>
			</div>
			
			<button type="submit">Submit</button>	
		</form>
	</div>
</body>
</html>