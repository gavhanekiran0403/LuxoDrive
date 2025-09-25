<%@page import="java.io.OutputStream"%>
<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@ page contentType="image/jpeg" %>
<%
	String message = null;
    String ownerIdStr = request.getParameter("id");
    if(ownerIdStr != null) {
        int ownerId = Integer.parseInt(ownerIdStr);
        CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
        if(carOwner != null && carOwner.getAadharImage() != null) {
            byte[] aadharImage = carOwner.getAadharImage();
            response.setContentLength(aadharImage.length);
            try (OutputStream os = response.getOutputStream()) {
                os.write(aadharImage);
            }
        } else {
        	response.sendRedirect("no-image.png");
        }
    } 
%>