<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Report Lost Item</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>


<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>">Dashboard</a>
        <!--<a href="reportLost.jsp">Report Lost</a>
        <a href="addFound.jsp">Add Found</a>-->
        <a href="viewLost.jsp">Lost Items</a>
        <a href="viewFound.jsp">Found Items</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>


<div class="container">
    <h2>Report Lost Item</h2>

    <form action="LostItemServlet" method="post">

        <div class="form-group">
            <label for="itemName">Item Name</label>
            <input type="text" id="itemName" name="itemName" required>
        </div>

        <div class="form-group">
            <label for="location">Last Seen Location</label>
            <input type="text" id="location" name="location" required>
        </div>

        <div class="form-group">
            <label for="description">Item Description</label>
            <textarea id="description" name="description" rows="5" required></textarea>
        </div>

        <input type="submit" value="Submit Report" class="btn">
    </form>

    <div style="text-align:center; margin-top:20px;">
        <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>" class="btn">
            Back to Dashboard
        </a>
    </div>
</div>


<div class="footer">
    &copy; 2026 Lost &amp; Found Management System
</div>

</body>
</html>


