<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String orderId = request.getParameter("orderId");
if(orderId == null){
    orderId = "FD" + System.currentTimeMillis();
}

String paymentMode = (String)session.getAttribute("paymentMode");
if(paymentMode == null){
    paymentMode = "Cash on Delivery";
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Order Confirmed</title>

<link rel="stylesheet" href="css/orderConfirmation.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">


   <style type="text/css">
   /* ================================
   Order Confirmation Page
================================ */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background: #f5f7fb;
    color: #222;
    min-height: 100vh;
}

/* Main container */
.container {
    min-height: calc(100vh - 66px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* Confirmation card */
.card {
    width: 100%;
    max-width: 650px;
    background: #ffffff;
    padding: 40px;
    border-radius: 18px;
    box-shadow: 0 10px 35px rgba(0, 0, 0, 0.12);
    text-align: center;
}

/* Success icon */
.success-icon {
    width: 75px;
    height: 75px;
    margin: 0 auto 20px;

    display: flex;
    justify-content: center;
    align-items: center;

    background: #e8f8ee;
    color: #20a464;

    border-radius: 50%;
    font-size: 42px;
    font-weight: 700;
}

/* Heading */
.card h1 {
    font-size: 30px;
    color: #222;
    margin-bottom: 12px;
}

/* Subtitle */
.subtitle {
    color: #666;
    font-size: 15px;
    line-height: 1.7;
}

/* Divider */
.divider {
    height: 1px;
    background: #e5e5e5;
    margin: 28px 0;
}

/* Order details */
.details {
    text-align: left;
    margin-bottom: 25px;
}

.row {
    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 14px 0;
    border-bottom: 1px solid #eeeeee;

    font-size: 15px;
}

.row span {
    color: #777;
}

.row strong {
    color: #222;
    font-weight: 600;
}

.row .green {
    color: #20a464;
}

/* Delivery box */
.delivery-box {
    display: flex;
    align-items: center;
    gap: 15px;

    text-align: left;

    background: #fff7ed;
    border: 1px solid #ffe0bf;

    padding: 18px;
    border-radius: 12px;

    margin-bottom: 30px;

    font-size: 30px;
}

.delivery-box h3 {
    color: #333;
    font-size: 17px;
    margin-bottom: 5px;
}

.delivery-box p {
    color: #777;
    font-size: 13px;
    line-height: 1.5;
}

/* Buttons */
.buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
    flex-wrap: wrap;
}

.btn-primary,
.btn-secondary {
    display: inline-block;

    padding: 12px 24px;

    border-radius: 8px;

    text-decoration: none;

    font-size: 14px;
    font-weight: 600;

    transition: all 0.3s ease;
}

/* Continue Shopping */
.btn-primary {
    background: #ff6b35;
    color: white;
}

.btn-primary:hover {
    background: #e85a27;
    transform: translateY(-2px);
}

/* Track Orders */
.btn-secondary {
    background: white;
    color: #ff6b35;
    border: 1px solid #ff6b35;
}

.btn-secondary:hover {
    background: #ff6b35;
    color: white;
    transform: translateY(-2px);
}

/* Responsive */
@media (max-width: 600px) {

    .container {
        padding: 25px 15px;
    }

    .card {
        padding: 25px 20px;
    }

    .card h1 {
        font-size: 24px;
    }

    .row {
        font-size: 13px;
    }

    .delivery-box {
        font-size: 24px;
    }

    .buttons {
        flex-direction: column;
    }

    .btn-primary,
    .btn-secondary {
        width: 100%;
        text-align: center;
    }
}

   </style>
</head>

<body>

    <!-- header -->

	<jsp:include page="header.jsp"/>
    
<div class="container">

    <div class="card">
        <div class="success-icon"> ✓ </div>
        
        <h1>Order Placed Successfully!</h1>
        <p class="subtitle">
            Thank you for ordering with us.
            Your delicious food is being prepared.
        </p>

        <div class="divider"></div>

        <div class="details">

            <div class="row">
                <span>Order ID</span>
                <strong>#<%=orderId%></strong>
            </div>

            <div class="row">
                <span>Status</span>
                <strong class="green">Confirmed</strong>
            </div>

            <div class="row">
                <span>Estimated Delivery</span>
                <strong>25 - 35 Minutes</strong>
            </div>

            <div class="row">
                <span>Payment</span>
                <strong><%=paymentMode%></strong>
            </div>

        </div>

        <div class="delivery-box"> 🚴
            <div>
                <h3>Your order is on the way!</h3>
                <p> Our delivery partner will pick up your food shortly.</p>
            </div>
        </div>

        <div class="buttons">
            <a href="RestaurantServlet" class="btn-primary"> Continue Shopping</a>
            <a href="orders.jsp" class="btn-secondary">Track Orders</a>
        </div>
    </div>

</div>

</body>
</html>