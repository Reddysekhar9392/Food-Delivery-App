<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #0F172A;
	color: whitesmoke;
	font-family: Arial, Helvetica, sans-serif;
	font-size: medium;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

main {
	width: 420px;
	background: #1E293B;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 255, 255, .25);
}

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #fff;
}

label {
	display: block;
	margin-top: 12px;
}

input, select {
	width: 100%;
	padding: 14px;
	margin: 8px 0 18px;
	border: none;
	border-radius: 10px;
	background: #334155;
	font-size: 15px;
	transition: .3s;
}

input::placeholder {
	color: #94A3B8;
}

input:focus, select:focus {
	outline: none;
	border-color: #F97316;
	box-sizing: 0 0 8px rgba(249, 115, 22, .4);
}

input[type="submit"] {
	background-color: #F97316;
	color: white;
	font-size: 17px;
	font-weight: 600;
	border: none;
	cursor: pointer;
	transition: .3s;
}

input[type="submit"] :hover {
	background: #EA580C;
	transform: translateY(-2px);
}

p {
	margin-top: 20px;
	text-align: center;
	color: #CBD5E1;
}

a {
	color: #F97316;
	text-decoration: none;
	font-weight: 600;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>


	<main>
		<h2>Create Account</h2>

		<form action="SignupServlet" method="post">

			FullName <br> <input type="text" name="full_name"
				placeholder="enter your full name" required> <br> Email
			<br> <input type="email" name="email"
				placeholder="awer@gmail.com" required> <br> Password<br>
			<input type="password" name="password" Placeholder="Refg@31" required><br>

			PhoneNumber <br> <input type="text" name="phone"
				placeholder="9842345692" required> <br> Address <br>
			<input type="text" name="address" required> <br> City <br>
			<input type="text" name="city" placeholder="bangolre" required>
			<br> Pincode <br> <input type="text" name="pincode"
				placeholder="543234" required> <br> <label for="role">Role</label>

			<select name="role" id="role" required>

				<option value="">-- Select Role --</option>
				<option value="CUSTOMER">Customer</option>
				<option value="RESTAURANT_ADMIN">Restaurant Admin</option>
				<option value="DELIVERY_AGENT">Delivery Agent</option>
				<option value="ADMIN">Admin</option>

			</select> <br> <input type="submit" value="SignUp">
		</form>

		<br>

		<p>
			Already have an account? <a href="signin.jsp">Sign In</a>
		</p>

	</main>

</body>
</html>