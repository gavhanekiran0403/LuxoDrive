<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.model.Driver"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@page import="com.luxodrive.model.CarOwner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    CarOwner carOwner = null;
    Driver driver = null;

    String ownerIdStr = request.getParameter("ownerId");
    if(ownerIdStr != null) {
        int ownerId = Integer.parseInt(ownerIdStr);
        carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
        request.setAttribute("carOwner", carOwner);
    }

    String driverIdStr = request.getParameter("driverId");
    if(driverIdStr != null) {
        int driverId = Integer.parseInt(driverIdStr);
        driver = DriverOperation.getDriverById(driverId);
        request.setAttribute("driver", driver);
    }
%>

<div class="bank-container">

    <c:if test="${not empty carOwner}">
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
        </div>
    </c:if>

    <c:if test="${not empty driver}">
        <div class="bank-card">
            <h2>Driver Bank Details</h2>
            <div class="detail">
                <span>Account Holder Name</span>
                <strong>${driver.fullName}</strong>
            </div>
            <div class="detail">
                <span>Bank Name</span>
                <strong>${driver.bankAccount.bankName}</strong>
            </div>
            <div class="detail">
                <span>Account Number</span>
                <strong>${driver.bankAccount.accountNo}</strong>
            </div>
            <div class="detail">
                <span>IFSC Code</span>
                <strong>${driver.bankAccount.ifscNo}</strong>
            </div>
        </div>
    </c:if>

    <a href="carOwnerList.jsp" class="btn-back">Back to List</a>
</div>

</body>
</html>
