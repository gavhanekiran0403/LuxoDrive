<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.model.Driver"%>
<%@page import="com.luxodrive.dao.BankAccountOperation"%>
<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@page import="com.luxodrive.dao.CarOperation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String carIdStr = request.getParameter("carId");
    String ownerIdStr = request.getParameter("ownerId");

    if (carIdStr != null && !carIdStr.isEmpty()) {
        try {
            int carId = Integer.parseInt(carIdStr);
            int row = CarOperation.deleteCar(carId);
            if (row > 0) {
                response.sendRedirect("carList.jsp");
                return;
            } else {
                System.out.println("Failed to delete car.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid carId format.");
        }
    }

    if (ownerIdStr != null && !ownerIdStr.isEmpty()) {
        try {
            int ownerId = Integer.parseInt(ownerIdStr);
            CarOwner carOwner = CarOwnerOperation.getCarOwnerById(ownerId);
            if (carOwner != null && carOwner.getBankAccount() != null) {
                int bankAccId = carOwner.getBankAccount().getBankAccId();
                BankAccountOperation.deleteBankAccount(bankAccId);
            }
            int row = CarOwnerOperation.deleteCarOwner(ownerId);
            if (row > 0) {
                response.sendRedirect("carOwnerList.jsp");
                return;
            } else {
                System.out.println("Failed to delete car owner.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid ownerId format.");
        }
    }
    
    String driverIdStr = request.getParameter("driverId");

    if (driverIdStr != null && !driverIdStr.isEmpty()) {
        try {
            int driverId = Integer.parseInt(driverIdStr);

            // ✅ First fetch the driver with bank account
            Driver driver = DriverOperation.getDriverById(driverId);

            if (driver != null) {
                // ✅ If driver has bank account, delete it first
                if (driver.getBankAccount() != null) {
                    int bankAccId = driver.getBankAccount().getBankAccId();
                    BankAccountOperation.deleteBankAccount(bankAccId);
                }

                // ✅ Now delete driver
                int row = DriverOperation.deleteDriver(driverId);

                if (row > 0) {
                    response.sendRedirect("driverList.jsp");
                    return;
                } else {
                    System.out.println("❌ Failed to delete driver with ID: " + driverId);
                }
            } else {
                System.out.println("⚠️ Driver not found for ID: " + driverId);
            }
        } catch (NumberFormatException e) {
            System.out.println("⚠️ Invalid driverId format: " + driverIdStr);
        }
    }

    // Default redirect
    response.sendRedirect("driverList.jsp");
    
%>
