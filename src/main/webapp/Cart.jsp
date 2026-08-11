<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.Foodiee.model.Cart" %>
<%@ page import="com.Foodiee.model.CartItem" %>
<%@ page import="com.Foodiee.DAOImpl.MenuDAOImpl"%>
<%@ page import="com.Foodiee.model.Menu"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#0f1014;
    color:#fff;
}

/* ================= HEADER ================= */

.cart-header{
    width:100%;
    background:linear-gradient(135deg,#ff6b35,#ff914d);
    padding:25px 8%;
    color:#fff;
    box-shadow:0 8px 20px rgba(0,0,0,.3);
}

.cart-header h1{
    font-size:36px;
    margin-bottom:8px;
}

.cart-header p{
    font-size:16px;
}

/* ================= MAIN CONTAINER ================= */

.cart-box{
    width:90%;
    margin:40px auto;
}

/* ================= COLUMN HEADER ================= */
.cart-box .cart-header {
    display: grid;
    grid-template-columns: 150px 300px 120px 120px 180px 140px;
    align-items: center;
    text-align: center;
    background: #1b1c22;
    border-radius: 12px;
    padding: 18px 25px;
    font-weight: 600;
    margin-bottom: 20px;
}

.cart-card {
    display: grid;
    grid-template-columns: 150px 300px 120px 120px 180px 140px;
    align-items: center;
    gap: 25px;
    background: #1b1c22;
    padding: 20px 25px;
    border-radius: 12px;
    margin-bottom: 18px;
}


.cart-card:hover{
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(255,107,53,.25);
}

/* ================= IMAGE ================= */

.cart-card img{
    width:130px;
    height:110px;
    border-radius:12px;
    object-fit:cover;
}

/* ================= ITEM DETAILS ================= */

.item-details {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 6px;
}


.item-details img{
    width:90px;
    height:90px;
    border-radius:10px;
    object-fit:cover;
}
.item-text h2{
    font-size:28px;
    margin-bottom:8px;
    color:#fff;
}

.restaurant{
    color:#bdbdbd;
    font-size:15px;
}
/* ================= PRICE  total ================= */

.price,
.total{
    text-align:center;
    font-size:22px;
    font-weight:600;
}

.price{
    color:#ff7a00;
}

.total{
    color:#00e676;
}

/* ================= QUANTITY ================= */

.quantity-box{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:12px;
}

.quantity-box form{
    margin:0;
}

.quantity-box input[type="submit"]{
    width:38px;
    height:38px;
    border:none;
    border-radius:50%;
    background:#ff6b35;
    color:#fff;
    font-size:20px;
    cursor:pointer;
    transition:.3s;
}

.quantity-box input[type="submit"]:hover{
    background:#e65100;
}

.quantity-box span{
    font-size:22px;
    font-weight:bold;
}

/* ================= REMOVE BUTTON ================= */

.remove-btn{
    padding:12px 18px;
    border:none;
    border-radius:8px;
    background:#f44336;
    color:#fff;
    font-size:15px;
    cursor:pointer;
    transition:.3s;
}

.remove-btn:hover{
    background:#d32f2f;
}

/* ================= SUMMARY ================= */

.cart-summary{
    width:320px;
    margin:30px 0 30px auto;
    background:#1b1c22;
    padding:25px;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,.3);
}

.total-text{
    color:#ccc;
    font-size:22px;
}

.total-price{
    margin-top:12px;
    color:#00e676;
    font-size:38px;
    font-weight:bold;
}

/* ================= BUTTONS ================= */

.cart-actions{
    display:flex;
    gap:20px;
    margin-top:35px;
}

.cart-actions a{
    flex:1;
    text-decoration:none;
    text-align:center;
    padding:16px;
    border-radius:10px;
    background:#ff6b35;
    color:#fff;
    font-size:18px;
    font-weight:600;
    transition:.3s;
}

.cart-actions a:hover{
    background:#e65a27;
    transform:translateY(-2px);
}

/* ================= EMPTY CART ================= */

.empty-cart{
    width:500px;
    margin:80px auto;
    background:#1b1c22;
    padding:40px;
    border-radius:20px;
    text-align:center;
}

