<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.dao.UserOperation"%>
<%@page import="java.util.List"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users List Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userList.css">

</head>
<body>

<jsp:include page="adminNavbar.jsp"></jsp:include>

<%
   List<User> users = UserOperation.getAllUsers();
   request.setAttribute("users", users);
%>


<div class="list-container">
    <div class="header-row">
         <h1>Users List</h1>
    </div>
    <table>
        <thead>
            <tr>
                <th>User Id</th>
                <th>User Name</th>
                <th>PhoneNo.</th>
                <th>Email</th>
                <th>Password</th>
                <th>ConfirmPassword</th>
                <th>Role</th>
                <th>Status</th>
                <!-- <th>Action</th> -->
                </tr>
        </thead>
        <c:choose>
        	<c:when test="${empty users }">
        		<tbody>
        			<tr>
        				<td>
        					Users details not available.
        				</td>
        			</tr>
        		</tbody>
        	</c:when>
        	<c:otherwise>
        		<tbody>
           			<c:forEach var="user" items="${users}">
    					<tr>
        					<td>${user.userId}</td>
        					<td>${user.fullName}</td>
        					<td>${user.phoneNo}</td>
        					<td>${user.email}</td>
        					<td>${user.password}</td>
        					<td>${user.confirmPassword}</td>
        					<td>${user.role}</td>
        					<td>${user.status}</td>
        					<%-- <c:if test="${user.role eq 'user' }">
        						<td>
           						<a href="forceLogout.jsp?userId=${user.userId}" class="link-delete"  
           						onclick="return confirm('Are you sure you want to logout this user?');">ForceLogout</a>
        						</td>
       	 					</c:if> --%>
   						</tr>
       				</c:forEach>
				</tbody>
        	</c:otherwise>
        </c:choose> 
    </table>
</div>

</body>
</html>