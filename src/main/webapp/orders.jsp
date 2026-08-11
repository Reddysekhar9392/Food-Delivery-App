<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.Foodiee.model.Order"%>

<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
 
     @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

:root{

    /* Background */
    --bg:#0F172A;
    --card:#1E293B;
    --card-hover:#273549;

    /* Primary */
    --primary:#F97316;
    --primary-hover:#EA580C;

    /* Secondary */
    --secondary:#2563EB;
    --secondary-hover:#1D4ED8;

    /* Status */
    --success:#22C55E;
    --warning:#F59E0B;
    --danger:#EF4444;

    /* Text */
    --white:#FFFFFF;
    --text:#F8FAFC;
    --text-light:#CBD5E1;
    --text-muted:#94A3B8;

    /* Border */
    --border:#334155;

    /* Shadow */
    --shadow:0 12px 30px rgba(0,0,0,.25);
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:var(--bg);
    color:var(--text);
}

/*================ HEADER ================*/

.header{

    background:linear-gradient(135deg,#F97316,#FB923C);
    color:white;
    padding:24px;
    text-align:center;
    font-size:32px;
    font-weight:700;
    letter-spacing:.5px;
    box-shadow:0 10px 25px rgba(249,115,22,.25);

}

/*================ CONTAINER ================*/

.container{

    width:90%;
    max-width:1100px;
    margin:40px auto;

}

/*================ ORDER CARD ================*/

.order-card{

    background:var(--card);
    border:1px solid var(--border);
    border-radius:18px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:var(--shadow);
    transition:.35s;

}

.order-card:hover{

    background:var(--card-hover);
    transform:translateY(-6px);
    box-shadow:0 18px 40px rgba(249,115,22,.15);

}

/*================ TOP SECTION ================*/

.top{

    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;

}

.order-id{

    font-size:24px;
    font-weight:700;
    color:var(--white);

}

/*================ STATUS ================*/

.status{

    padding:8px 18px;
    border-radius:50px;
    color:white;
    font-size:14px;
    font-weight:600;
    letter-spacing:.5px;

}

.Pending{

    background:linear-gradient(135deg,#F59E0B,#FBBF24);

}

.Delivered{

    background:linear-gradient(135deg,#22C55E,#16A34A);

}

.Cancelled{

    background:linear-gradient(135deg,#EF4444,#DC2626);

}

/*================ INFO ================*/

.info{

    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
    margin-top:20px;

}

.box{

    background:#162133;
    border:1px solid var(--border);
    border-left:6px solid var(--primary);
    border-radius:14px;
    padding:18px;
    transition:.3s;

}

.box:hover{

    background:#22324a;

}

.label{

    color:var(--text-muted);
    font-size:14px;
    margin-bottom:8px;

}

.value{

    color:var(--white);
    font-size:18px;
    font-weight:600;

}

/*================ BUTTONS ================*/

.buttons{

    display:flex;
    gap:15px;
    margin-top:30px;

}

.btn{

    text-decoration:none;
    padding:13px 25px;
    border-radius:10px;
    font-size:15px;
    font-weight:600;
    color:white;
    transition:.3s;
}

/* Details */

.details{

    background:linear-gradient(135deg,#2563EB,#3B82F6);

}

.details:hover{

    background:linear-gradient(135deg,#1D4ED8,#2563EB);
    transform:translateY(-2px);

}

/* Reorder */

.reorder{

    background:linear-gradient(135deg,#F97316,#FB923C);

}

.reorder:hover{

    background:linear-gradient(135deg,#EA580C,#F97316);
    transform:translateY(-2px);

}

/*================ HOME BUTTON ================*/

.home{

    display:block;
    margin-top:35px;
    text-align:center;
    text-decoration:none;
    padding:15px;
    border-radius:12px;
    background:#1E293B;
    color:white;
    font-weight:600;
    border:1px solid var(--border);
    transition:.3s;

}

.home:hover{

    background:#273549;
    transform:translateY(-2px);

}

/*================ EMPTY PAGE ================*/

.empty{
    background:var(--card);
    border:1px solid var(--border);
    border-radius:18px;
    padding:70px;
    text-align:center;
    box-shadow:var(--shadow);
}
.empty h2{
    color:var(--primary);
    margin:20px 0;
}
.empty p{
    color:var(--text-light);
}
.empty a{
    display:inline-block;
    margin-top:25px;
    text-decoration:none;
    padding:15px 35px;
    border-radius:10px;
    color:white;
    font-weight:600;
    background:linear-gradient(135deg,#F97316,#FB923C);
    transition:.3s;
}
.empty a:hover{
    background:linear-gradient(135deg,#EA580C,#F97316);
    transform:translateY(-2px);
}

/*================ RESPONSIVE ================*/

@media(max-width:768px){

    .info{
        grid-template-columns:1fr;
    }
    .top{
        flex-direction:column;
        align-items:flex-start;
        gap:15px;
    }
    .buttons{
        flex-direction:column;
    }
    .btn{
        text-align:center;
    }

}
    
</style>

</head>

<body>

    <!-- header -->

	<jsp:include page="header.jsp"/>

	<div class="header">📦 My Orders</div>

	<div class="container">

		<%
		if (orders == null || orders.isEmpty()) {
		%>

		<div class="empty">

			<h1>🍔</h1>

			<h2>No Orders Found</h2>

			<p>You haven't placed any orders yet.</p>

			<a href="RestaurantServlet"> Order Food </a>

		</div>

		<%
		} else {

		for (Order order : orders) {
		%>

		<div class="order-card">

			<div class="top">
				<div class="order-id"> Order #<%=order.getOrder_id()%> </div>
				<div class="status <%=order.getStatus()%>"> <%=order.getStatus()%> </div>
			</div>

			<div class="info">

				<div class="box">
					<div class="label">Restaurant ID</div>
					<div class="value"> #<%=order.getRestaurant_id()%> </div>
				</div>

				<div class="box">
					<div class="label">Payment Method</div>
					<div class="value"> <%=order.getPaymentMethod()%> </div>
				</div>

				<div class="box">
					<div class="label">Order Date</div>
					<div class="value"> <%=order.getOrder_date()%> </div>
				</div>

				<div class="box">
					<div class="label">Total Amount</div>
					<div class="value"> ₹ <%=order.getTotalAmount()%> </div>
				</div>
			</div>

			<div class="buttons">

				<a href="OrderDetailsServlet?orderId= <%=order.getOrder_id()%>" class="btn details"> View Details </a> 
					<a href="RestaurantServlet" class="btn reorder"> Reorder </a>
			</div>

		</div>

		<%
            }
            }
        %>

		<a href="RestaurantServlet" class="home"> ← Back to Home </a>

	</div>

</body>
</html>