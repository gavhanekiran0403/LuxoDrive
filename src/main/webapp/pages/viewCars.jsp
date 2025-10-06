<%@page import="com.luxodrive.model.Car"%>
<%@page import="java.util.*"%>
<%@page import="com.luxodrive.dao.CarOperation" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carOwnerList.css">
</head>
<body>

<jsp:include page="adminNavbar.jsp"></jsp:include>

	<%
		String ownerIdStr = request.getParameter("id");
		List<Car> cars = null;
		if(ownerIdStr != null){
			int ownerId = Integer.parseInt(ownerIdStr);
			cars = CarOperation.getCarsByOwnerId(ownerId);
		}
		
		request.setAttribute("cars", cars);
	%>
	<div class="car-list-container">
		<div class="car-header-row">
            <h1 class="heading-car">Car List</h1>
        </div>
		<table  class="car-list-table">
		<thead>
			<tr>
				<th>Car Id</th>
				<th>Model Name</th>
				<th>Car Number</th>
				<th>Insurance Number</th>
				<th>Image</th>
			</tr>
		</thead>
			<c:choose>
        	<c:when test="${empty cars }">
        		<tbody>
        			<tr>
        				<td colspan="5">
        					Cars not available for this owner.
        				</td>
        			</tr>
        		</tbody>
        	</c:when>
        	<c:otherwise>
        	<tbody>
        		<c:forEach var="car" items="${cars}">
					<tr>
						<td>${car.carId }</td>
						<td>${car.modelName }</td>
						<td>${car.carNo }</td>
						<td>${car.insuranceNo }</td>
						<td><img src="showImage.jsp?id=${car.carId }&index=0" width="100" alt="Car Image"/></td>
					</tr>
				</c:forEach>
			</tbody>
        	</c:otherwise>
        	</c:choose>
		
	</table>
	</div>
</body>
</html>