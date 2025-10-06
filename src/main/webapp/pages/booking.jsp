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
	request.setAttribute("pickupLocation", request.getParameter("pickupLocation"));
	request.setAttribute("dropLocation", request.getParameter("dropLocation"));
	request.setAttribute("pickupDate", request.getParameter("pickupDate"));
	request.setAttribute("pickupTime", request.getParameter("pickupTime"));
	request.setAttribute("carId", request.getParameter("carId"));
	String carIdStr = request.getParameter("carId");
	
	Car car = null;
	if(carIdStr != null && !carIdStr.isEmpty()){
		int carId = Integer.parseInt(carIdStr);
		car = CarOperation.getCarById(carId);
	}
	
	if (car == null) {
        response.sendRedirect("cars.jsp");
        return;
    }
	
	request.setAttribute("car", car);
	
	User user = (User) session.getAttribute("loggedUser");
	if(user == null){
	    response.sendRedirect("login.jsp");
	    return;
	}
	
	int driverCharge = 500;
	request.setAttribute("driverCharge", driverCharge);
%>
	
	<!-- Booking Form start -->

    <div class="booking-container">
    	
    	<form action="bookingProcess.jsp" method="post" enctype="multipart/form-data">    	
    		<div class="booking-card">
    			
    			<!--Customer Details-->
				<div class="customer-section">
    				<h2>Contact Details</h2>
    					<label>Full Name</label>
    					<input type="text" value="${sessionScope.loggedUser.fullName }" placeholder="Enter your name" required>

    					<label>Email</label>
    					<input type="email" value="${sessionScope.loggedUser.email }" placeholder="Enter your email" required>

    					<label>Phone</label>
    					<input type="tel" value="${sessionScope.loggedUser.phoneNo }" placeholder="Enter phone number" required>
        		</div>
			
    		
    			<!--Booking Details-->
    			<div class="booking-section">
    				<h2>Booking Details</h2>
    				
    				<label>Pick-up Location</label>
                	<input type="text" value="${pickupLocation }" placeholder="Enter city or airport" required>
                
                	<label>Drop Location</label>
                    <input type="text" value="${dropLocation }" placeholder="Enter drop city" required>
                    
                    <label>Pick-up Date</label>
                    <input type="date" value="${pickupDate }" required>
                    
                    <label>Pick-up Time</label>
                    <input type="time" value="${pickupTime }" required>
                    
                    <label>Return Date</label>
                    <input type="date" name="returnDate" required>
    			</div>
    			
    			<div class="payment-container">
    				<h2>Payment Details</h2>

 					<!-- Car Summary -->
    				<div class="car-summary">
        				<h3>${car.modelName}</h3>
        				<p>${car.seats} Seats | ${car.fuelType} | ${car.carYearModel} Model</p>
        				<p>Rent per Day: <strong>₹${car.rent}</strong></p>
    				</div>

    				<!-- Options -->

        			<div class="options">
        				<label class="option-card">
        					<input type="radio" id="selfDrive" name="drivingOption" value="Self-Drive" 
        							onclick="document.getElementById('totalAmount').value='${car.rent}'"required>
                       			<div class="option-content">
                    				<h4>Self Drive</h4>
                    				<p>You drive the car yourself.</p>
                    				<p class="price">₹${car.rent}</p>
                			</div>
            			</label>
						
						<!-- Upload Section (shown only when Self Drive is selected) -->
    					<div class="uploadfields">
        					<label>Upload Aadhaar Card/Driving License</label>
        						<input type="file" name="aadharCard" accept=".jpg,.jpeg,.png,.pdf">
        				</div>
        				
            			<label class="option-card">
            				<input type="radio" id="withDrive" name="drivingOption" value="With-Driver" 
            						onclick="document.getElementById('totalAmount').value='${car.rent + driverCharge}'" required>
                				<div class="option-content">
                    				<h4>With Driver</h4>
                    				<p>Car rent + driver charge included.</p>
                    				<p class="price">₹ ${car.rent + driverCharge}</p>
                			</div>
            			</label>
            			
            			<input type="hidden" id="totalAmount" name="totalAmount" value="${car.rent}">
            			
        			</div>
        			
    				<input type="hidden" name="pickupLocation" value="${pickupLocation}">
    				<input type="hidden" name="dropLocation" value="${dropLocation}">
    				<input type="hidden" name="pickupDate" value="${pickupDate}">
    				<input type="hidden" name="pickupTime" value="${pickupTime}">
    				<input type="hidden" name="carId" value="${car.carId}">
					<input type="hidden" name="totalAmount" value="${totalAmount}">

        		<!-- Proceed button -->
        		<div class="actions">
            		<button type="submit" class="btn-primary">Proceed</button>
        		</div>
			</div>
    	</div>
	</form>
</div>

    <!-- Booking Form end -->
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- JavaScript -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    const selfDrive = document.getElementById("selfDrive");
    const withDrive = document.getElementById("withDrive");
    const uploadBox = document.querySelector(".uploadfields");
    const totalAmount = document.getElementById("totalAmount");

    const rent = ${car.rent};
    const driverCharge = ${driverCharge};

    function toggleUpload() {
        if (selfDrive.checked) {
            uploadBox.style.display = "block";
            totalAmount.value = rent; // Self drive amount
        } else if (withDrive.checked) {
            uploadBox.style.display = "none";
            totalAmount.value = rent + driverCharge; // With driver amount
        }
    }

    selfDrive.addEventListener("change", toggleUpload);
    withDrive.addEventListener("change", toggleUpload);
    toggleUpload(); // Run once when page loads
});
</script>
</body>
</html>