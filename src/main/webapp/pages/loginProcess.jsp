<%@page import="com.luxodrive.model.User"%>
<%@page import="com.luxodrive.model.Login"%>
<%@page import="com.luxodrive.dao.UserOperation"%>
<%@page import="com.luxodrive.jdbc.connection.DBConnection"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if(email == null || email.isEmpty() || password == null || password.isEmpty()) {
    session.setAttribute("loginErrorMsg", "Please enter both email and password.");
    request.getRequestDispatcher("login.jsp").forward(request, response);
    return;
}

try (Connection con = DBConnection.getConnection()) {
	
    PreparedStatement checkPs = con.prepareStatement(
        "SELECT email FROM users WHERE email=? AND status='online'"
    );
    checkPs.setString(1, email.trim());
    ResultSet rs = checkPs.executeQuery();
    if(rs.next()) {
        session.setAttribute("loginErrorMsg", "This account is already logged in. Please logout first.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    Login login = new Login();
    login.setEmail(email);
    login.setPassword(password);
    User user = UserOperation.login(login);

    if(user == null) {
        session.setAttribute("loginErrorMsg", "Invalid email or password!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    PreparedStatement ps = con.prepareStatement("UPDATE users SET status='online' WHERE email=?");
    ps.setString(1, user.getEmail().trim());
    ps.executeUpdate();

    session.setAttribute("fullName", user.getFullName());
    session.setAttribute("role", user.getRole());
    session.setAttribute("email", user.getEmail().trim());

    if("user".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("userDashboard.jsp");
    } else if("admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("adminDashboard.jsp");
    } else {
        session.setAttribute("loginErrorMsg", "Unknown role. Contact admin.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

} catch (Exception e) {
    e.printStackTrace(); 
    session.setAttribute("loginErrorMsg", "Login error: " + e.getMessage());
    request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>
