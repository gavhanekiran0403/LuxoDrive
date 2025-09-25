<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Car Rental - LuxoDrive</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="../css/home.css">
    
</head>

<body>

    <!-- Navbar start -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top px-4 px-lg-5 py-lg-0">
        <a href="#" class="navbar-brand p-0">
            <img src="../images/luxodrive11-removebg-preview.png" alt="LuxoDrive Logo" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    <span class="fa fa-bars"></span>
  </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <a href="home.jsp" class="nav-item nav-link active">Home</a>
                <a href="Aboutus.html" class="nav-item nav-link">About</a>
                <a href="Cars.html" class="nav-item nav-link">Cars</a>
                <a href="Services.html" class="nav-item nav-link">Services</a>
                <a href="Booking.html" class="nav-item nav-link">Booking</a>
                <a href="Contact.html" class="nav-item nav-link">Contact</a>
            </div>
            <a href="login.jsp" class="btn btn-primary rounded-pill py-2 px-4">Log In</a>
        </div>
    </nav>

    <!-- Navbar end -->

    <!-- baner tag Section start-->
    <div class="container-fluid hero-section d-flex align-items-center text-center text-white">
        <div class="container">
            <h1 class="display-4 fw-bold">Drive Your Dream Car</h1>
            <p class="lead">Luxury & budget cars at unbeatable prices. Book online & ride with comfort.</p>
            <a href="#booking" class="btn btn-warning btn-lg rounded-pill">Book Now</a>
        </div>
    </div>

    <!-- baner tag Section end-->

    <!-- About start-->

    <div id="about" class="container my-5">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <img src="../images/view-three-dimensional-car-with-simple-background.jpg" class="img-fluid rounded" alt="About">
            </div>
            <div class="col-lg-6">
                <h2>About LuxoDrive</h2>
                <p>We provide affordable and luxury car rental services across India. Whether you need a car for business, travel, or special occasions, LuxoDrive has you covered.</p>
                <ul>
                    <li>✔ Affordable prices</li>
                    <li>✔ 24/7 Customer Support</li>
                    <li>✔ Wide range of cars</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- About start-->


    <!-- Car Categories start -->

    <div id="categories" class="container my-5">
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
                    <img src="../images//swiftmarutisuzukiswiftfrontview1.webp" alt="Economy Cars" class="img-fluid rounded mb-3" style="height:150px; object-fit:cover;">
                    <h5>Economy</h5>
                    <p>Swift, i20, WagonR</p>
                </div>
            </div>

        </div>
    </div>

    <!-- Car Categories end -->



    <!-- Cars Feature section start-->

    <div id="cars" class="container my-5">
        <h2 class="text-center mb-4">Our Featured Cars</h2>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card shadow">
                    <img src="../images/bmw x5.jpg" class="card-img-top" alt="Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">BMW X5</h5>
                        <p>Luxury SUV - ₹5000/day</p>
                        <p class="text-warning">⭐⭐⭐⭐⭐ (5.0)</p>
                        <a href="#booking" class="btn btn-sm btn-primary rounded-pill">Rent Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow">
                    <img src="../images/mercedes.jpg" class="card-img-top" alt="Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">Mercedes S-Class</h5>
                        <p>Luxury Sedan - ₹8000/day</p>
                        <p class="text-warning">⭐⭐⭐⭐ (4.5)</p>
                        <a href="#booking" class="btn btn-sm btn-primary rounded-pill">Rent Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow">
                    <img src="../images/fortuner.jpg" class="card-img-top" alt="Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">Toyota Fortuner</h5>
                        <p>SUV - ₹3500/day</p>
                        <p class="text-warning">⭐⭐⭐⭐ (4.2)</p>
                        <a href="#booking" class="btn btn-sm btn-primary rounded-pill">Rent Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow">
                    <img src="../images/honda city.jpg" class="card-img-top" alt="Car">
                    <div class="card-body text-center">
                        <h5 class="card-title">Honda City</h5>
                        <p>Sedan - ₹2000/day</p>
                        <p class="text-warning">⭐⭐⭐ (3.8)</p>
                        <a href="#booking" class="btn btn-sm btn-primary rounded-pill">Rent Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Cars Feature section end-->


    <!-- Services section start -->

    <div id="services" class="container my-5">
        <h2 class="text-center mb-4">Our Services</h2>
        <div class="row g-4">
            <div class="col-md-3 text-center">
                <i class="fa fa-car fa-3x text-primary mb-3"></i>
                <h5>Wide Range</h5>
                <p>Choose from luxury sedans, SUVs, hatchbacks, and more.</p>
            </div>
            <div class="col-md-3 text-center">
                <i class="fa fa-headset fa-3x text-primary mb-3"></i>
                <h5>24/7 Support</h5>
                <p>Always available for bookings & queries.</p>
            </div>
            <div class="col-md-3 text-center">
                <i class="fa fa-shield-alt fa-3x text-primary mb-3"></i>
                <h5>Insurance</h5>
                <p>Every ride is fully insured & safe.</p>
            </div>
            <div class="col-md-3 text-center">
                <i class="fa fa-dollar-sign fa-3x text-primary mb-3"></i>
                <h5>Best Pricing</h5>
                <p>Competitive rates, no hidden charges.</p>
            </div>
        </div>
    </div>

    <!-- Services section end -->


    <!-- Booking Form start -->

    <div id="booking" class="container my-5">
        <div class="bg-light p-4 rounded shadow">
            <h2 class="text-center mb-4">Book Your Car</h2>
            <form class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" placeholder="Enter your name">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" placeholder="Enter your email">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Phone</label>
                    <input type="tel" class="form-control" placeholder="Enter phone number">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Car Type</label>
                    <select class="form-control">
            <option>Luxury</option>
            <option>SUV</option>
            <option>Sedan</option>
            <option>Economy</option>
          </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Pick-up Location</label>
                    <input type="text" class="form-control" placeholder="Enter city or airport">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Drop Location</label>
                    <input type="text" class="form-control" placeholder="Enter drop city">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Pick-up Date</label>
                    <input type="date" class="form-control">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Return Date</label>
                    <input type="date" class="form-control">
                </div>
                <div class="col-md-12">
                    <label class="form-label">Payment Method</label>
                    <select class="form-control">
            <option>Credit Card</option>
            <option>Debit Card</option>
            <option>UPI</option>
            <option>Cash on Delivery</option>
          </select>
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary px-5 rounded-pill">Confirm Booking</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Booking Form end -->


    <!-- Footer start -->

    <footer class="footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4">
                    <h5>LuxoDrive Rentals</h5>
                    <p>Your trusted partner for luxury & budget car rentals. Drive your dream car with comfort and safety.</p>
                </div>

                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="cars.html">Our Cars</a></li>
                        <li><a href="services.html">Services</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>

                <div class="col-md-4">
                    <h5>Contact Us</h5>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, New York, USA</p>
                    <p><i class="fas fa-phone-alt"></i> +012 345 6789</p>
                    <p><i class="fas fa-envelope"></i> info@luxodrive.com</p>
                    <div class="social mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2025 LuxoDrive Rentals | All Rights Reserved
            </div>
        </div>
    </footer>

    <!-- Footer end -->

</body>

</html>