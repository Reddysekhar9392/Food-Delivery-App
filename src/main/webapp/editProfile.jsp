<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Foodiee.model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("signin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #181c29;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.container {
	width: 650px;
	background: #272c3c;
	border-radius: 18px;
	padding: 35px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, .35);
}

.container h1 {
	text-align: center;
	color: #ff6b3d;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	color: #ffffff;
	margin-bottom: 8px;
	font-weight: 500;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 10px;
	background: #343a4d;
	color: #fff;
	font-size: 15px;
	outline: none;
}

.form-group input:focus, .form-group textarea:focus {
	border: 2px solid #ff6b3d;
}

.form-group textarea {
	resize: none;
	height: 90px;
}

.row {
	display: flex;
	gap: 20px;
}

.row .form-group {
	flex: 1;
}

.btn {
	width: 100%;
	padding: 15px;
	background: #ff6b3d;
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	cursor: pointer;
	font-weight: 600;
	margin-top: 15px;
}

.btn:hover {
	background: #ff5722;
}

.back {
	display: block;
	margin-top: 15px;
	text-align: center;
	color: #fff;
	text-decoration: none;
}
</style>

</head>

<body>

	<div class="container">

		<h1>Edit Profile</h1>

		<form action="UpdateProfileServlet" method="post">

			<input type="hidden" name="userId" value="<%=user.getUser_id()%>">

			<div class="form-group">
				<label>Full Name</label> <input type="text" name="full_name"
					value="<%=user.getFull_name()%>" required>
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email"
					value="<%=user.getEmail()%>" required>
			</div>

			<div class="row">

				<div class="form-group">
					<label>Phone</label> <input type="text" name="phone"
						value="<%=user.getPhone()%>">
				</div>

				<div class="form-group">
					<label>City</label> <input type="text" name="city"
						value="<%=user.getCity()%>">
				</div>

			</div>

			<div class="form-group">
				<label>Address</label>
				<textarea name="address"><%=user.getAddress()%></textarea>
			</div>

			<div class="row">

				<div class="form-group">
					<label>Pincode</label> <input type="text" name="pincode"
						value="<%=user.getPincode()%>">
				</div>

				<div class="form-group">
					<label>Role</label> <input type="text" name="role"
						value="<%=user.getRole()%>" readonly>
				</div>

			</div>

			<button class="btn" type="submit">Update Profile</button>

			<a href="profile.jsp" class="back"> ← Back to Profile </a>

		</form>

	</div>

</body>
</html>