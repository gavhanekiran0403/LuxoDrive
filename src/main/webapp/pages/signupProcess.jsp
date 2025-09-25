<%@page import="com.luxodrive.dao.UserOperation"%>
<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.jdbc.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String fullName = request.getParameter("fullName");
    String phoneNo = request.getParameter("phoneNo");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    if (!password.equals(confirmPassword)) {
        session.setAttribute("signupErrorMsg", "Passwords do not match. Try again.");
	    request.getRequestDispatcher("signup.jsp").forward(request, response);
    } else {
    	User user = new User();
    	user.setFullName(fullName);
    	user.setPhoneNo(phoneNo);
    	user.setEmail(email);
    	user.setPassword(password);
    	user.setConfirmPassword(confirmPassword);
    	
    	int row= UserOperation.registerUser(user);
    	
    	if (row > 0) {
    	    session.setAttribute("signupSuccessMsg", "User registered successfully! ");
    	    request.getRequestDispatcher("login.jsp").forward(request, response);
    	} else {
    	    session.setAttribute("signupErrorMsg", "User registration failed. Try again.");
    	    request.getRequestDispatcher("signup.jsp").forward(request, response);
    	}
	}
}
%>