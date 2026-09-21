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

input,
select {
    width: 100%;
    padding: 14px;
    margin: 8px 0 18px;
    border: 1px solid transparent;
    border-radius: 10px;
    background: #334155;
    color: white;
    font-size: 15px;
    transition: .3s;
}

input::placeholder {
    color: #94A3B8;
}

input:focus,
select:focus {
    outline: none;
    border-color: #F97316;
    box-shadow: 0 0 8px rgba(249, 115, 22, .4);
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

input[type="submit"]:hover {
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

    <form action="${pageContext.request.contextPath}/SignupServlet"
          method="post">

        <label>Full Name</label>

        <input type="text"
               name="full_name"
               placeholder="Enter your full name"
               required>


        <label>Email</label>

        <input type="email"
               name="email"
               placeholder="Enter your email"
               required>


        <label>Password</label>

        <input type="password"
               name="password"
               placeholder="Enter your password"
               required>


        <label>Phone Number</label>

        <input type="text"
               name="phone"
               placeholder="Enter phone number"
               required>


        <label>Address</label>

        <input type="text"
               name="address"
               placeholder="Enter your address"
               required>


        <label>City</label>

        <input type="text"
               name="city"
               placeholder="Enter your city"
               required>


        <label>Pincode</label>

        <input type="text"
               name="pincode"
               placeholder="Enter pincode"
               required>


        <label for="role">Role</label>

        <select name="role"
                id="role"
                required>

            <option value="">
                -- Select Role --
            </option>

            <option value="CUSTOMER">
                Customer
            </option>

            <option value="RESTAURANT_ADMIN">
                Restaurant Admin
            </option>

            <option value="DELIVERY_AGENT">
                Delivery Agent
            </option>

            <option value="ADMIN">
                Admin
            </option>

        </select>

        <input type="submit"
               value="SignUp">

    </form>

    <p>
        Already have an account?

        <a href="${pageContext.request.contextPath}/signin.jsp">
            Sign In
        </a>
    </p>

</main>

</body>

</html>