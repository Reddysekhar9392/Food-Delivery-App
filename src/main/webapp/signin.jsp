<form action="${pageContext.request.contextPath}/LoginServlet" method="post">

    Email <br>
    <input type="text"
           name="email"
           placeholder="Enter your email"
           required>
    <br>

    Password <br>
    <input type="password"
           name="password"
           placeholder="Enter your password"
           required>
    <br>

    <input type="submit" value="Login">

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red; margin-top:15px;">
            <%= request.getAttribute("error") %>
        </p>
    <% } %>

</form>