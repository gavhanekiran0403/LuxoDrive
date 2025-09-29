<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LuxoDrive - User DashBoard</title>

	<link rel="stylesheet" href="../css/userDashboard.css">
    
</head>
<body class="first-color">
    
    <jsp:include page="userNavbar.jsp"></jsp:include>
      
  <div class="content">
        <div class="bg-image">
       		<!-- <div class="bg-overlay">
                <h1>Ride With Comfort & Safety</h1>
                <p>Your journey starts here – Explore the best rides in town!</p>
            </div> -->
        </div>

        <div class="booking-box">
          <div class="tabs">
            <div class="tab active">Qiuck Search</div>
          </div>
          <form class="form" action="cars.jsp" method="post">
    		
    			<label>Pick-up Location</label>
    			<input type="text" name="pickupLocation" placeholder="Enter Pickup Location" required>

    			<label>Drop Location</label>
    			<input type="text" name="dropLocation" placeholder="Enter Drop Location" required>

    			<label>Pick-up Date</label>
    			<input type="date" name="pickupDate">

    			<label>Pick-up Time</label>
    			<input type="time" name="pickupTime">
				
				<button type="submit" class="btn">Search Cars</button>
				
			</form>

        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>