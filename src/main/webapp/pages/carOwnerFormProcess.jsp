<%@page import="com.luxodrive.model.Car"%>
<%@page import="com.luxodrive.dao.BankAccountOperation"%>
<%@page import="com.luxodrive.model.BankAccount"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@ page import="jakarta.servlet.http.Part" %>

<%! 
	private String getValue(Part part) throws IOException {
		if(part != null){
			try(InputStream in = part.getInputStream()){
				return new String(in.readAllBytes()).trim();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return null;
	}
%>

<%  
	String ownerIdStr = getValue(request.getPart("ownerId"));
	System.out.println("owner id : "+ownerIdStr);
	int ownerId = ownerIdStr != null && !ownerIdStr.isEmpty() ? Integer.parseInt(ownerIdStr) : 0;
	String ownerName = getValue(request.getPart("ownerName"));
	String phoneNo = getValue(request.getPart("phoneNo"));
	String email = getValue(request.getPart("email"));
	String address = getValue(request.getPart("address"));
	
	CarOwner existingCarOwner = null;
	if(ownerId > 0){
		existingCarOwner = CarOwnerOperation.getCarOwnerById(ownerId);
	}
	
	Part partImage = request.getPart("aadharImage");
	byte[] aadharImage = null;
	if(partImage != null){
		try(InputStream in = partImage.getInputStream()){
			aadharImage = in.readAllBytes();
		}	
	}else if(existingCarOwner != null && existingCarOwner.getAadharImage() != null){
		aadharImage = existingCarOwner.getAadharImage();
	}
	
	String bankAccIdStr = getValue(request.getPart("bankAccId"));
	System.out.println("bank id : "+bankAccIdStr);
	int bankAccId = bankAccIdStr != null && !bankAccIdStr.isEmpty() ? Integer.parseInt(bankAccIdStr) : 0;
	String bankName = getValue(request.getPart("bankName"));
	String accountNo = getValue(request.getPart("accountNo"));
	String ifscNo = getValue(request.getPart("ifscNo"));

	BankAccount bankAccount = new BankAccount();
	bankAccount.setAccHolderName(ownerName);
	bankAccount.setBankName(bankName);
	bankAccount.setAccountNo(accountNo);
	bankAccount.setIfscNo(ifscNo);

	int genBankAccId = 0;
	if (bankAccId > 0) {
	    bankAccount.setBankAccId(bankAccId);
	    BankAccountOperation.updateBankAccount(bankAccount);
	    genBankAccId = bankAccId;
	} else {
	    genBankAccId = BankAccountOperation.addBankAccount(bankAccount);
	}

	if (genBankAccId > 0) {
	    bankAccount.setBankAccId(genBankAccId);

	    CarOwner carOwner = new CarOwner();
	    carOwner.setOwnerId(ownerId);
	    carOwner.setOwnerName(ownerName);
	    carOwner.setPhoneNo(phoneNo);
	    carOwner.setEmail(email);
	    carOwner.setAddress(address);
	    carOwner.setAadharImage(aadharImage);
	    carOwner.setBankAccount(bankAccount);

	    int row = CarOwnerOperation.addOrUpdate(carOwner);

	    if(row > 0){
	        response.sendRedirect("carOwnerList.jsp");
	    } else {
	        response.sendRedirect("carOwnerForm.jsp");
	        System.out.println("Car Owner not inserted");
	    }
	} else {
	    response.sendRedirect("carOwnerForm.jsp");
	    System.out.println("Bank account not inserted");
	}

%>