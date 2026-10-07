<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.Foodiee.model.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #0f1014;
	font-family: Arial, Helvetica, sans-serif;
	color: white;
}

.logo {
	font-size: 48px;
	font-weight: bold;
	background: linear-gradient(90deg, #ff7a00, #ff3d71, #00e5ff, #00e676, #ffd740);
	-webkit-background-clip: text;
	background-clip: text;
	color: transparent;
}

/* header */
header {
	background: #121216;
	width: 100%;
	padding: 20px 50px;
	border-bottom: 1px solid #2d2d35;
}

.header-content {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: medium;
}

nav a {
	color: rgb(255, 254, 254);
	text-decoration: none;
	margin-left: 20px;
	font-size: 16px;
}

nav a:hover {
	color: rgb(255, 0, 0);
}

button {
	color: rgb(255, 252, 252);
	background: rgba(190, 98, 6, 0.993);
	border-radius: 4px;
	border: chocolate;
	font-size: medium;
}

button:hover {
	color: rgb(255, 0, 0);
}

/* Search */
.search-section {
	padding: 40px 0;
	display: flex;
	justify-content: center;
	background: #0f1014;
}

.search-container {
	width: 100%;
	display: flex;
	justify-content: center;
}

.search-bar {
	width: 700px;
}

.search-bar input {
	width: 100%;
	padding: 16px 20px;
	border: none;
	outline: none;
	border-radius: 50px;
	background: #1b1c22;
	color: white;
	font-size: 17px;
	border: 2px solid #2f313b;
	transition: 0.3s;
}

.search-bar input::placeholder {
	color: #9fa6b2;
}

.search-bar input:focus {
	border-color: #ff7a00;
	box-shadow: 0 0 10px rgba(255, 122, 0, 0.5);
}

/* article */
/* Restaurants Grid */
.restaurants-grid {
	width: 95%;
	margin: 40px auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

/* Card */
.restaurant-card {
	background: #1b1c22;
	border: 1px solid #2f313b;
	border-radius: 18px;
	border-color: aqua;
	overflow: hidden;
	transition: 0.3s;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .3);
}

.restaurant-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px aqua;
	border-color: aqua;
}

/* Image */
.card-img-wrapper {
	position: relative;
	height: 180px;
}

.card-img-wrapper img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* Delivery Badge */
.badge-eta {
	position: absolute;
	right: 10px;
	bottom: 10px;
	background: #2b2b35;
	color: #fff;
	padding: 8px 14px;
	border-radius: 25px;
	font-size: 14px;
	font-weight: bold;
}

/* Card Body */
.card-body {
	padding: 15px;
}

/* Name and Rating */
.card-header-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
}

.restaurant-name {
	font-size: 24px;
	font-weight: bold;
	color: #fff;
}

.rating-badge {
	background: #5c4512;
	color: #ffd54a;
	padding: 6px 12px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
}

/* Cuisine */
.cuisine-list {
	margin-bottom: 12px;
}

.cuisine-pill {
	display: inline-block;
	background: #2b2d36;
	color: #ddd;
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 13px;
}

/* Description */
.restaurant-desc {
	color: #b3b8c4;
	font-size: 14px;
	line-height: 1.6;
	margin: 15px 0;
}

/* Address */
.address-box {
	border-top: 1px solid #30323b;
	padding-top: 15px;
	color: #9fa6b2;
	font-size: 14px;
}

.logo {
	font-size: 48px;
	font-weight: bold;
}

.logo span:first-child {
	color: #ff7a00;
}

.logo span:last-child {
	color: white;
}

.view-menu-btn {
	display: block;
	width: 100%;
	margin-top: 18px;
	padding: 12px 20px;
	background: #ff7a00;
	color: #ffffff;
	text-align: center;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
	border: 1px solid #ff7a00;
	border-radius: 8px;
	transition: 0.3s ease;
}

