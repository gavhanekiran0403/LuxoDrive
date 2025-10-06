<%@page import="java.util.ArrayList"%>
<%@page import="com.luxodrive.model.Car"%>
<%@page import="java.util.List"%>
<%@ page import="com.luxodrive.dao.CarOperation" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cars Page</title>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/css/cars.css">
</head>
<body>
<jsp:include page="userNavbar.jsp" />
<%
	request.setAttribute("pickupLocation", request.getParameter("pickupLocation"));
	request.setAttribute("dropLocation", request.getParameter("dropLocation"));
	request.setAttribute("pickupDate", request.getParameter("pickupDate"));
	request.setAttribute("pickupTime", request.getParameter("pickupTime"));
	
    List<Car> cars = CarOperation.getAllCars();
    List<Car> availableCars = new ArrayList<>();
    for(Car c : cars){
    	if("Available".equalsIgnoreCase(c.getStatus())){
    		availableCars.add(c);
    	}
    }
    request.setAttribute("cars", availableCars);
%>

<div class="section">
    <h2>Available Cars</h2>
    <div class="cars-grid">

    <c:forEach var="car" items="${cars}">
      <div class="car-card" id="car-${car.carId}">
        
 		 <div class="car-images">
   			<input type="radio" name="gallery-${car.carId}" id="img1-${car.carId}" checked>
    		<input type="radio" name="gallery-${car.carId}" id="img2-${car.carId}">
    		<input type="radio" name="gallery-${car.carId}" id="img3-${car.carId}">
    		<input type="radio" name="gallery-${car.carId}" id="img4-${car.carId}">

    	<div class="main-image">
      		<img src="showImage.jsp?id=${car.carId}&index=0" class="img1">
      		<img src="showImage.jsp?id=${car.carId}&index=1" class="img2">
      		<img src="showImage.jsp?id=${car.carId}&index=2" class="img3">
      		<img src="showImage.jsp?id=${car.carId}&index=3" class="img4">
    	</div>

    	<div class="thumbnails">
      		<label for="img1-${car.carId}"><img src="showImage.jsp?id=${car.carId}&index=0"></label>
      		<label for="img2-${car.carId}"><img src="showImage.jsp?id=${car.carId}&index=1"></label>
      		<label for="img3-${car.carId}"><img src="showImage.jsp?id=${car.carId}&index=2"></label>
      		<label for="img4-${car.carId}"><img src="showImage.jsp?id=${car.carId}&index=3"></label>
    	</div>
  	</div>

        <!-- Car Details -->
        <div class="details">
          <h3>${car.modelName}</h3>
          <p>${car.seats} Seats | ${car.fuelType} | ${car.carYearModel} Model</p>
          <p>${car.carNo}</p>
          <p>${car.features}</p>
          <p>${car.status}</p>
          <p class="price">₹ ${car.rent} / Day </p>
          <%-- <a href="booking.jsp?pickupLocation=${pickupLocation}&dropLocation=${dropLocation}&pickupDate=${pickupDate}
          			&pickupTime=${pickupTime}&carId=${car.carId}" class="book-btn">Select Car</a> --%>
        
        	<form action="booking.jsp" method="post">
    			<input type="hidden" name="pickupLocation" value="${pickupLocation}">
   		 		<input type="hidden" name="dropLocation" value="${dropLocation}">
    			<input type="hidden" name="pickupDate" value="${pickupDate}">
    			<input type="hidden" name="pickupTime" value="${pickupTime}">
    			<input type="hidden" name="carId" value="${car.carId}">
    			<button class="book-btn" type="submit">Select Car</button>
			</form>
        </div>
      </div>
    </c:forEach>

    </div>
</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
