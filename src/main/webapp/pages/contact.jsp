<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Page</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
</head>
<body>

    <jsp:include page="userNavbar.jsp"></jsp:include>

    <!-- Cars Feature section start-->


    <section class="contact-hero">
        <div class="container">
            <h1>Contact Us</h1>
            <p>We’re here to help you 24/7 with your rental needs</p>
        </div>
    </section>


    <section class="py-5">
        <div class="container">
            <div class="row">

                <div class="col-md-6 mb-4">
                    <div class="contact-form">
                        <h3>Get in Touch</h3>
                        <form>
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter your full name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number">
                            </div>
                            <div class="form-group">
                                <label for="message">Your Message</label>
                                <textarea class="form-control" id="message" rows="4" placeholder="Type your message"></textarea>
                            </div>
                            <button type="submit" class="btn btn-submit">Send Message</button>
                        </form>
                    </div>
                </div>

                <div class="col-md-6">
                    <h3>Contact Information</h3>
                    <p><i class="fas fa-map-marker-alt"></i> Pune, India</p>
                    <p><i class="fas fa-phone-alt"></i> 9999988888</p>
                    <p><i class="fas fa-envelope"></i> www.luxodrive.com</p>

                    <div class="mt-4">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3783.312809661121!2d73.8567438153589!3d18.520430387410994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c06d4fbbf1b1%3A0x7a2a1d0d88b8f1c4!2sPune%2C%20Maharashtra%2C%20India!5e0!3m2!1sen!2sin!4v1638183499840!5m2!1sen!2sin"
                            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- info Feature section end-->



   <jsp:include page="footer.jsp"></jsp:include>

    
</body>
</html>