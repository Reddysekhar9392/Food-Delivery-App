<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Foodiee.model.Cart"%>
<%@ page import="com.Foodiee.model.CartItem"%>
<%@ page import="com.Foodiee.DAOImpl.MenuDAOImpl"%>
<%@ page import="com.Foodiee.model.Menu"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

  <style type="text/css">
  
     *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#171b26;
    color:#ffffff;
}

/*==========================
      MAIN CONTAINER
===========================*/

.checkout-container{
    width:95%;
    max-width:1450px;
    margin:35px auto;
}

.checkout-heading{
    text-align:center;
    margin-bottom:35px;
}

.checkout-heading h1{
    font-size:42px;
    color:#ff7a45;
    font-weight:700;
}

.checkout-heading p{
    color:#9fa7bc;
    margin-top:10px;
    font-size:16px;
}

/*==========================
      TWO COLUMN LAYOUT
===========================*/

.checkout-layout{
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:28px;
    align-items:start;
}

.left-section{
    width:100%;
}

.right-section{
    width:100%;
    position:sticky;
    top:20px;
}

/*==========================
         CARD
===========================*/

.checkout-card{
    background:#262b3b;
    border:1px solid #34394a;
    border-radius:18px;
    padding:30px;
    box-shadow:0 12px 30px rgba(0,0,0,.35);
}

/*==========================
      SECTION TITLE
===========================*/

.section-title{
    display:flex;
    align-items:center;
    gap:12px;
    margin-bottom:30px;
    color:#ffffff;
    font-size:28px;
    font-weight:600;
}

.section-number{
    width:38px;
    height:38px;
    border-radius:50%;
    background:#ff7a45;
    color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:18px;
    font-weight:bold;
}

/*==========================
      FORM ROW
===========================*/

.form-row{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:22px;
    margin-bottom:20px;
}

.form-group{
    display:flex;
    flex-direction:column;
}

.form-group label{
    color:#ffffff;
    font-size:15px;
    margin-bottom:8px;
    font-weight:600;
}

.required{
    color:#ff5c5c;
}

.form-group input,
.form-group textarea{

    width:100%;
    padding:15px 16px;

    background:#2f3448;

    border:1px solid #41485d;

    border-radius:10px;

    color:#fff;

    font-size:15px;

    outline:none;

    transition:.3s;

}

.form-group textarea{

    height:110px;

    resize:none;

}

.form-group input::placeholder,
.form-group textarea::placeholder{

    color:#97a0b8;

}

.form-group input:focus,
.form-group textarea:focus{

    border-color:#ff7a45;

    box-shadow:0 0 10px rgba(255,122,69,.25);

}

/*==========================
     ADDRESS TYPE
===========================*/

.address-type{

    display:flex;

    gap:15px;

    margin-top:12px;

}

.address-option{

    background:#30364b;

    border:1px solid #454d66;

    border-radius:30px;

    padding:12px 22px;

    color:white;

    cursor:pointer;

    transition:.3s;

}

.address-option:hover{

    background:#ff7a45;

    border-color:#ff7a45;

}

/*==========================
      PAYMENT
===========================*/

.payment-option{

    background:#2f3448;

    border:1px solid #454d66;

    border-radius:12px;

    margin-bottom:16px;

    transition:.3s;

}

.payment-option:hover{

    border-color:#ff7a45;

}

.payment-option label{

    display:flex;

    align-items:center;

    gap:18px;

    padding:18px;

    cursor:pointer;

}

.payment-option input{

    display:none;

}

.payment-icon{

    font-size:32px;

}

.payment-details h4{

    color:#fff;

    margin-bottom:5px;

}

.payment-details p{

    color:#aeb5c6;

    font-size:14px;

}

/*==========================
      RESTAURANT
===========================*/

.restaurant-info{

    border-bottom:1px solid #3f4558;

    padding-bottom:18px;

    margin-bottom:20px;

}

.restaurant-info h3{

    color:#ff7a45;

}

.restaurant-info p{

    color:#b5bccd;

}

/*==========================
      CART ITEM
===========================*/

.cart-item{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:16px 0;

    border-bottom:1px solid #3a4154;

}

.item-left{

    display:flex;

    align-items:center;

    gap:12px;

}

.food-symbol{

    width:12px;

    height:12px;

    border-radius:50%;

    background:#3cd37b;

}

.item-info h4{

    color:#fff;

    margin-bottom:4px;

}

.item-price{

    color:#ff6969;

    font-weight:600;

}

.quantity-badge{

    display:inline-block;

    background:#ff7a4520;

    color:#ff9d78;

    padding:4px 10px;

    border-radius:15px;

    font-size:12px;

}