.view-menu-btn:hover {
	background: #ff8c1a;
	border-color: #ff8c1a;
	box-shadow: 0 5px 15px rgba(255, 122, 0, 0.3);
	transform: translateY(-2px);
}

.footer {
	display: flex;
	justify-content: space-around;
	align-items: flex-start;
	background: #1b1c22;
	padding: 40px 60px;
	margin-top: 50px;
	border-top: 1px solid #2f313b;
}

.footer-column h3 {
	color: #fff;
	margin-bottom: 15px;
	font-size: 24px;
}

.footer-column ul {
	list-style: none;
}

.footer-column ul li {
	margin-bottom: 12px;
}

.footer-column ul li a {
	text-decoration: none;
	color: #cfcfcf;
	transition: 0.3s;
}

.footer-column ul li a:hover {
	color: #ff7a00;
}
</style>



</head>
<body>



	<!-- header -->

	<header class="header">
		<div class="header-content">
			<div class="logo">Food Delivery</div>

			<nav>

				<a href="menu.jsp">Menu</a> <a href="Cart.jsp">Cart</a> <a
					href="signin.jsp">Sign in</a> <a href="profile.jsp">Profile</a>
			</nav>
		</div>
	</header>

	<!-- Search Content -->

	<section class="search-section">

		<div class="search-container">
			<form action="${pageContext.request.contextPath}/RestaurantServlet" method="get">
				<div class="search-bar">
					<input type="text" id="restaurantSearch" name="search"
						value="${param.search}"
						placeholder="search for restaurants and foods">
				</div>
			</form>
		</div>
		
	</section>
	
	<!-- Restaurants Grid -->

	<section class="restaurants-grid">

		<%
        List<Restaurant> restaurants =
            (List<Restaurant>) request.getAttribute("allRestaurants");

        if (restaurants != null && !restaurants.isEmpty()) {

            for (Restaurant restaurant : restaurants) {
    %>

		<article class="restaurant-card">

			<div class="card-img-wrapper">

				<img src="<%= restaurant.getImage_path() %>"
					alt="<%= restaurant.getRestaurant_name() %>" height="500"
					width="240">

				<div class="badge-eta">
					🚀
					<%= restaurant.getOpening_time() %>

					<%= restaurant.getClosing_time() %>
				</div>

			</div>

			<div class="card-body">

				<div class="card-header-row">

					<h2 class="restaurant-name">
						<%= restaurant.getRestaurant_name() %>
					</h2>

					<div class="rating-badge">
						<span>⭐<%= restaurant.getRating() %></span>
					</div>

				</div>

				<div class="cuisine-list">
					<span class="cuisine-pill"> <%= restaurant.getCuisine_type() %>
					</span>
				</div>

				<p class="restaurant-desc">Delicious food prepared fresh and
					delivered to your doorstep..</p>

				<div class="address-box">
					<span>📍<%= restaurant.getAddress() %></span> <span><%= restaurant.getCity() %></span>
				</div>

				<a class="view-menu-btn"
					href="<%= request.getContextPath() %>/menu?restaurantId=<%= restaurant.getRestaurant_id() %>">
					View Menu </a>

			</div>

		</article>

		<%
            }
        }
    %>

	</section>
	<footer class="footer">

		<div class="footer-column">
			<h3>Legal</h3>
			<ul>
				<li><a href="#">Terms & Conditions</a></li>
				<li><a href="#">Refund & Cancellation</a></li>
				<li><a href="#">Privacy Policy</a></li>
				<li><a href="#">Cookie Policy</a></li>
			</ul>
		</div>

		<div class="footer-column">
			<h3>Social Links</h3>
			<ul>
				<li><a href="#">Facebook</a></li>
				<li><a href="#">Instagram</a></li>
				<li><a href="#">YouTube</a></li>
				<li><a href="#">Twitter</a></li>
			</ul>
		</div>

	</footer>
</body>
</html>