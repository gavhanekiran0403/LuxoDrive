<%@page import="java.util.ArrayList"%>
<%@page import="com.luxodrive.model.Driver"%>
<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.dao.UserOperation"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.model.Car"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Booking Details</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/notification.css">
</head>
<body>
<%
   
String bookingIdStr = request.getParameter("bookingId");
Booking booking = null;

if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
    try {
        int bookingId = Integer.parseInt(bookingIdStr);
        booking = BookingOpeartion.getBookingById(bookingId);
        if (booking != null) {
            request.setAttribute("booking", booking); 
        }
    } catch (NumberFormatException e) {
        out.println("<p>Invalid booking ID.</p>");
    }
} else {
    out.println("<p>Booking ID not provided.</p>");
}

List<Driver> drivers = DriverOperation.getAllDrivers();
List<Driver> availableDrivers = new ArrayList<>();

for (Driver d : drivers) {
    if ("Available".equalsIgnoreCase(d.getStatus())) {
        availableDrivers.add(d);
    }
}

request.setAttribute("drivers", availableDrivers);
%>

<jsp:include page="adminNavbar.jsp" />

<c:if test="${not empty booking}">
    <div class="notify-container">
        <h2>Booking Information</h2>
        <div class="page-layout">
            <div class="car-section">
                <div class="car-card" id="car-${booking.car.carId}">
                    <!-- Car images -->
                    <div class="car-images">
                        <input type="radio" name="gallery-${booking.car.carId}" id="img1-${booking.car.carId}" checked>
                        <input type="radio" name="gallery-${booking.car.carId}" id="img2-${booking.car.carId}">
                        <input type="radio" name="gallery-${booking.car.carId}" id="img3-${booking.car.carId}">
                        <input type="radio" name="gallery-${booking.car.carId}" id="img4-${booking.car.carId}">

                        <div class="main-image">
                            <img src="showImage.jsp?id=${booking.car.carId}&index=0" class="img1">
                            <img src="showImage.jsp?id=${booking.car.carId}&index=1" class="img2">
                            <img src="showImage.jsp?id=${booking.car.carId}&index=2" class="img3">
                            <img src="showImage.jsp?id=${booking.car.carId}&index=3" class="img4">
                        </div>

                        <div class="thumbnails">
                            <label for="img1-${booking.car.carId}"><img src="showImage.jsp?id=${booking.car.carId}&index=0"></label>
                            <label for="img2-${booking.car.carId}"><img src="showImage.jsp?id=${booking.car.carId}&index=1"></label>
                            <label for="img3-${booking.car.carId}"><img src="showImage.jsp?id=${booking.car.carId}&index=2"></label>
                            <label for="img4-${booking.car.carId}"><img src="showImage.jsp?id=${booking.car.carId}&index=3"></label>
                        </div>
                    </div>

                    <!-- Car details -->
                    <div class="details">
                        <h3>${booking.car.modelName}</h3>
                        <p>${booking.car.seats} Seats | ${booking.car.fuelType} | ${booking.car.carYearModel} Model</p>
                        <p>${booking.car.features}</p>
                        <p>Car no. : ${booking.car.carNo}</p>
                        <p>${booking.car.status}</p>
                        <p class="price">₹ ${booking.car.rent} / Day </p>
                    </div>
                </div>
            </div>

            <div class="booking-section">
                <div class="card-wrapper">
                    <div class="card">
                        <div class="card-content">
                            <p>Full name: ${booking.user.fullName}</p>
                            <p>Email: ${booking.user.email}</p>
                            <p>Phone: ${booking.user.phoneNo}</p>
                            <p>From → To: ${booking.pickupLocation} → ${booking.dropLocation}</p>
                            <p>Pickup date: ${booking.pickupDate}</p>
                            <p>Pickup time: ${booking.pickupTime}</p>
                            <p>Driving option: ${booking.drivingOption}</p>
                            <c:if test="${booking.drivingOption eq 'Self-Drive' }">
                            	<p>Aadhar card: <br><br>
                            		<a href="viewImage.jsp?bookingId=${booking.bookingId}" target="_blank">
                        				<img src="viewImage.jsp?bookingId=${booking.bookingId}" 
                            	 			width="60" alt="Aadhar Card"/>
                        			</a>
                            	</p>
                            </c:if>
                            <p>Total amount: ₹ ${booking.totalAmount}</p>
                            
                            <form action="bookingConfirmProcess.jsp" method="get">
    							<input type="hidden" name="bookingId" value="${booking.bookingId}">

   					 			<c:if test="${booking.drivingOption eq 'With-Driver'}">
        							<label for="driverSelect">Select Driver : </label>
        							<select id="driverSelect" name="driverId" required>
            							<option value="">-- Choose Driver --</option>
            							<c:forEach var="driver" items="${drivers}">
                							<option value="${driver.driverId}">${driver.fullName}</option>
            							</c:forEach>
        							</select>
    							</c:if>

    							<div class="actions">
        							<a href="bookingCancelProcess.jsp?bookingId=${booking.bookingId}">
            							<button type="button" class="btn btn-outline">Reject</button>
        							</a>
        							<button type="submit" class="btn btn-primary">Confirm</button>
    							</div>
							</form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</c:if>

<c:if test="${empty booking}">
    <p>No booking record found.</p>
</c:if>

</body>
</html>
