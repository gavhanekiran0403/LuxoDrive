<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/paymentDetails.css">
</head>
<body>
<jsp:include page="userNavbar.jsp" />

<div class="payment-container">
    <h2>Payment Details</h2>

    <!-- Car Summary -->
    <div class="car-summary">
        <h3>${car.modelName}</h3>
        <p>${car.seats} Seats | ${car.fuelType} | ${car.carYearModel} Model</p>
        <p>Car No: ${car.carNo}</p>
        <p>Rent per Day: <strong>₹${car.rent}</strong></p>
    </div>

    <!-- Options -->
    <form action="confirmBooking" method="post">
        <input type="hidden" name="carId" value="${car.carId}" />
        <input type="hidden" name="pickupDate" value="${pickupDate}" />
        <input type="hidden" name="pickupTime" value="${pickupTime}" />

        <div class="options">
            <label class="option-card">
                <input type="radio" name="drivingOption" value="self" checked>
                <div class="option-content">
                    <h4>Self Drive</h4>
                    <p>You drive the car yourself.</p>
                    <p class="price">₹ ${car.rent}</p>
                </div>
            </label>

            <label class="option-card">
                <input type="radio" name="drivingOption" value="with-driver">
                <div class="option-content">
                    <h4>With Driver</h4>
                    <p>Car rent + driver charge included.</p>
                    <p class="price">₹ ${car.rent + driverCharge}</p>
                </div>
            </label>
        </div>

        <!-- Proceed button -->
        <div class="actions">
            <button type="submit" class="btn-primary">Proceed to Pay</button>
        </div>
    </form>
</div>

</body>
</html>
