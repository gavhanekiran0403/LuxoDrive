<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@page import="com.luxodrive.model.CarOwner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bank Details</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carOwnerList.css">
</head>
<body>

<jsp:include page="adminNavbar.jsp"></jsp:include>

<%
    String ownerIdStr = request.getParameter("id");
    CarOwner carOwner = null;
    if(ownerIdStr != null) {
        int ownerId = Integer.parseInt(ownerIdStr);
        carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
    }
    request.setAttribute("carOwner", carOwner);
%>

<div class="bank-container">
    <div class="bank-card">
        <h2>Car Owner Bank Details</h2>
        
        <div class="detail">
            <span>Account Holder Name</span>
            <strong>${carOwner.ownerName}</strong>
        </div>
        <div class="detail">
            <span>Bank Name</span>
            <strong>${carOwner.bankAccount.bankName}</strong>
        </div>
        <div class="detail">
            <span>Account Number</span>
            <strong>${carOwner.bankAccount.accountNo}</strong>
        </div>
        <div class="detail">
            <span>IFSC Code</span>
            <strong>${carOwner.bankAccount.ifscNo}</strong>
        </div>

        <a href="carOwnerList.jsp" class="btn-back">Back to List</a>
    </div>
</div>

</body>
</html>