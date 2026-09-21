<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#0f1014;
}

/*================ HEADER =================*/

.header{
    width:100%;
    height:75px;
    background:#1b1c22;
    box-shadow:0 4px 15px rgba(0,0,0,0.3);
    position:sticky;
    top:0;
    z-index:1000;
}

/*================ CONTENT =================*/

.header-content{
    width:90%;
    height:100%;
    margin:auto;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/*================ LOGO =================*/

.logo{
    font-size:30px;
    font-weight:700;
    color:#ffffff;
    cursor:pointer;
    letter-spacing:1px;
}

.logo::first-letter{
    color:#ff6b35;
}

/*================ NAVIGATION =================*/

nav{
    display:flex;
    gap:35px;
}

nav a{
    text-decoration:none;
    color:#ffffff;
    font-size:16px;
    font-weight:500;
    position:relative;
    transition:.3s;
}

/* Hover */

nav a:hover{
    color:#ff6b35;
}

/* Underline Animation */

nav a::after{
    content:"";
    position:absolute;
    left:0;
    bottom:-6px;
    width:0%;
    height:2px;
    background:#ff6b35;
    transition:.3s;
}

nav a:hover::after{
    width:100%;
}

/*================ RESPONSIVE =================*/

@media(max-width:768px){

.header{
    height:auto;
    padding:15px 0;
}

.header-content{
    flex-direction:column;
    gap:15px;
}

nav{
    flex-wrap:wrap;
    justify-content:center;
    gap:20px;
}

.logo{
    font-size:26px;
}

}


</style>
</head>
<body>
     <header class="header">
		<div class="header-content">
			<div class="logo">Food Delivery</div>

			<nav>
				<a href="RestaurantServlet">Home</a> 
				<a href="signin.jsp">Login</a>
				<a href="Cart.jsp">Cart</a> 
				<a href="SignUp.jsp">Sign up</a> 
				<a href="profile.jsp">Profile</a>
			</nav>
		</div>
	</header>

</body>
</html>