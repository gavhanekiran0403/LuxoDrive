<%@page import="com.luxodrive.dao.CarOperation"%>
<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Status</title>
</head>
<body>
<%
	String driverIdStr = request.getParameter("driverId");
	String driverStatus = request.getParameter("driverStatus");
	if(driverIdStr != null && !driverIdStr.isEmpty() && driverStatus != null && !driverStatus.isEmpty()){
		int driverId = driverIdStr != null ? Integer.parseInt(driverIdStr) : 0;
		int row = DriverOperation.updateDriverStatus(driverId, driverStatus);
		
		if(row > 0){
			response.sendRedirect("driverList.jsp");
		}
	}
	
	String carIdStr = request.getParameter("carId");
	String carStatus = request.getParameter("carStatus");
	if(carIdStr != null && !carIdStr.isEmpty() && carStatus != null && !carStatus.isEmpty()){
		int carId = carIdStr != null ? Integer.parseInt(carIdStr) : 0;
		int row = CarOperation.updateCarStatus(carId, carStatus);
		
		if(row > 0){
			response.sendRedirect("carList.jsp");
		}
	}
	
%>
</body>
</html>