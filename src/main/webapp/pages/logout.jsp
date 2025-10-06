<%@ page import="java.sql.*" %>
<%@ page import="com.luxodrive.jdbc.connection.DBConnection" %>

<%
String email = (String) session.getAttribute("email");

if (email != null && !email.trim().isEmpty()) {
    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE users SET status = 'offline' WHERE email = ?")
    ) {
        ps.setString(1, email.trim());
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

session.invalidate();
response.sendRedirect("home.jsp");
%>
