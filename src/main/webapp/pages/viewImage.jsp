<%@page import="com.luxodrive.dao.BookingOpeartion"%>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.luxodrive.model.CarOwner" %>
<%@ page import="com.luxodrive.dao.CarOwnerOperation" %>
<%@ page import="com.luxodrive.model.Booking" %>
<%@ page contentType="image/jpeg" %>

<%
    byte[] imageBytes = null;

    String ownerIdStr = request.getParameter("carOwnerId");
    String bookingIdStr = request.getParameter("bookingId");

    if(ownerIdStr != null) {
        int ownerId = Integer.parseInt(ownerIdStr);
        CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
        if(carOwner != null && carOwner.getAadharImage() != null) {
            imageBytes = carOwner.getAadharImage();
        }
    } else if(bookingIdStr != null) {
        int bookingId = Integer.parseInt(bookingIdStr);
        Booking booking = BookingOpeartion.getBookingById(bookingId);
        if(booking != null && booking.getAadharCard() != null) {
            imageBytes = booking.getAadharCard();
        }
    }

 	// If no image found, load default "no-image.png"
    if (imageBytes == null) {
        String noImagePath = application.getRealPath("/images/no-image.png");
        File noImageFile = new File(noImagePath);
        try (FileInputStream fis = new FileInputStream(noImageFile)) {
            imageBytes = fis.readAllBytes();
        }
    }
    // Write the image bytes to response
    if(imageBytes != null) {
        response.setContentLength(imageBytes.length);
        try (OutputStream os = response.getOutputStream()) {
            os.write(imageBytes);
        }
    }
%>
