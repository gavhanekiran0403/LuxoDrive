<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.List" %>
<%@ page import="com.luxodrive.dao.DriverOperation" %>
<%@ page import="com.luxodrive.model.Driver" %>
<%@ page import="com.luxodrive.model.Car" %>
<%@ page import="com.luxodrive.dao.CarOperation" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Form Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carForm.css">
</head>
<body>

	<jsp:include page="adminNavbar.jsp"></jsp:include>
	
    <div class="form-container">
        <%
            String carIdStr = request.getParameter("carId");
            int carId = 0;
            if (carIdStr != null && !carIdStr.isEmpty()) {
                carId = Integer.parseInt(carIdStr);
            }

            Car car = CarOperation.getCarById(carId);
            request.setAttribute("car", car);
            
           	List<CarOwner> carOwners = CarOwnerOperation.getAllCarOwner();
           	
            request.setAttribute("carOwners", carOwners);
        %>

        <c:choose>
            <c:when test="${car != null}">
                <h1>Update Car</h1>
            </c:when>
            <c:otherwise>
                <h1>Add New Car</h1>
            </c:otherwise>
        </c:choose>

        <form action="carFormProcess.jsp" method="post" enctype="multipart/form-data">
            <div class="form-grid">
                <c:if test="${car != null}">
                    <input type="hidden" name="carId" value="${car.carId}" />
                </c:if>

                <!-- Left column -->
                <div class="form-column">
                    <label>Model Name :</label>
                    <input type="text" name="modelName" value="${car.modelName}" placeholder="Enter the model name" required>

                    <label>Car Number :</label>
                    <input type="text" name="carNo" value="${car.carNo}" placeholder="Enter the car number" required>

                    <label>Rent (Per day) :</label>
                    <input type="text" name="rent" value="${car.rent}" placeholder="Enter the rent" required>

                    <label>Car Year Model :</label>
                    <input type="text" name="carYearModel" value="${car.carYearModel}" placeholder="Enter the car year model" required>

                    <label>Insurance Number :</label>
                    <input type="text" name="insuranceNo" value="${car.insuranceNo}" placeholder="Enter the insurance number" required>
                </div>

                <!-- Right column -->
                <div class="form-column">
                    <label>Fuel Type :</label>
                    <input type="text" name="fuelType" value="${car.fuelType}" placeholder="Enter the car fuel type" required>

                    <label>Seats :</label>
                    <input type="text" name="seats" value="${car.seats}" placeholder="Enter number of seats" required>

                    <label>Status :</label>
                    <input type="text" name="status" value="${car.status}" placeholder="Enter the status" required>

                    <label>Car Features :</label>
                    <input type="text" name="features" value="${car.features}" placeholder="Enter the car features" required/>
                    
                    <label>Car Owner :</label>
                    <select name="carOwner" required>
                    	<option value="">Select the Car Owner</option>
                    	<c:forEach var="carOwner" items="${carOwners}">
                    		<option value="${carOwner.ownerId }">${carOwner.ownerName }</option>
                    	</c:forEach>
                    </select>
                 
                </div>
            </div>

            <!-- Image upload section -->
            <div class="image-section">
                <h3>Upload Images</h3>
                <div class="image-grid">

                    <%-- <c:forEach var="i" begin="0" end="3">
                        <div class="file-container">
                            <label>Image ${i + 1} :</label>

                            <c:if test="${car != null && car.images[i] != null}">
                                <img src="showImage.jsp?id=${car.carId}&index=${i}" 
                                     alt="Car Image ${i}" width="120" height="80"/>
                            </c:if>

                            <input type="file" name="image${i}">
                        </div>
                    </c:forEach> --%>
                    
                    <div class="file-container">
                            <label>Image 1 :</label>

                            <c:if test="${car != null && car.images[0] != null}">
                                <img src="showImage.jsp?id=${car.carId}&index=0" 
                                     alt="Car Image 1" width="120" height="80"/>
                            </c:if>

                            <input type="file" name="image1">
                     </div>

					<div class="file-container">
                            <label>Image 2 :</label>

                            <c:if test="${car != null && car.images[1] != null}">
                                <img src="showImage.jsp?id=${car.carId}&index=1" 
                                     alt="Car Image 2" width="120" height="80"/>
                            </c:if>

                            <input type="file" name="image2">
                     </div>
                     
                     <div class="file-container">
                            <label>Image 3 :</label>

                            <c:if test="${car != null && car.images[2] != null}">
                                <img src="showImage.jsp?id=${car.carId}&index=2" 
                                     alt="Car Image 3" width="120" height="80"/>
                            </c:if>

                            <input type="file" name="image3">
                     </div>
                     
                     <div class="file-container">
                            <label>Image 4 :</label>

                            <c:if test="${car != null && car.images[3] != null}">
                                <img src="showImage.jsp?id=${car.carId}&index=3" 
                                     alt="Car Image 4" width="120" height="80"/>
                            </c:if>

                            <input type="file" name="image4">
                     </div>
                </div>
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>
    
   <%--  <jsp:include page="adminFooter.jsp"></jsp:include> --%>
</body>
</html>
