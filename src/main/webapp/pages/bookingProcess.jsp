<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="com.luxodrive.dao.AdminNotificationOperation"%>
<%@page import="com.luxodrive.model.AdminNotification"%>
<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.model.Car"%>
<%@page import="com.luxodrive.dao.CarOperation"%>
<%@page import="com.luxodrive.model.Booking"%>
<%@page import="com.luxodrive.model.User"%>
<%@ page import="jakarta.servlet.http.Part" %>
<%!
    private String getValue(Part part) throws IOException {
        if (part != null) {
            try (InputStream in = part.getInputStream()) {
                return new String(in.readAllBytes(), "UTF-8").trim();
            }catch(Exception e){
            	e.printStackTrace();
            }
        }
        return null;
    }
%>
    
<%
	String pickupLocation = getValue(request.getPart("pickupLocation"));
	String dropLocation = getValue(request.getPart("dropLocation"));
	String pickupDate = getValue(request.getPart("pickupDate"));
	String pickupTime = getValue(request.getPart("pickupTime"));
	String returnDate = getValue(request.getPart("returnDate"));
	String drivingOption = getValue(request.getPart("drivingOption"));
	String carIdStr = getValue(request.getPart("carId"));
	String totalAmountStr = getValue(request.getPart("totalAmount"));
	
	double totalAmount = 0;
    if (totalAmountStr != null && !totalAmountStr.isEmpty()) {
        try {
            totalAmount = Double.parseDouble(totalAmountStr);
        } catch (NumberFormatException e) {
            totalAmount = 0;
        }
    }
    
    Part aadharCardPart = null;
    try {
        aadharCardPart = request.getPart("aadharCard");
    } catch (Exception e) {
        e.printStackTrace();
    }
    byte[] aadharCard = null;
    if(aadharCardPart !=null && aadharCardPart.getSize() > 0){
    	try{
    		InputStream inputStream = aadharCardPart.getInputStream();
    		aadharCard = inputStream.readAllBytes();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
	
    Car car = null;
    if (carIdStr != null && !carIdStr.isEmpty()) {
        try {
            int carId = Integer.parseInt(carIdStr);
            car = CarOperation.getCarById(carId);
        } catch (NumberFormatException e) {
            car = null;
        }
    }
	
	User user = (User) session.getAttribute("loggedUser");
	if(user == null){
	    response.sendRedirect("login.jsp");
	    return;
	}
	
	Booking booking = new Booking();
	booking.setPickupLocation(pickupLocation);
	booking.setDropLocation(dropLocation);
	booking.setPickupDate(pickupDate);
	booking.setPickupTime(pickupTime);
	booking.setReturnDate(returnDate);
	booking.setDrivingOption(drivingOption);
	booking.setAadharCard(aadharCard);
	booking.setStatus("Pending");
	booking.setTotalAmount(totalAmount);
	booking.setUser(user);
	booking.setCar(car);
	
	int generatedId = BookingOpeartion.addBooking(booking);

    if (generatedId > 0) {
    	booking.setBookingId(generatedId);
        String message = "New booking request from " + user.getFullName();
        AdminNotification adminNotification = new AdminNotification();
        adminNotification.setMessage(message);
        adminNotification.setUser(user);
        adminNotification.setBooking(booking);
        int row = AdminNotificationOperation.addNotification(adminNotification);
        if(row > 0){
        	response.sendRedirect("bookingPending.jsp?bookingId="+generatedId);
        }
        
    }
%>