.empty-cart h2{
    color:#ff6b35;
    margin-bottom:15px;
}

.empty-cart p{
    color:#cccccc;
    margin-bottom:25px;
}

.check-btn{
    display:inline-block;
    padding:15px 30px;
    text-decoration:none;
    background:#ff6b35;
    color:#fff;
    border-radius:10px;
    font-weight:bold;
    transition:.3s;
}

.check-btn:hover{
    background:#e65a27;
}

/* ================= RESPONSIVE ================= */

@media(max-width:992px){

.cart-box .cart-header{
    display:none;
}

.cart-card > * {
    align-self: center;
}


.cart-card img{
    width:100%;
    height:220px;
}

.item-details{
    margin-top:15px;
}

.price,
.total{
    text-align:center;
}

.quantity-box{
    justify-content:center;
}

.cart-summary{
    width:100%;
}

.cart-actions{
    flex-direction:column;
}
}

</style>

</head>
<body>

 <!-- header -->

	<jsp:include page="header.jsp"/>


      <header class="cart-header">
          <h1>🛒 My Cart</h1>
          <p>Review your selected food items</p>
     </header>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    Integer restaurantId = (Integer) session.getAttribute("restaurantId");
    double grandTotal = 0;
    
    if (cart != null && !cart.getItems().isEmpty()) {
    	
    
%>

          <div  class="cart-box">
                    
                 <div class="cart-header">
                      <div>Image</div>
                      <div>Item</div>
                      <div>Price</div>
                      <div>Total</div>
                      <div>Quantity</div>
                      <div>Action</div>
                 
                 </div>
                 
                 <%
                      MenuDAOImpl dao = new MenuDAOImpl();
                   for(CartItem item : cart.getItems().values()) {
                	   
                	   Menu menu = dao.getMenu(item.getMenu_id());
                	   
                	   grandTotal += item.getTotalPrice();
                 %>
                 
             <div class="cart-card">
                  
                     <img src="<%=menu.getImagePath()%>" alt="<%=menu.getFood_name()%>">
                 <div class="item-details">
                     <h2><%=menu.getFood_name()%></h2>
                     <p class="restaurant">Restaurant ID : <%=item.getRestaurant_id()%></p>
                 </div>
                 
                  <div class="price">₹<%=item.getPrice()%></div>
                  <div class="total">₹<%=item.getTotalPrice()%></div>
                 
           
           <div class="quantity-box">
           
             <form action="cartServlet" method="post">
                <input type="hidden" name="menu_id" value="<%= item.getMenu_id() %>">
                <input type="hidden" name="restaurant_id" value="<%= item.getRestaurant_id() %>">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                <input type="submit" value="-">
              </form>

              <span class="quantity"><%= item.getQuantity() %></span>
              
            <form action="cartServlet" method="post">
                <input type="hidden" name="menu_id" value="<%= item.getMenu_id() %>">
                <input type="hidden" name="restaurant_id" value="<%= item.getRestaurant_id() %>">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                <input type="submit" value="+">
            </form>   
              
         </div>
           
           <form action="cartServlet" method="post">
                <input type="hidden" name="menu_id" value="<%= item.getMenu_id() %>">
                <input type="hidden" name="restaurant_id" value="<%= item.getRestaurant_id() %>">
                <input type="hidden" name="action" value="remove">
                <input type="submit" value="Remove" class="remove-btn">
            </form>
           
         </div>
          
          <%
                   }
          %>
          
          <div class="cart-summary">
               <div class="total-text">grand Total</div>
               <div class="total-price">₹<%= grandTotal %></div>
          </div>
          
          
          <div class="cart-actions">
                <a href="menu?restaurantId=<%= restaurantId %>">Add More Items</a>
                <a href="checkout.jsp">Proceed to Checkout</a>
          </div>
          
          <% 
      } else {
        %>
            
            <div class="empty-cart">
                 <h2>🛒 Your Cart is Empty</h2>
                 <p>Please add some delicious food items.</p>
                 <a href="RestaurantServlet" class="check-btn">Back to Restaurants</a>
            </div>
           

        <% } %>
    </div>

</body>
</html>