<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Services Page</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
</head>
<body>
	
	<jsp:include page="userNavbar.jsp"></jsp:include>
	
	 <!-- banner section start -->

    <section class="service-hero">
        <div class="container">
            <h1>Our Services</h1>
            <p>Discover everything we offer to make your journy smooth & comfortable</p>
        </div>
    </section>

    <!-- banner section end-->

    <!-- card section start-->

    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">what We Offer</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="service-card">
                        <i class="fas fa-car-side"></i>
                        <h5>Self Drive Rentals</h5>
                        <p>Choose from a wide variety of cars for your self-drive needs at flexible rates.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <i class="fas fa-user-tie"></i>
                        <h5>Chauffeur Services</h5>
                        <p>Enjoy luxury and convenience with our professional driver service for all occasions.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <i class="fas fa-calendar-check"></i>
                        <h5>Corporate Booking</h5>
                        <p>Special packages for businesses & organizations needing reliable transportation.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- card section end -->

    <!-- car categoris section start-->
   <!--  <div id="categories" class="container my-5">
        <h2 class="text-center mb-4">Car Categories</h2>
        <div class="row g-4 text-center">

            <div class="col-md-3">
                <div class="p-4 border rounded shadow-sm">
                    <img src="../images/luxury-car-speeds-by-modern-building-dusk-generative-ai.jpg" alt="Luxury Cars" class="img-fluid rounded mb-3" style="height:150px; object-fit:cover;">
                    <h5>Luxury</h5>
                    <p>Mercedes, BMW, Audi</p>
                </div>
            </div>

            <div class="col-md-3">
                <div class="p-4 border rounded shadow-sm">
                    <img src="../images/range rover.jpg" alt="SUV Cars" class="img-fluid rounded mb-3" style="height:150px; object-fit:cover;">
                    <h5>SUV</h5>
                    <p>Toyota Fortuner,Range Rover</p>
                </div>
            </div>

            <div class="col-md-3">
                <div class="p-4 border rounded shadow-sm">
                    <img src="../images/octaviarsoctaviarsrightfrontthreequarter.webp" alt="Sedan Cars" class="img-fluid rounded mb-3" style="height:150px; object-fit:cover;">
                    <h5>Sedan</h5>
                    <p>Honda City, Skoda Octavia</p>
                </div>
            </div>

            <div class="col-md-3">
                <div class="p-4 border rounded shadow-sm">
                    <img src="../images/swiftmarutisuzukiswiftfrontview1.webp" alt="Economy Cars" class="img-fluid rounded mb-3" style="height:150px; object-fit:cover;">
                    <h5>Economy</h5>
                    <p>Swift, i20, WagonR</p>
                </div>
            </div>

        </div>
    </div> -->

    <!-- car categoris section end-->

    <!-- Services section start -->

    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Why Choose Us?</h2>
            <div class="row text-center">
                <div class="col-md-3">
                    <i class="fas fa-money-bill-wave fa-2x text-success mb-2"></i>
                    <h6>Affordable Pricing</h6>
                </div>
                <div class="col-md-3">
                    <i class="fas fa-headset fa-2x text-primary mb-2"></i>
                    <h6>24/7 Support</h6>
                </div>
                <div class="col-md-3">
                    <i class="fas fa-map-marker-alt fa-2x text-danger mb-2"></i>
                    <h6>Nationwide Coverage</h6>
                </div>
                <div class="col-md-3">
                    <i class="fas fa-gem fa-2x text-warning mb-2"></i>
                    <h6>Premium Cars</h6>
                </div>
            </div>
        </div>
    </section>

    <!-- Services section end -->
    
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>