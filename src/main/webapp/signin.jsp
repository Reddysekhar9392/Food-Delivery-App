<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Login</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #0f172a, #1e293b, #111827);
	height: 100vh;
}

main {
	width: 380px;
	background: #1e293b;
	padding: 40px;
	border-radius: 18px;
	border: 1px solid #334155;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4);
}

h2 {
	text-align: center;
	color: #f8fafc;
	margin-bottom: 30px;
	font-size: 30px;
}

form {
	color: #cbd5e1;
	font-size: 15px;
	font-weight: 600;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 14px;
	margin: 8px 0 22px;
	background: #0f172a;
	color: #0fffff;
	border: 1px solid #475569;
	border-radius: 10px;
	outline: none;
	font-size: 15px;
	transition: .3s;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-color: #3b82f6;
	box-shadow: 0 0 10px rgba(59, 130, 246, .5);
}

                /* Button */
input[type="submit"] {
	width: 100%;
	padding: 14px;
	background: #2563eb;
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: .3s;
}

input[type="submit"]:hover {
	background: #1d4ed8;
	transform: translateY(-2px);
}
</style>


</head>
<body>

            <main>

            <h2>Login</h2>
            <form action="LoginServlet" method="post">

                Email <br>
                <input type="text" name ="email" placeholder="vre123@gmail.com" required> <br>
                password <br>
                <input type="text" name ="password" placeholder="Rasdf@1344" required> <br>
                
                <input type="submit" value="Login">
            </form>
        </main>
</body>
</html>