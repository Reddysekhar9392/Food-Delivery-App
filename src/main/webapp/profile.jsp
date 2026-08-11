<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.Foodiee.model.User"%>

<%
User user = (User)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>My Profile</title>

  <style type="text/css">
  
      *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#181c29;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.profile-container{
    width:100%;
    display:flex;
    justify-content:center;
    padding:30px;
}

.profile-card{
    width:500px;
    background:#272c3c;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
    border:1px solid #363d53;
}

.profile-header{
    background:linear-gradient(135deg,#ff7a45,#ff5722);
    padding:35px;
    text-align:center;
    color:white;
}

.profile-image{
    width:90px;
    height:90px;
    border-radius:50%;
    background:white;
    color:#ff5722;
    font-size:36px;
    font-weight:bold;
    display:flex;
    justify-content:center;
    align-items:center;
    margin:auto;
    margin-bottom:15px;
}

.profile-header h2{
    font-size:28px;
}

.profile-header p{
    margin-top:8px;
    opacity:.9;
}

.profile-details{
    padding:30px;
}

.detail-row{
    display:flex;
    justify-content:space-between;
    padding:18px 0;
    border-bottom:1px solid #3d4459;
}

.detail-row span{
    color:#b6bfd3;
    font-weight:500;
}

.detail-row strong{
    color:white;
}

.profile-buttons{
    padding:30px;
    display:flex;
    flex-direction:column;
    gap:15px;
}

.btn{
    text-decoration:none;
    padding:15px;
    text-align:center;
    border-radius:10px;
    font-weight:600;
    transition:.3s;
}

.edit-btn{
    background:#ff7a45;
    color:white;
}

.edit-btn:hover{
    background:#ff5b1f;
}

.order-btn{
    background:#3498db;
    color:white;
}

.order-btn:hover{
    background:#2980b9;
}

.logout-btn{
    background:#e74c3c;
    color:white;
}

.logout-btn:hover{
    background:#c0392b;
}

  </style>
</head>

<body>

<div class="profile-container">

    <div class="profile-card">

        <div class="profile-header">

            <div class="profile-image">
                <%= user.getFull_name().substring(0,1).toUpperCase() %>
            </div>

            <h2><%= user.getFull_name() %></h2>
            <p>Food Lover 🍔</p>

        </div>

        <div class="profile-details">

            <div class="detail-row">
                <span>👤 Full Name</span>
                <strong><%= user.getFull_name() %></strong>
            </div>

            <div class="detail-row">
                <span>📧 Email</span>
                <strong><%= user.getEmail() %></strong>
            </div>

            <div class="detail-row">
                <span>📱 Mobile</span>
                <strong><%= user.getPhone() %></strong>
            </div>

            <div class="detail-row">
                <span>🏠 Address</span>
                <strong><%= user.getAddress() %></strong>
            </div>

            <div class="detail-row">
                <span>📍 City</span>
                <strong><%= user.getCity() %></strong>
            </div>
        </div>

        <div class="profile-buttons">
            <a href="editProfile.jsp" class="btn edit-btn"> Edit Profile </a>
            <a href="OrderServlet" class="btn order-btn"> My Orders </a>
            <a href="LogoutServlet" class="btn logout-btn"> Logout </a>
        </div>

    </div>

</div>

</body>
</html>