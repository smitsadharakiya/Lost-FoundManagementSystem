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
    <title>Add Found Item</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>


<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="<%= currentUser.getRole().equalsIgnoreCase("admin")
                ? "adminDashboard.jsp" : "dashboard.jsp" %>">Dashboard</a>
        <!--<a href="addFound.jsp">Add Found</a>-->
        <a href="viewFound.jsp">Found Items</a>
        <a href="viewLost.jsp">Lost Items</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>


<div class="container">
    <h2>Add Found Item</h2>

    <form action="FoundItemServlet" method="post">

        <div class="form-group">
            <label>Item Name</label>
            <input type="text" name="itemName" required>
        </div>

        <div class="form-group">
            <label>Location Found</label>
            <input type="text" name="location" required>
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" rows="4" required></textarea>
        </div>

        
        <input type="submit" value="Submit Found Item">
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

