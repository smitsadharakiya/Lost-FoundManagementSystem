<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Campus Lost & Found - Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>


<div class="navbar">
    <h1>Campus Lost &amp; Found System</h1>
</div>

<div class="container login-container">
    <h2>Login</h2>

    <form action="LoginServlet" method="post">

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required>
        </div>

        <input type="submit" value="Login" class="btn full-width">
    </form>
</div>


<div class="footer fixed-footer">
    &copy; 2026 Campus Lost &amp; Found Management System
</div>

</body>
</html>
