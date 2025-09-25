
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Map<Integer, String> map = new HashMap<Integer, String>();
		map.put(1, "Kiran");
		map.put(2, "Ritesh");
		map.put(3, "Prakash");
	%>
	<form action="NewFile.jsp" method="post">
	<label>Driver :</label>
	<select name="driverId" required>
		<option value="">Select the driver</option>
		<% for(Map.Entry<Integer, String> m : map.entrySet()){%>
		<option value="<%=m.getKey() %>"><%=m.getValue() %></option>
		<% } %>
	</select>
	<button type="submit">Submit</button>
	</form>
	
	<% 
	String id = request.getParameter("driverId"); 
	out.println("<h2> Driver id : "+id+"</h2>");
	%>
</body>
</html>