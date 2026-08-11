<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.Foodiee.model.Menu"%>
<%@ page import="com.Foodiee.model.Restaurant"%>


<%
Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
List<Menu> allMenusByRestaurant =
        (List<Menu>) request.getAttribute("allMenusByRestaurant");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #0f1014;
	color: #333;
}

/* ================= HEADER ================= */
header {
	background: linear-gradient(135deg, #ff6b35, #ff914d);
	color: white;
	padding: 20px 10%;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .15);
}

.res-info h1 {
	font-size: 42px;
	margin-bottom: 10px;
}

.res-info p {
	margin: 8px 0;
	font-size: 16px;
}

.details {
	display: flex;
	gap: 20px;
	margin: 18px 0;
	flex-wrap: wrap;
}

.details span {
	/* background: rgba(255,255,255, 2); */
	padding: 8px 18px;
	border-radius: 30px;
}

.status {
	background: #16a34a !important;
}

.cuisine {
	font-size: 17px;
	opacity: .95;
}



/* ================= MENU ================= */
.menu {
	width: 90%;
	margin: 50px auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(340px, 1fr));
	gap: 35px;
}

/* ================= CARD ================= */
.card {
	background: #1b1c22;
	color:white;
	border-radius: 18px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .08);
	transition: .4s;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 18px 35px rgba(0, 0, 0, .18);
}

.card img {
	width: 100%;
	height: 240px;
	object-fit: cover;
}

.content {
	padding: 22px;
}

.badge {
	display: inline-block;
	background: #16a34a;
	color: white;
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 15px;
}

.content h2 {
	margin-bottom: 10px;
}

.rating {
	color: #ff9800;
	font-weight: 600;
	margin-bottom: 12px;
}

.description {
	color: #666;
	line-height: 1.6;
}

/* ================= FOOD INFO ================= */
.food-info {
	display: flex;
	justify-content: space-between;
	margin: 18px 0;
	font-size: 14px;
	color:white;
}

/* ================= PRICE ================= */
.price {
	display: flex;
	align-items: center;
	gap: 15px;
	margin: 20px 0;
}

.new-price {
	color: #ff5722;
	font-size: 28px;
	font-weight: bold;
}

.old-price {
	color: #999;
	text-decoration: line-through;
}

.offer {
	background: #ffebee;
	color: red;
	padding: 5px 10px;
	border-radius: 15px;
	font-size: 14px;
}

/* ================= FORM  =============*/

/* Add to Cart Form */
.cart-form{
    width:100%;
    margin-top:20px;
}

/* Add to Cart Button */
.cart-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:10px;
    background:#ff6b35;
    color:#fff;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.cart-btn:hover{
    background:#e65a27;
    transform:translateY(-2px);
    box-shadow:0 6px 15px rgba(255,107,53,0.4);
}

.cart-btn:active{
    transform:scale(0.98);
}
/* ================= FOOTER ================= */
footer {
	background: #1f2937;
	color: white;
	text-align: center;
	padding: 35px;
	margin-top: 50px;
}

footer h2 {
	margin-bottom: 12px;
}

footer p {
	margin: 8px 0;
	color: #d1d5db;
}

/* ================= RESPONSIVE ================= */
@media ( max-width :768px) {
	.res-info h1 {
		font-size: 30px;
	}
	input[type="search"] {
		width: 100%;
	}
	.food-info {
		flex-direction: column;
		gap: 8px;
	}
	.buttons {
		flex-direction: column;
	}
	.details {
		gap: 10px;
	}
}
</style>
</head>
<body>


	
	
	<!-- Header -->
	 
	<header>
		<div class="res-info">
			<h1>🍽 <%= restaurant.getRestaurant_name() %></h1>
			<p>⭐⭐⭐⭐⭐ <%= restaurant.getRating() %></p>

			<div class="details">
				<span>⏱ 30 mins</span> <span>🚚 Free Delivery</span> <span>📍
					Bangalore</span> <span class="status">🟢 Open</span>
			</div>
			<p class="cuisine"> <%= restaurant.getCuisine_type() %></p>
		</div>
	</header>

	<!-- Menu Items -->
	<section class="menu">

		<%
		for (Menu menu : allMenusByRestaurant) {
			
		%>

		<!-- Card 1 -->
		<div class="card">
			<img src="<%= menu.getImagePath() %>" alt="<%= menu.getCategory() %>">

			<div class="content">
				<span class="badge">BEST SELLER</span>
				<h2> <%= menu.getFood_name() %></h2>
				<p class="rating">⭐⭐⭐⭐⭐ <%= menu.getRating() %></p>
				<p class="description"> <%= menu.getDescription() %></p>

				<div class="food-info">
					<span>🍗 <%= menu.getFood_type() %></span> 
					<span>🔥 <%= menu.getCalories() %> Cal</span> 
					<span>⏱ <%= menu.getPreparation_time() %>	mins</span>
				</div>

				<div class="price">
					<span class="new-price">₹ <%= menu.getPrice() %>
					</span> <span class="old-price">₹349</span>
					<span class="offer">15% OFF</span>
				</div>
				
				 <form action="cartServlet" method ="post">
				 
				 <input type=hidden name = menu_id  value = <%= menu.getMenu_id() %>>
				 <input type=hidden name = restaurant_id  value = <%= menu.getRestaurant_id() %>>
				 <input type = hidden name =quantity value =1>
				 <input type = hidden name =action value =add>
			     <input type="submit" value="🛒 Add to Cart" class="cart-btn">
				 
				 </form> 
					
			</div>
		</div>


		<%
		}
		%>

	</section>


	<!-- Footer -->
	<footer>
		<h2><%= restaurant.getRestaurant_name() %></h2>
		<p>📍 <%= restaurant.getCity() %> | 📞  <%= restaurant.getPhone() %> | 📧 <%= restaurant.getEmail() %></p>
		<p>&copy; 2026 <%= restaurant.getRestaurant_name() %>. All Rights Reserved.</p>
	</footer>


</body>
</html>