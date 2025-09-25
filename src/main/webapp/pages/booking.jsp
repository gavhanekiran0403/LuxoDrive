<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Page</title>
	
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="../css/home.css">
</head>
<body>

	<jsp:include page="userNavbar.jsp"></jsp:include>
	
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
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>