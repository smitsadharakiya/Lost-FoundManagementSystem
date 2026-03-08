<%-- 
    Document   : claimItem
    Created on : 27 Jan 2026, 11:01:50 pm
    Author     : dhruv
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || currentUser.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Claim Item</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="viewLost.jsp">Lost Items</a>
        <a href="viewFound.jsp">Found Items</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="container">
    <h2>Claim an Item</h2>

    <form action="ClaimServlet" method="post">

        <div class="form-group">
            <label for="itemName">Item Name</label>
            <input type="text" id="itemName" name="itemName" required>
        </div>

        <input type="submit" value="Claim Item" class="btn">
    </form>

    <div style="text-align:center; margin-top:20px;">
        <a href="dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 Lost &amp; Found Management System
</div>

</body>
</html>






<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if(currentUser == null || currentUser.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Claim Item</title>
</head>
<body>
    <h1>Claim Item</h1>
    <form action="ClaimServlet" method="post">
        Item Name: <input type="text" name="itemName" required><br><br>
        <input type="submit" value="Claim">
    </form>
    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>--%>
