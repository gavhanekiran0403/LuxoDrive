<%@page import="com.luxodrive.model.Car"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.luxodrive.dao.CarOperation" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car List</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/carList.css">
</head>
<body>

	<jsp:include page="adminNavbar.jsp"></jsp:include>
	
	<%
		List<Car> cars = CarOperation.getAllCars();
	%>
	
		<c:if test="${not empty sessionScope.uccessMsg}">
   			<div class="alert-box success">
      			${sessionScope.successMsg}
   			</div>
  			<c:remove var="successMsg" scope="session"/>
		</c:if>

		<c:if test="${not empty sessionScope.ErrorMsg}">
   			<div class="alert-box error">
      			${sessionScope.errorMsg}
   			</div>
   			<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
	<div class="list-container">
		<div class="header-row">
		 <a href="carForm.jsp" class="btn">Add New Car</a>
            <h1>Car List</h1>
        </div>
		<table>
		<thead>
			<tr>
				<th>Car Id</th>
				<th>Model Name</th>
				<th>Car Number</th>
				<th>Fuel Type</th>
				<th>Seats</th>
				<th>Rent(Per day)</th>
				<th>Car Year Model</th>
				<th>Insurance Number</th>
				<th>Features</th>
				<th>Status</th>
				<th>ChangeStatus</th>
				<th>Image 1</th>
				<th>Image 2</th>
				<th>Image 3</th>
				<th>Image 4</th>
				<th>Car Owner</th>
				<th>Action</th>
			</tr>
		</thead>
		<% if(cars != null){ %>
			<tbody>
			<% for(Car c : cars){ %>
			<tr>
				<td><%=c.getCarId()%></td>
				<td><%=c.getModelName()%></td>
				<td><%=c.getCarNo()%></td>
				<td><%=c.getFuelType()%></td>
				<td><%=c.getSeats()%></td>
				<td><%=c.getRent()%></td>
				<td><%=c.getCarYearModel()%></td>
				<td><%=c.getInsuranceNo()%></td>
				<td><%=c.getFeatures()%></td>
				<td><%=c.getStatus()%></td>
				<td>
					<div class="btn-status">
						<a href="updateStatus.jsp?carId=<%=c.getCarId() %>&carStatus=Available"">
							<button type="button" class="btn-available">Available</button>
						</a>
                    	<a href="updateStatus.jsp?carId=<%=c.getCarId() %>&carStatus=Unavailable"">
                    		<button type="button" class="btn-unavailable">Unavailable</button>
                    	</a>
					</div>
				</td>
				<td><img src="showImage.jsp?id=<%=c.getCarId()%>&index=0" width="100"/></td>
				<td><img src="showImage.jsp?id=<%=c.getCarId()%>&index=1" width="100"/></td>
				<td><img src="showImage.jsp?id=<%=c.getCarId()%>&index=2" width="100"/></td>
				<td><img src="showImage.jsp?id=<%=c.getCarId()%>&index=3" width="100"/></td>
				<td><%=c.getCarOwner().getOwnerName()%></td>
				<td  class="action-cell">
					<a class="link-update" href="carForm.jsp?carId=<%=c.getCarId()%>">Update</a> | 
					<a class="link-delete" href="delete.jsp?carId=<%=c.getCarId()%>" onclick="return confirm('Are you sure you want to delete?');">Delete</a>
				</td>
			</tr>
			<%} %>
			</tbody>
		<% }else{ %>
			<tbody>
				<tr>
					<td colspan="16">
						Cars not available.
					</td>
				</tr>
			</tbody>
		<% } %>
	</table>
	</div>
	
	 <%-- <jsp:include page="adminFooter.jsp"></jsp:include> --%>
	 
</body>
</html>