<%@ page import="java.io.OutputStream" %>
<%@ page import="com.luxodrive.model.Car" %>
<%@ page import="com.luxodrive.dao.CarOperation" %>
<%@ page import="java.util.*" %>
<%@ page contentType="image/jpeg" %>

<%
    String idStr = request.getParameter("id");
    String indexStr = request.getParameter("index");

    if (idStr != null && indexStr != null) {
        int carId = Integer.parseInt(idStr);
        int index = Integer.parseInt(indexStr);

        Car car = CarOperation.getCarById(carId);
       
        if (car != null && car.getImages() != null && index >= 0 && index < car.getImages().size()) {
        	byte[] imgData = null;
            switch (index) {
                case 0: imgData = car.getImages().get(0); break;
                case 1: imgData = car.getImages().get(1); break;
                case 2: imgData = car.getImages().get(2); break;
                case 3: imgData = car.getImages().get(3); break;
            }

            if (imgData != null && imgData.length > 0) {
                response.setContentType("image/jpeg");
                OutputStream outStream = response.getOutputStream();
                outStream.write(imgData);
                outStream.flush();
                outStream.close();
            }
        }
    }
%>
