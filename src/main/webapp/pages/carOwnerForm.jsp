<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Owner Form Page</title>
<link rel="stylesheet" type="text/css" href="../css/carOwnerForm.css">
</head>
<body>

<jsp:include page="adminNavbar.jsp"></jsp:include>

<%
	String ownerIdStr = request.getParameter("ownerId");
	int ownerId = 0;
	if(ownerIdStr != null){
		ownerId = Integer.parseInt(ownerIdStr);
	}
	
	CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
	request.setAttribute("carOwner", carOwner);
%>
	<div class="form-container">
		
		<c:choose>
			<c:when test="${carOwner != null }">
				<h1>Update Car Owner</h1>
			</c:when>
			<c:otherwise>
				<h1>Add Car Owner</h1>
			</c:otherwise>
		</c:choose>
		
		<!-- Add enctype for file uploads -->
		<form action="carOwnerFormProcess.jsp" method="post" enctype="multipart/form-data">
			<div class="card-grid">
				
				<!-- Owner details -->
				<div class="owner-section">
					<h2>Car Owner Details</h2>
					
					<c:if test="${carOwner != null }">
						<input type="hidden" name="ownerId" value="${carOwner.ownerId }">
					</c:if>
					
					<label>Owner Name :</label>
					<input type="text" name="ownerName" value="${carOwner.ownerName }" placeholder="Enter the owner name" required>
				
					<label>Phone No. :</label>
					<input type="tel" name="phoneNo" value="${carOwner.phoneNo }" placeholder="Enter the phone number" required>
				
					<label>Email :</label>
					<input type="email" name="email" value="${carOwner.email }" placeholder="Enter the email" required>
				
					<label>Address :</label>
					<input type="text" name="address" value="${carOwner.address }"placeholder="Enter the address">
				
					<div class="file-container">
						<label>Aadhar Card Photo :</label>
						<c:if test="${carOwner != null && carOwner.aadharImage != null }">
							<img src="viewImage.jsp?id=${carOwner.ownerId}" 
                             alt="Aadhar Card" width="120" height="80"/>
						</c:if>
						<input type="file" name="aadharImage" accept="image/*">
					</div>
				</div>
			
				<!-- Bank details -->
				<div class="bank-section">
					<h2>Bank Account Details</h2>
				
					<c:if test="${carOwner != null }">
						<input type="hidden" name="bankAccId" value="${carOwner.bankAccount.bankAccId }">
					</c:if>
					
					<label>Bank Name :</label>
					<input type="text" name="bankName" value="${carOwner.bankAccount.bankName }" placeholder="Enter the bank name" required>
				
					<label>Account Number :</label>
					<input type="text" name="accountNo" value="${carOwner.bankAccount.accountNo }" placeholder="Enter the account number" required>
				
					<label>IFSC No. :</label>
					<input type="text" name="ifscNo" value="${carOwner.bankAccount.ifscNo }" placeholder="Enter the IFSC number" required>
				</div>
			</div>
			
			<button type="submit">Submit</button>	
		</form>
	</div>
</body>
</html>