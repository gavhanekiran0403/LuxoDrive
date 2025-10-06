<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.luxodrive.dao.BookingOpeartion" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="userNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myBooking.css">
</head>
<body>
       <%
  
    // Get the logged-in userId from session
    
    User user = (User) session.getAttribute("loggedUser");
       

    List<Booking> bookings = new ArrayList<>();

    if (user != null) {
    	
    int userId = user.getUserId();
    	
        bookings = BookingOpeartion.getBookingsByUser(userId);
        
    }

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
            <h1>My Booking</h1>
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
                    <th>Aadhar Card</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Car</th>
                    <th>Driver</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.bookingId}</td>
                        <td>${booking.pickupLocation}</td>
                        <td>${booking.dropLocation}</td>
                        <td>${booking.pickupDate}</td>
                        <td>${booking.pickupTime}</td>
                        <td>${booking.returnDate}</td>
                        <td>${booking.drivingOption}</td>
                        <td>
                        	<c:choose>
                        		<c:when test="${booking.drivingOption eq 'Self-Drive' }">
                        			<!-- Thumbnail -->
                        			<a href="viewImage.jsp?bookingId=${booking.bookingId}" target="_blank">
                        				<img src="viewImage.jsp?bookingId=${booking.bookingId}" 
                            	 			width="60" alt="Aadhar Card"/>
                        			</a>
                           		</c:when>
                        		<c:otherwise>
                        			-
                        		</c:otherwise>
                        	</c:choose>	
                        </td>
                        <td>${booking.totalAmount}</td>
                        <td>${booking.status}</td>
                        <td>${booking.car.carNo}</td>
                        <td>
                        	<c:choose>
                            	<c:when test="${booking.drivingOption eq 'With-Driver'}">
                                	${booking.driver.fullName}
                                </c:when>
                                <c:otherwise>
                                	-
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
