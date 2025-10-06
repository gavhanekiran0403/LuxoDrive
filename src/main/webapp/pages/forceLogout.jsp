<%@ page import="com.luxodrive.model.User" %>
<%@ page import="com.luxodrive.dao.UserOperation" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.luxodrive.jdbc.connection.DBConnection" %>

<%
    String userIdStr = request.getParameter("userId");

    if (userIdStr != null && !userIdStr.isEmpty()) {
        try {
            int userId = Integer.parseInt(userIdStr);
            User user = UserOperation.getUserById(userId);

            if (user != null) {
            
                try (Connection con = DBConnection.getConnection()) {
                    PreparedStatement ps = con.prepareStatement(
                        "UPDATE users SET status='offline' WHERE TRIM(email)=?"
                    );
                    ps.setString(1, user.getEmail().trim());
                    ps.executeUpdate();
                }

                HttpSession userSession = (HttpSession) application.getAttribute("user_" + userId);
                if (userSession != null) {
                    userSession.invalidate();
                    application.removeAttribute("user_" + userId);
                }
            }

            response.sendRedirect("adminDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("userList.jsp");
    }
%>
