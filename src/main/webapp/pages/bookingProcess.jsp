<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.luxodrive.model.*"%>
<%@page import="com.luxodrive.dao.*"%>
<%@ page import="jakarta.servlet.http.Part" %>

<%!
    private String getValue(Part part) throws Exception {
        if (part != null) {
            try (InputStream in = part.getInputStream()) {
                return new String(in.readAllBytes(), "UTF-8").trim();
            }
        }
        return null;
    }
%>

<%
    String pickupLocation = getValue(request.getPart("pickupLocation"));
    String dropLocation = getValue(request.getPart("dropLocation"));
    String pickupDateStr = getValue(request.getPart("pickupDate"));
    String returnDateStr = getValue(request.getPart("returnDate"));
    String pickupTime = getValue(request.getPart("pickupTime"));
    String drivingOption = getValue(request.getPart("drivingOption"));
    String carIdStr = getValue(request.getPart("carId"));
    String totalAmountStr = getValue(request.getPart("totalAmount"));

    Car car = null;
    if (carIdStr != null && !carIdStr.isEmpty()) {
        int carId = Integer.parseInt(carIdStr);
        car = CarOperation.getCarById(carId);
    }

    if (car == null) {
        response.sendRedirect("cars.jsp");
        return;
    }

    User user = (User) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Backend verification (prevent tampering)
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date pickupDate = sdf.parse(pickupDateStr);
    Date returnDate = sdf.parse(returnDateStr);
    long diff = returnDate.getTime() - pickupDate.getTime();
    int days = (int) Math.ceil(diff / (1000 * 60 * 60 * 24.0));
    if (days < 1) days = 1;

    int rentPerDay = (int) car.getRent();
    int driverCharge = 500;
    int totalAmount = rentPerDay * days;
    if ("With-Driver".equals(drivingOption)) {
        totalAmount += driverCharge * days;
    }

    // Save Aadhaar file
    Part aadharCardPart = request.getPart("aadharCard");
    byte[] aadharCard = null;
    if (aadharCardPart != null && aadharCardPart.getSize() > 0) {
        try (InputStream in = aadharCardPart.getInputStream()) {
            aadharCard = in.readAllBytes();
        }
    }

    // Save booking
    Booking booking = new Booking();
    booking.setPickupLocation(pickupLocation);
    booking.setDropLocation(dropLocation);
    booking.setPickupDate(pickupDateStr);
    booking.setPickupTime(pickupTime);
    booking.setReturnDate(returnDateStr);
    booking.setDrivingOption(drivingOption);
    booking.setAadharCard(aadharCard);
    booking.setStatus("Pending");
    booking.setTotalAmount(totalAmount);
    booking.setUser(user);
    booking.setCar(car);

    int bookingId = BookingOpeartion.addBooking(booking);

    if (bookingId > 0) {
        booking.setBookingId(bookingId);
        AdminNotification adminNotification = new AdminNotification();
        adminNotification.setMessage("New booking from " + user.getFullName());
        adminNotification.setUser(user);
        adminNotification.setBooking(booking);
        AdminNotificationOperation.addNotification(adminNotification);
        response.sendRedirect("bookingPending.jsp?bookingId=" + bookingId);
    } else {
        out.println("<h3>Booking Failed. Please try again.</h3>");
    }
%>
