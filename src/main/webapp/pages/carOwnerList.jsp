<%@page import="com.luxodrive.model.CarOwner"%>
<%@page import="java.util.List"%>
<%@page import="com.luxodrive.dao.CarOwnerOperation"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Owner List Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carOwnerList.css">

</head>
<body>

<jsp:include page="adminNavbar.jsp"></jsp:include>

<%
    List<CarOwner> carOwners = CarOwnerOperation.getAllCarOwner();
    request.setAttribute("carOwners", carOwners);
%>

<div class="list-container">
    <div class="header-row">
        <a href="carOwnerForm.jsp" class="btn">Add Car Owner</a>
        <h1>Car Owner List</h1>
    </div>
    <table>
        <thead>
            <tr>
                <th>Owner Id</th>
                <th>Owner Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Aadhar Card</th>
                <th>Bank Account</th>
                <th>Cars</th>
                <th>Action</th>
            </tr>
        </thead>
        <c:choose>
        	<c:when test="${empty carOwners }">
        		<tbody>
        			<tr>
        				<td colspan="9">
        					Car owners details not available.
        				</td>
        			</tr>
        		</tbody>
        	</c:when>
        	<c:otherwise>
        		<tbody>
            		<c:forEach var="carOwner" items="${carOwners}">
                		<tr>
                    		<td>${carOwner.ownerId}</td>
                    		<td>${carOwner.ownerName}</td>
                    		<td>${carOwner.phoneNo}</td>
                    		<td>${carOwner.email}</td>
                    		<td>${carOwner.address}</td>
                    		<td>
                        		<!-- Thumbnail -->
                        		<a href="viewImage.jsp?id=${carOwner.ownerId}">
                        			<img src="viewImage.jsp?id=${carOwner.ownerId}" 
                            	 	width="60" alt="Aadhar Card"/>
                        		</a>
                    		</td>
                    		<td>
                    			<a href="bankDetails.jsp?id=${carOwner.ownerId}" class="view-bank">View Bank Details</a>
                    		</td>
                    		<td>
                    			<a href="viewCars.jsp?id=${carOwner.ownerId}" class="view-cars">View Cars</a>
                    		</td>
                    		<td>
                        		<a href="carOwnerForm.jsp?ownerId=${carOwner.ownerId }" class="link-update">Update</a> |
                        		<a href="delete.jsp?ownerId=${carOwner.ownerId }" class="link-delete" onclick="return confirm('Are you sure you want to delete?');">Delete</a>
                    		</td>
                		</tr>
            		</c:forEach>
        		</tbody>
        	</c:otherwise>
        </c:choose>
    </table>
</div>

</body>
</html>
