<%@page import="com.luxodrive.model.Car"%>
<%@page import="com.luxodrive.dao.CarOperation"%>
<%@page import="com.luxodrive.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="userNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Page</title>
<link rel="stylesheet" href="../css/booking.css">
</head>
<body>

<%
    String pickupLocation = request.getParameter("pickupLocation");
    String dropLocation = request.getParameter("dropLocation");
    String pickupDate = request.getParameter("pickupDate");
    String pickupTime = request.getParameter("pickupTime");
    String carIdStr = request.getParameter("carId");

    Car car = null;
    if (carIdStr != null && !carIdStr.isEmpty()) {
        int carId = Integer.parseInt(carIdStr);
        car = CarOperation.getCarById(carId);
    }

    if (car == null) {
        response.sendRedirect("cars.jsp");
        return;
    }

    User user = (User) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int driverCharge = 500;
%>

<div class="booking-container">
<form action="bookingProcess.jsp" method="post" enctype="multipart/form-data">
    <div class="booking-card">

        <!-- Customer Details -->
        <div class="customer-section">
            <h2>Contact Details</h2>
            <label>Full Name</label>
            <input type="text" name="fullName" value="<%= user.getFullName() %>" required>

            <label>Email</label>
            <input type="email" name="email" value="<%= user.getEmail() %>" required>

            <label>Phone</label>
            <input type="tel" name="phone" value="<%= user.getPhoneNo() %>" required>
        </div>

        <!-- Booking Details -->
        <div class="booking-section">
            <h2>Booking Details</h2>

            <label>Pick-up Location</label>
            <input type="text" name="pickupLocation" value="<%= pickupLocation %>" required>

            <label>Drop Location</label>
            <input type="text" name="dropLocation" value="<%= dropLocation %>" required>

            <label>Pick-up Date</label>
            <input type="date" id="pickupDate" name="pickupDate" value="<%= pickupDate %>" required>

            <label>Pick-up Time</label>
            <input type="time" name="pickupTime" value="<%= pickupTime %>" required>

            <label>Return Date</label>
            <input type="date" id="returnDate" name="returnDate" required>
        </div>

        <!-- Payment Details -->
        <div class="payment-container">
            <h2>Payment Details</h2>

            <div class="car-summary">
                <h3><%= car.getModelName() %></h3>
                <p><%= car.getSeats() %> Seats | <%= car.getFuelType() %> | Model <%= car.getCarYearModel() %></p>
                <p>Rent per Day: <strong>₹<%= car.getRent() %></strong></p>
            </div>

            <div class="options">
                <label class="option-card">
                    <input type="radio" id="selfDrive" name="drivingOption" value="Self-Drive" required>
                    <div class="option-content">
                        <h4>Self Drive</h4>
                        <p>You drive the car yourself.</p>
                        <p class="price">₹<%= car.getRent() %> / day</p>
                    </div>
                </label>

                <div class="uploadfields" style="display:none;">
                    <label>Upload Aadhaar Card/Driving License</label>
                    <input type="file" name="aadharCard" accept=".jpg,.jpeg,.png,.pdf">
                </div>

                <label class="option-card">
                    <input type="radio" id="withDriver" name="drivingOption" value="With-Driver" required>
                    <div class="option-content">
                        <h4>With Driver</h4>
                        <p>Car rent + driver charge included.</p>
                        <p class="price">₹<%= car.getRent() + driverCharge %> / day</p>
                    </div>
                </label>
            </div>

            <!-- ✅ Dynamic Total Rent -->
            <div style="margin-top:20px;">
                <strong>Total Rent: </strong><span id="displayTotal">₹0</span>
            </div>

            <input type="hidden" id="totalAmount" name="totalAmount" value="0">
            <input type="hidden" name="carId" value="<%= car.getCarId() %>">
        </div>

        <div class="actions">
            <button type="submit" class="btn-primary">Proceed to Book</button>
        </div>
    </div>
</form>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<!-- ✅ JavaScript for Rent Calculation -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    const pickupDate = document.getElementById("pickupDate");
    const returnDate = document.getElementById("returnDate");
    const selfDrive = document.getElementById("selfDrive");
    const withDriver = document.getElementById("withDriver");
    const uploadBox = document.querySelector(".uploadfields");
    const totalAmount = document.getElementById("totalAmount");
    const displayTotal = document.getElementById("displayTotal");

    const rentPerDay = <%= car.getRent() %>;
    const driverCharge = <%= driverCharge %>;

    function calculateDays() {
        const start = new Date(pickupDate.value);
        const end = new Date(returnDate.value);
        const diff = end - start;
        const days = Math.ceil(diff / (1000 * 60 * 60 * 24));
        return days > 0 ? days : 1;
    }

    function updateTotal() {
        if (!pickupDate.value || !returnDate.value) {
            displayTotal.innerText = "₹0";
            totalAmount.value = 0;
            return;
        }

        let days = calculateDays();
        let total = rentPerDay * days;

        if (withDriver.checked) {
            total += driverCharge * days;
        }

        displayTotal.innerText = "₹" + total + " (" + days + " day" + (days > 1 ? "s" : "") + ")";
        totalAmount.value = total;
    }

    function toggleUpload() {
        if (selfDrive.checked) {
            uploadBox.style.display = "block";
        } else {
            uploadBox.style.display = "none";
        }
        updateTotal();
    }

    pickupDate.addEventListener("change", updateTotal);
    returnDate.addEventListener("change", updateTotal);
    selfDrive.addEventListener("change", toggleUpload);
    withDriver.addEventListener("change", toggleUpload);
});
</script>

</body>
</html>