/*==========================
      BILL DETAILS
===========================*/

.bill-details{

    margin-top:25px;

}

.bill-details h3{

    margin-bottom:18px;

}

.bill-row{

    display:flex;

    justify-content:space-between;

    padding:9px 0;

    color:#d0d5e1;

}

.bill-row:last-child{

    margin-top:18px;

    padding-top:18px;

    border-top:1px solid #444b5e;

    font-size:24px;

    color:#ff6b55;

    font-weight:bold;

}

/*==========================
      DELIVERY BOX
===========================*/

.delivery-box{

    background:#31384d;

    border-radius:12px;

    padding:16px;

    display:flex;

    gap:15px;

    align-items:center;

    margin:28px 0;

}

.delivery-icon{

    width:45px;

    height:45px;

    border-radius:50%;

    background:#ff7a4525;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:22px;

}

.delivery-details h4{

    color:#fff;

    margin-bottom:5px;

}

.delivery-details p{

    color:#aeb5c6;

}

/*==========================
      BUTTONS
===========================*/

.place-order-btn{

    width:100%;

    padding:18px;

    border:none;

    border-radius:40px;

    background:#ff8a5b;

    color:#fff;

    font-size:18px;

    font-weight:600;

    cursor:pointer;

    transition:.3s;

}

.place-order-btn:hover{

    background:#ff6b35;

}

.back-cart-btn{

    display:block;

    margin-top:15px;

    text-align:center;

    text-decoration:none;

    background:#3a4156;

    color:#fff;

    padding:15px;

    border-radius:40px;

}

.back-cart-btn:hover{

    background:#50576b;

}

.secure-message{

    text-align:center;

    margin-top:18px;

    color:#9da6bb;

}

/*==========================
      MOBILE
===========================*/

@media(max-width:992px){

.checkout-layout{

    grid-template-columns:1fr;

}

.form-row{

    grid-template-columns:1fr;

}

.right-section{

    position:static;

}

.address-type{

    flex-wrap:wrap;

}

}
     
  </style>

