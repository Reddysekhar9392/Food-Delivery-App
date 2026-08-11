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

/* Restaurants Grid */
.restaurants-grid {
	width: 95%;
	margin: 40px auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

/* Restaurant Card */
.restaurant-card {
	background: #1b1c22;
	border: 1px solid aqua;
	border-radius: 18px;
	overflow: hidden;
	transition: 0.3s ease;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.restaurant-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px aqua;
}

/* Image */
.card-img-wrapper {
	position: relative;
	height: 250px;
}

.card-img-wrapper img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* ETA Badge */
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

/* Header */
.card-header-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
}

.restaurant-name {
	font-size: 22px;
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

/* ===========================
   Search Section
=========================== */

.search-section{
    width:100%;
    display:flex;
    justify-content:center;
    align-items:center;
    margin:35px 0;
}

.search-bar{
    width:650px;
    max-width:90%;
    height:60px;

    display:flex;
    align-items:center;

    background:#1b1c22;
    border:2px solid #343640;
    border-radius:50px;

    overflow:hidden;

    margin:0 auto;

    box-shadow:0 8px 20px rgba(0,0,0,0.35);

    transition:all .35s ease;
}

/* Hover Effect */

.search-bar:hover{
    border-color:#ff7a00;
    box-shadow:0 0 20px rgba(255,122,0,.45);
    transform:translateY(-2px);
}

/* Focus Effect */

.search-bar:focus-within{
    border-color:#ff7a00;
    box-shadow:0 0 25px rgba(255,122,0,.55);
}

.search-bar input{
    flex:1;
    height:100%;
    border:none;
    outline:none;

    background:transparent;

    padding:0 25px;

    color:#fff;

    font-size:18px;

    letter-spacing:.4px;
}

/* Placeholder */

.search-bar input::placeholder{
    color:#9aa0a6;
    font-size:17px;
}

.search-bar button{

    width:70px;
    height:100%;

    border:none;

    cursor:pointer;

    background:linear-gradient(135deg,#ff7a00,#ff4d00);

    color:#fff;

    font-size:24px;

    transition:.3s;
}

/* Hover */

.search-bar button:hover{

    background:linear-gradient(135deg,#ff9500,#ff6a00);

}

/* Click */

.search-bar button:active{

    transform:scale(.95);

}


@media(max-width:768px){

.search-bar{

    width:95%;
    height:55px;

}

.search-bar input{

    font-size:16px;
    padding:0 18px;

}

.search-bar button{

    width:60px;
    font-size:20px;

}

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

.btn-container {
	margin-top: 18px;
	text-align: center;
}

.view-btn {
	display: inline-block;
	width: 100%;
	padding: 12px 20px;
	background: linear-gradient(135deg, #ff7a00, #ff4d00);
	color: #fff;
	text-decoration: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: bold;
	transition: 0.3s ease;
	text-align: center;
	box-shadow: 0 4px 10px rgba(255, 122, 0, 0.3);
}

.view-btn:hover {
	background: linear-gradient(135deg, #ff9500, #ff6a00);
	transform: translateY(-2px);
	box-shadow: 0 8px 18px rgba(255, 122, 0, 0.5);
}

.view-btn:active {
	transform: scale(0.98);
}

/* logo */
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

/* footer */
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

	<jsp:include page="header.jsp" />

	<!-- Search Content -->

	<form action="searchRestaurant" method="get" class="search-bar">
		<input type="text" name="keyword" placeholder="Search for restaurants and foods">
		<button type="submit">🔍</button>
	</form>

	<!-- Restaurants Grid -->
	<section class="restaurants-grid">

		<%
            List<Restaurant> restaurants =  (List<Restaurant>)request.getAttribute("restaurants");

            for(Restaurant restaurant : restaurants){
        %>

		<article class="restaurant-card">

			<div class="card-img-wrapper">
				<img src="<%= restaurant.getImage_path() %>"
					alt="<%= restaurant.getRestaurant_name() %>">

				<div class="badge-eta">
					🚀
					<%= restaurant.getOpening_time() %>
					-
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
				<p class="restaurant-desc">Artisan crafted double wagyu beef
					burgers...</p>
				<div class="address-box">
					<span><%= restaurant.getAddress() %></span> <span> <%= restaurant.getCity() %>
					</span>
				</div>

				<div class="address-box">
					<span> Email: <%= restaurant.getEmail() %></span>
				</div>

				<div class="address-box">
					<span> Owner Name: <%= restaurant.getOwner_name() %></span>
				</div>

				<div class="btn-container">

					<a href="menu?restaurantId=<%=restaurant.getRestaurant_id()%>"
						class="view-btn">View Menu </a>
				</div>

			</div>

		</article>

		<%
             }
        %>

	</section>


	<footer class="footer">

		<div class="footer-column">
			<h3>Social Links</h3>
			<ul>
				<li><a href="https://www.facebook.com/" target="_blank">Facebook</a></li>
				<li><a href="https://www.instagram.com/" target="_blank">Instagram</a></li>
				<li><a href="https://www.youtube.com/" target="_blank">YouTube</a></li>
				<li><a href="https://twitter.com/" target="_blank">Twitter</a></li>
			</ul>
		</div>

	</footer>
</body>
</html>