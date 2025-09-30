<%@page import="com.luxodrive.model.Booking"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.luxodrive.dao.BookingOpeartion" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bookingList.css">
</head>
<body>

    <jsp:include page="adminNavbar.jsp"></jsp:include>

    <%
        List<Booking> bookings = BookingOpeartion.getAllBookings();
        request.setAttribute("bookings", bookings);
    %>

    <!-- ✅ Success / Error Messages -->
    <c:if test="${not empty successMsg}">
        <div class="alert-box success">
            ${successMsg}
        </div>
        <c:remove var="successMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty errorMsg}">
        <div class="alert-box error">
            ${errorMsg}
        </div>
        <c:remove var="errorMsg" scope="session"/>
    </c:if>

    <div class="list-container">
        <div class="header-row">
            <h1>Booking List</h1>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Booking Id</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Pickup Date</th>
                    <th>Pickup Time</th>
                    <th>Return Date</th>
                    <th>Driving Option</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>User</th>
                    <th>Car</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="b" items="${bookings}">
                    <tr>
                        <td>${b.bookingId}</td>
                        <td>${b.pickupLocation}</td>
                        <td>${b.dropLocation}</td>
                        <td>${b.pickupDate}</td>
                        <td>${b.pickupTime}</td>
                        <td>${b.returnDate}</td>
                        <td>${b.drivingOption}</td>
                        <td>${b.totalAmount}</td>
                        <td>${b.status}</td>
                        <td>${b.user.fullName}</td>
                        <td>${b.car.modelName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
