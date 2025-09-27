<%@page import="com.luxodrive.model.BankAccount"%>
<%@page import="com.luxodrive.dao.BankAccountOperation"%>
<%@page import="com.luxodrive.dao.DriverOperation"%>
<%@page import="com.luxodrive.model.Driver"%>

<%

    // Get driver parameters
    String driverIdStr = request.getParameter("driverId");
    int driverId = driverIdStr != null ? Integer.parseInt(driverIdStr) : 0;

  
    Driver existingDriver = DriverOperation.getDriverById(driverId);

    String fullName = request.getParameter("fullName");
    String licenseNo = request.getParameter("licenseNo");
    String phoneNo = request.getParameter("phoneNo");
    String email = request.getParameter("email");
    String address = request.getParameter("address");

    // Get bank account parameters
    String bankName = request.getParameter("bankName");
    String accountNo = request.getParameter("accountNo");
    String ifscNo = request.getParameter("ifscNo");

    // Create BankAccount object
    BankAccount bankAccount = new BankAccount();
    bankAccount.setAccHolderName(fullName);
    bankAccount.setBankName(bankName);
    bankAccount.setAccountNo(accountNo);
    bankAccount.setIfscNo(ifscNo);

    int bankAccId = 0;
    
    if (existingDriver != null && existingDriver.getBankAccount() != null) {
    	
        bankAccount.setBankAccId(existingDriver.getBankAccount().getBankAccId());
        
        int bankRow = BankAccountOperation.updateBankAccount(bankAccount); // update existing
        
        bankAccId = bankAccount.getBankAccId();
        
    } else {
    	
        bankAccId = BankAccountOperation.addBankAccount(bankAccount);
    }

    if (bankAccId > 0) {
    	
        bankAccount.setBankAccId(bankAccId);

        // Create and set driver
        Driver driver = new Driver();
        driver.setDriverId(driverId);
        driver.setFullName(fullName);
        driver.setLicenseNo(licenseNo);
        driver.setPhoneNo(phoneNo);
        driver.setEmail(email);
        driver.setAddress(address);
        driver.setBankAccount(bankAccount); // Attach bank account

        int row;
        if (existingDriver != null) {
        	
            row = DriverOperation.updateDriver(driver);
            
            if (row > 0) {
            	
                request.setAttribute("sucessMsg", "Driver updated successfully!");
                request.getRequestDispatcher("driverList.jsp").forward(request, response);
                
            } else {
            	
                request.setAttribute("errorMsg", "Driver update failed!");
                request.getRequestDispatcher("driverList.jsp").forward(request, response);
            }
            
        } else {
        	
            row = DriverOperation.addDrivers(driver);
            
            if (row > 0) {
            	
                request.setAttribute("sucessMsg", "Driver inserted successfully!");
                request.getRequestDispatcher("driverList.jsp").forward(request, response);
                
            } else {
            	
                request.setAttribute("errorMsg", "Driver insert failed!");
                request.getRequestDispatcher("driverList.jsp").forward(request, response);
                
            }
        }
    }
%>
