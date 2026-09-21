<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.Foodiee.model.Order"%>

<%
Order order = (Order) request.getAttribute("order");

if (order == null) {
	response.sendRedirect("OrderServlet");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
   
   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

:root{

    /* Colors */
    --bg:#0F172A;
    --card:#1E293B;
    --card-hover:#273549;

    --primary:#F97316;
    --primary-hover:#EA580C;

    --secondary:#2563EB;
    --secondary-hover:#1D4ED8;

    --success:#22C55E;
    --warning:#F59E0B;
    --danger:#EF4444;

    --text:#F8FAFC;
    --text-light:#CBD5E1;
    --text-muted:#94A3B8;

    --border:#334155;

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

/*================ CONTAINER ================*/

.container{

    width:90%;
    max-width:850px;
    margin:50px auto;

}

/*================ HEADER ================*/

.header{

    background:linear-gradient(135deg,#F97316,#FB923C);
    color:white;
    padding:35px;
    border-radius:18px;
    text-align:center;
    box-shadow:0 15px 35px rgba(249,115,22,.25);
    margin-bottom:30px;

}

.header h1{

    font-size:34px;
    font-weight:700;
    letter-spacing:.5px;

}

/*================ CARD ================*/

.card{

    background:var(--card);
    border:1px solid var(--border);
    border-radius:18px;
    padding:30px;
    box-shadow:var(--shadow);
    transition:.3s;

}

.card:hover{

    background:var(--card-hover);

}

/*================ ROWS ================*/

.row{

    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 0;
    border-bottom:1px solid var(--border);

}

.row:last-child{

    border:none;

}

.label{

    color:var(--text-muted);
    font-weight:600;
    font-size:16px;

}

.value{

    color:var(--text);
    font-size:17px;
    font-weight:600;

}

/*================ STATUS ================*/

.pending{

    color:var(--warning);
    font-weight:700;

}

.delivered{

    color:var(--success);
    font-weight:700;

}

.cancelled{

    color:var(--danger);
    font-weight:700;

}

/*================ TOTAL ================*/

.total{

    color:var(--primary);
    font-size:28px;
    font-weight:700;

}

/*================ BUTTONS ================*/

.buttons{

    display:flex;
    justify-content:center;
    gap:18px;
    margin-top:35px;

}

.btn{

    text-decoration:none;
    color:white;
    padding:14px 30px;
    border-radius:10px;
    font-weight:600;
    transition:.3s;
    box-shadow:0 8px 20px rgba(0,0,0,.2);

}

/* Back Button */

.back{

    background:linear-gradient(135deg,#2563EB,#3B82F6);

}

.back:hover{

    background:linear-gradient(135deg,#1D4ED8,#2563EB);
    transform:translateY(-3px);

}

/* Home Button */

.home{

    background:linear-gradient(135deg,#F97316,#FB923C);

}

.home:hover{

    background:linear-gradient(135deg,#EA580C,#F97316);
    transform:translateY(-3px);

}

/*================ RESPONSIVE ================*/

@media(max-width:768px){

    .container{

        width:95%;

    }

    .header{

        padding:25px;

    }

    .header h1{

        font-size:28px;

    }

    .row{

        flex-direction:column;
        align-items:flex-start;
        gap:8px;

    }

    .buttons{

        flex-direction:column;

    }

    .btn{

        width:100%;
        text-align:center;

    }

}
   
</style>

</head>

<body>
        
	<div class="container">

		<div class="header">
			<h1>Order Details</h1>
			<p>Your Order Summary</p>
		</div>

		<div class="card">

			<div class="row">
				<div class="label">Order ID</div>
				<div class="value">
					#<%=order.getOrder_id()%>
				</div>
			</div>

			<div class="row">
				<div class="label">Restaurant ID</div>
				<div class="value">
					<%=order.getRestaurant_id()%>
				</div>
			</div>

			<div class="row">
				<div class="label">Order Date</div>
				<div class="value">
					<%=order.getOrder_date()%>
				</div>
			</div>

			<div class="row">
				<div class="label">Payment Method</div>
				<div class="value">
					<%=order.getPaymentMethod()%>
				</div>
			</div>

			<div class="row">
				<div class="label">Order Status</div>

				<div
					class="value
<%=order.getStatus().equalsIgnoreCase("Pending") ? "pending"
		: order.getStatus().equalsIgnoreCase("Delivered") ? "delivered" : "cancelled"%>">

					<%=order.getStatus()%>

				</div>

			</div>

			<div class="row">
				<div class="label">Total Amount</div>
				<div class="total">
					₹
					<%=order.getTotalAmount()%>
				</div>
			</div>

		</div>

		<div class="buttons">

			<a href="OrderServlet" class="btn back"> ← My Orders </a> <a
				href="RestaurantServlet" class="btn home"> 🏠 Home </a>

		</div>

	</div>

</body>
</html>