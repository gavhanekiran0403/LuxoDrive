<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String ownerIdStr = request.getParameter("id");
    int ownerId = ownerIdStr != null ? Integer.parseInt(ownerIdStr) : 0;
    CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aadhar Card Full View</title>
<style>
    body {
        margin: 0;
        background-color: #000;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    img {
        max-width: 100%;
        max-height: 100%;
        object-fit: contain;
        border: 5px solid #fff;
    }
</style>
</head>
<body>
<%
    if(carOwner != null && carOwner.getAadharImage() != null) {
        byte[] aadharImage = carOwner.getAadharImage();
        String base64Image = java.util.Base64.getEncoder().encodeToString(aadharImage);
%>
    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Aadhar Card"/>
<%
    } else {
%>
    <p style="color:white;">Aadhar Card not available</p>
<%
    }
%>
</body>
</html>
