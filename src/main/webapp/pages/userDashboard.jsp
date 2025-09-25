<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Car Rental - Admin DashBoard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
    
</head>
<body class="first-color">
    
    <jsp:include page="userNavbar.jsp"></jsp:include>
    
    <!-- baner tag Section start-->
    <div class="container-fluid hero-section d-flex align-items-center text-center text-white">
        <div class="container">
        	<h1 class="display-4 fw-bold">Welcome to User DashBoard</h1>
           <!--  <h1 class="display-4 fw-bold">Drive Your Dream Car</h1>
            <p class="lead">Luxury & budget cars at unbeatable prices. Book online & ride with comfort.</p>
            <a href="#booking" class="btn btn-warning btn-lg rounded-pill">Book Now</a> -->
        </div>
    </div>

    <!-- baner tag Section end-->
    
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>