</head>
<body>
  
   <!-- -HEADER -->
	<jsp:include page="header.jsp" />

	<div class="checkout-container">

		<div class="checkout-heading">
			<h1>Secure Checkout</h1>
			<p>Enter the delivery information and select a payment method</p>
		</div>

		<form action="checkoutServlet" method="post">

			<div class="checkout-layout">

				<!-- ================= LEFT SIDE ================= -->

				<div class="left-section">

					<div class="checkout-card">
						<h2 class="section-title">
							<span class="section-number">1</span> Delivery Information
						</h2>

						<!-- Row 1 -->

						<div class="form-row">

							<div class="form-group">
								<label for="fullName"> Full Name <span class="required">*</span>
								</label> <input type="text" id="fullName" name="fullName"
									placeholder="Enter your full name" required>
							</div>

							<div class="form-group">
								<label for="phone"> Phone Number <span class="required">*</span>
								</label> <input type="tel" id="phone" name="phone"
									placeholder="Enter 10 digit number" pattern="[0-9]{10}"
									maxlength="10" required>
							</div>

						</div>

						<!-- Row 2 -->

						<div class="form-row">

							<div class="form-group">
								<label for="email"> Email <span class="required">*</span>
								</label> <input type="email" id="email" name="email"
									placeholder="Enter your email" required>

							</div>

							<div class="form-group">
								<label for="address"> Complete Address <span
									class="required">*</span>
								</label>

								<textarea id="address" name="address"
									placeholder="Enter your address" required></textarea>

							</div>

						</div>

						<!-- Row 3 -->

						<div class="form-row">

							<div class="form-group">
								<label for="city"> City <span class="required">*</span>
								</label> <input type="text" id="city" name="city"
									placeholder="Enter city" required>

							</div>

							<div class="form-group">
								<label for="pincode"> Pincode <span class="required">*</span>
								</label> <input type="text" id="pincode" name="pincode"
									placeholder="Enter 6 digit pincode" pattern="[0-9]{6}"
									maxlength="6" required>

							</div>

						</div>

						<!-- Address Type -->

						<div class="form-group">

							<label>Save Address As</label>
							<div class="address-type">

								<div class="address-option">
									<input type="radio" id="home" name="addressType" value="Home"
										checked> <label for="home">🏠 Home</label>
								</div>

								<div class="address-option">
									<input type="radio" id="work" name="addressType" value="Work">
									<label for="work">💼 Work</label>

								</div>

								<div class="address-option">
									<input type="radio" id="other" name="addressType" value="Other">
									<label for="other">📦 Other</label>

								</div>
							</div>
						</div>

						<!-- PAYMENT STARTS HERE -->
						<!-- ================= PAYMENT METHOD ================= -->

						<div class="payment-section">

							<h2 class="section-title">
								<span class="section-number">2</span> Payment Method
							</h2>

							<div class="payment-methods">
								<div class="payment-option">
									<input type="radio" id="upi" name="paymentMode" value="UPI"
										checked> <label for="upi"> <span
										class="payment-icon">🆙</span> <span class="payment-details">
											<h4>UPI Payment</h4>
											<p>Google Pay, PhonePe, Paytm & other UPI Apps</p>
									</span>
									</label>
								</div>

								<div class="payment-option">

									<input type="radio" id="card" name="paymentMode" value="Card">
									<label for="card"> <span class="payment-icon">💳</span>
										<span class="payment-details">
											<h4>Card Payment</h4>
											<p>Credit Card / Debit Card</p>
									   </span>
									</label>

								</div>

								<div class="payment-option">

									<input type="radio" id="cod" name="paymentMode"
										value="Cash on Delivery"> 
									  <label for="cod"> 
										<span class="payment-icon">💵</span> 
										<span class="payment-details">
											<h4>Cash on Delivery</h4>
											<p>Pay when your order arrives</p>
									   </span>
									</label>

								</div>

								<div class="payment-option">

									<input type="radio" id="netBanking" name="paymentMode"
										value="Net Banking"> 
										<label for="netBanking">
										   <span class="payment-icon">🏦</span> 
										   <span class="payment-details">
											  <h4>Net Banking</h4>
											  <p>Pay directly using your bank account</p>
									      </span>
									   </label>

								</div>
							</div>
						</div>
					</div>
					<!-- checkout-card -->

				</div>
				<!-- left-section -->


				<!-- ================= RIGHT SIDE ================= -->

				<div class="right-section">

					<div class="checkout-card order-card">

						<h2 class="section-title">
							<span class="section-number">3</span> Order Summary
						</h2>

						<%
						Cart cart = (Cart)session.getAttribute("cart");

						double itemTotal = 0;
						double dc = 10;
						double pf = 5;
						double gst = 15;

						if(cart != null && !cart.getItems().isEmpty()){

						    for(CartItem item : cart.getItems().values()){

						        itemTotal += item.getTotalPrice();

                  }

               }

                   double grandTotal = itemTotal + dc + pf + gst;
                   session.setAttribute("grandTotal", grandTotal);
                 %>
			<%

			  if(cart != null && !cart.getItems().isEmpty()){

				  
				MenuDAOImpl dao = new MenuDAOImpl();

				for(CartItem item : cart.getItems().values()){

				Menu menu = dao.getMenu(item.getMenu_id());

           %>

						<div class="cart-item">

							<div class="item-left">
								<span class="food-symbol"></span>

								<div class="item-info">
									<h4><%=menu.getFood_name()%></h4>
									<span class="quantity-badge"> Qty : <%=item.getQuantity()%> </span>
								</div>
							</div>

							<div class="item-price">₹<%=item.getTotalPrice()%></div>
						</div>
						<%
						}
				      }
                         %>

						<div class="bill-details">
							<h3>Bill Details</h3>

							<div class="bill-row">
								<span>Item Total</span> <span>₹ <%=itemTotal%></span>
							</div>

							<div class="bill-row">
								<span>Delivery Charge</span> <span>₹ <%= 10 + dc%></span>
							</div>

							<div class="bill-row">
								<span>Platform Fee</span> <span>₹ <%= 5 + pf%></span>
							</div>

							<div class="bill-row">
								<span>GST & Restaurant Charges</span> <span>₹ <%=15 + gst%></span>
							</div>

							<div class="bill-row">
								<span>Grand Total</span> <span>₹ <%=grandTotal%></span>
							</div>

						</div>

						<div class="delivery-box">
							<div class="delivery-icon">🚚</div>
							<div class="delivery-details">
								<h4>Estimated Delivery Time</h4>
								<p>30 - 40 Minutes</p>
							</div>
						</div>

						<button type="submit" class="place-order-btn"> PLACE ORDER • ₹<%=grandTotal%></button>

						<a href="Cart.jsp" class="back-cart-btn"> Back to Cart </a>

						<p class="secure-message">🔒 Your payment and personal
							information are securely protected.</p>
					</div>
					<!-- order-card -->

				</div>
				<!-- right-section -->

			</div>
			<!-- checkout-layout -->

		</form>

	</div>
	<!-- checkout-container -->

</body>

</html>