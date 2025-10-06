<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.model.Driver"%>
<%@page import="com.luxodrive.model.Car"%>
<%@page import="com.luxodrive.dao.CarOperation"%>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.IOException" %>

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
	String carIdStr = getValue(request.getPart("carId"));
	int carId = (carIdStr != null && !carIdStr.isEmpty()) ? Integer.parseInt(carIdStr) : 0;
	String modelName = getValue(request.getPart("modelName"));
    String carNo = getValue(request.getPart("carNo"));
    String fuelType = getValue(request.getPart("fuelType"));

    String seatsStr = getValue(request.getPart("seats"));
    int seats = (seatsStr != null && !seatsStr.isEmpty()) ? Integer.parseInt(seatsStr) : 0;

    String rentStr = getValue(request.getPart("rent"));
    double rent = (rentStr != null && !rentStr.isEmpty()) ? Double.parseDouble(rentStr) : 0.0;

    String carYearModelStr = getValue(request.getPart("carYearModel"));
    int carYearModel = (carYearModelStr != null && !carYearModelStr.isEmpty()) ? Integer.parseInt(carYearModelStr) : 0;

    String insuranceNo = getValue(request.getPart("insuranceNo"));
    String features = getValue(request.getPart("features"));
    String status = getValue(request.getPart("status"));
	
    Car existingCar = null;
    if (carId > 0) {
        existingCar = CarOperation.getCarById(carId);
    }
    
    List<byte[]> images = new ArrayList<>();

    for (int i = 1; i <= 4; i++) {
        Part imgPart = request.getPart("image" + i);
        byte[] imgData = null;

        if (imgPart != null && imgPart.getSize() > 0) {
            try (InputStream inputStream = imgPart.getInputStream()) {
                imgData = inputStream.readAllBytes();
            }
        } else if (existingCar != null && existingCar.getImages().size() >= i) {
            imgData = existingCar.getImages().get(i - 1); 
        }

        images.add(imgData);
    }
    
    String ownerIdStr = getValue(request.getPart("carOwner"));
    int ownerId = (ownerIdStr != null && !ownerIdStr.isEmpty()) ? Integer.parseInt(ownerIdStr) : 0;
    CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
    
    if (carOwner == null) {
        request.getSession().setAttribute("errorMsg", "Car Owner not available");
        response.sendRedirect("carList.jsp");
        return;
    }
    
    Car car = new Car();
	car.setCarId(carId);
	car.setModelName(modelName);
	car.setCarNo(carNo);
	car.setFuelType(fuelType);
	car.setSeats(seats);
	car.setRent(rent);
	car.setCarYearModel(carYearModel);
	car.setInsuranceNo(insuranceNo);
	car.setFeatures(features);
	car.setImages(images);
	car.setStatus(status);
	car.setCarOwner(carOwner);
	
	
	int row;
    if (existingCar != null) {
        row = CarOperation.updateCars(car);
        if(row > 0){
        	session.setAttribute("sucessMsg","Car updated successfully!");
        	request.getRequestDispatcher("carList.jsp").forward(request, response);
        }else{
        	session.setAttribute("errorMsg","Car update failed!");
        	request.getRequestDispatcher("carList.jsp").forward(request, response);
        }
    } else {
        row = CarOperation.addCars(car);
        if(row > 0){
        	session.setAttribute("sucessMsg","Car inserted successfully!");
        	request.getRequestDispatcher("carList.jsp").forward(request, response);
        }else{
        	session.setAttribute("errorMsg","Car insert failed!");
        	request.getRequestDispatcher("carList.jsp").forward(request, response);
        }
    }
    
	%>
