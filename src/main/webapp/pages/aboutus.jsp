<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aboutus Page</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
</head>
<body>

    <jsp:include page="userNavbar.jsp"></jsp:include>

<!-- baner tag Section start-->

    <section class="about-hero">
        <div class="container">
            <h1>About Us</h1>
            <p>Learn more about our journey and values</p>
        </div>
    </section>

    <!-- baner tag Section end-->


    <!-- About Content section start -->

    <section class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 mb-4 mb-md-0">
                    <img src="../images/mercidies.jpg" class="img-fluid rounded shadow" alt="About Car Rental">
                </div>
                <div class="col-md-6">
                    <h2 class="mb-3">Who We Are</h2>
                    <p class="about-text">
                        At <b>LuxoDrive Rentals</b>, we specialize in offering premium and budget-friendly cars for every occasion. Whether you’re planning a road trip, a business journey, or a weekend getaway, we ensure that you have the perfect ride
                        at the best rates.
                    </p>
                    <p class="about-text">
                        With years of experience in the industry, our commitment is simple: provide reliable, safe, and affordable cars to our customers while ensuring excellent service.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- About Content section end -->


    <!-- Mission, Vision, Values section start-->

    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4">Our Mission & Values</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="icon-box text-center shadow-sm">
                        <i class="fas fa-bullseye fa-3x text-primary"></i>
                        <h5>Our Mission</h5>
                        <p>To provide a hassle-free, reliable, and enjoyable car rental experience for all customers.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box text-center shadow-sm">
                        <i class="fas fa-eye fa-3x text-success"></i>
                        <h5>Our Vision</h5>
                        <p>To be the most trusted car rental brand, known for affordability, safety, and customer satisfaction.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box text-center shadow-sm">
                        <i class="fas fa-heart fa-3x text-danger"></i>
                        <h5>Our Values</h5>
                        <p>Integrity, reliability, customer-first approach, and continuous innovation.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission, Vision, Values section end-->


    <!-- Why Choose Us section start -->

    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Why Choose Us?</h2>
            <div class="row text-center">
                <div class="col-md-3">
                    <i class="fas fa-car-side fa-2x text-primary mb-2"></i>
                    <h6>Wide Range of Cars</h6>
                </div>
                <div class="col-md-3">
                    <i class="fas fa-wallet fa-2x text-success mb-2"></i>
                    <h6>Affordable Pricing</h6>
                </div>
                <div class="col-md-3">
                    <i class="fas fa-shield-alt fa-2x text-danger mb-2"></i>
                    <h6>Safe & Secure</h6>
                </div>
                <div class="col-md-3">
                    <i class="fas fa-headset fa-2x text-warning mb-2"></i>
                    <h6>24/7 Support</h6>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us section end -->

   <jsp:include page="footer.jsp"></jsp:include>

    
</body>
</html>