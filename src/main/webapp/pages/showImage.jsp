<%@ page import="java.io.OutputStream" %>
<%@ page import="com.luxodrive.model.Car" %>
<%@ page import="com.luxodrive.dao.CarOperation" %>
<%@ page import="java.util.*" %>
<%@ page contentType="image/jpeg" %>

<%
    String idStr = request.getParameter("id");
    String indexStr = request.getParameter("index");

    int carId = -1;
    int index = 0;

    try {
        if (idStr != null && !idStr.trim().isEmpty() && indexStr != null && !indexStr.trim().isEmpty()) {
            carId = Integer.parseInt(idStr);
            index = Integer.parseInt(indexStr);
        }
    } catch (NumberFormatException e) {
        carId = -1;
        index = 0;
    }

    Car car = CarOperation.getCarById(carId);

    if (car != null && car.getImages() != null && index >= 0 && index < car.getImages().size()) {
        byte[] imgData = car.getImages().get(index);

        if (imgData != null && imgData.length > 0) {
            OutputStream outStream = null;
            try {
                response.setContentType("image/jpeg");
                outStream = response.getOutputStream();
                outStream.write(imgData);
                outStream.flush();
            } catch (java.io.IOException e) {
                // Client aborted connection; safe to ignore
            } finally {
                if (outStream != null) {
                    try { outStream.close(); } catch (Exception ex) { /* ignore */ }
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    } else {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
%>
