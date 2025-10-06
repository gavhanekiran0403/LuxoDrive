<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.luxodrive.dao.UserOperation" %>
<%@ page import="com.luxodrive.model.User" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link rel="stylesheet" href="../css/userProfile.css?v=1">
<script>
    window.onload = function() {
        // Hide input fields and save button initially
        document.querySelectorAll('.form-input').forEach(el => el.style.display = 'none');
        document.getElementById('saveBtn').style.display = 'none';
    };

    function toggleEdit() {
        var profileFields = document.querySelectorAll('.profile-field');
        var formElements = document.querySelectorAll('.form-input');
        var saveBtn = document.getElementById('saveBtn');
        var editBtn = document.getElementById('editBtn');
        var heading = document.getElementById('profileHeading');

        // Toggle fields visibility
        profileFields.forEach(p => p.style.display = p.style.display === 'none' ? 'block' : 'none');
        formElements.forEach(input => input.style.display = input.style.display === 'none' ? 'block' : 'none');

        // Toggle buttons
        saveBtn.style.display = saveBtn.style.display === 'none' ? 'inline-block' : 'none';
        editBtn.style.display = editBtn.style.display === 'none' ? 'inline-block' : 'none';

        // Change heading text
        heading.innerText = heading.innerText === 'My Profile' ? 'Edit Profile' : 'My Profile';
    }
</script>
</head>
<body>
<%
    String sessionEmail = (String) session.getAttribute("email");
    if(sessionEmail == null){
        response.sendRedirect("login.jsp");
        return;
    }

    User user = UserOperation.getUserByEmail(sessionEmail);

    // Handle form submission
    if(request.getMethod().equalsIgnoreCase("POST")){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        boolean updated = UserOperation.updateUser(sessionEmail, name, email, phone);

        if(updated){
            session.setAttribute("email", email); // update session if email changed
            session.setAttribute("profileMessage", "Changes saved successfully!");
            session.setAttribute("profileMessageSuccess", true);

            // reload updated user data
            user = UserOperation.getUserByEmail(email);

            response.sendRedirect("userProfile.jsp"); // redirect to clear POST data
            return;
        } else {
            session.setAttribute("profileMessage", "Profile update failed. Try again.");
            session.setAttribute("profileMessageSuccess", false);
            response.sendRedirect("userProfile.jsp");
            return;
        }
    }

    // Read message from session
    String message = (String) session.getAttribute("profileMessage");
    Boolean success = (Boolean) session.getAttribute("profileMessageSuccess");

    // Remove message so it won't show after refresh
    session.removeAttribute("profileMessage");
    session.removeAttribute("profileMessageSuccess");
%>
<jsp:include page="userNavbar.jsp"></jsp:include>

<div class="container">
    <div class="card">
        <!-- Heading with ID for JS toggle -->
        <div class="card-header" id="profileHeading">My Profile</div>

        <% if(message != null){ %>
            <p class="profile-message" style="color:<%= success ? "green" : "red" %>;"><%= message %></p>
        <% } %>

        <form action="userProfile.jsp" method="post">
            <!-- Name -->
            <div class="form-group">
                <label>Name:</label>
                <p class="profile-field"><%= user.getFullName() %></p>
                <input type="text" name="name" class="form-input" value="<%= user.getFullName() %>" required>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label>Email:</label>
                <p class="profile-field"><%= user.getEmail() %></p>
                <input type="email" name="email" class="form-input" value="<%= user.getEmail() %>" required>
            </div>

            <!-- Phone -->
            <div class="form-group">
                <label>Phone:</label>
                <p class="profile-field"><%= user.getPhoneNo() %></p>
                <input type="text" name="phone" class="form-input" value="<%= user.getPhoneNo() %>" required>
            </div>

            <!-- Buttons -->
            <div class="button-group">
                <button type="button" class="btn-edit" id="editBtn" onclick="toggleEdit()">Edit Profile</button>
                <button type="submit" class="btn-save" id="saveBtn">Save Changes</button>
                <a href="userDashboard.jsp" class="btn-back">Back to Home</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
