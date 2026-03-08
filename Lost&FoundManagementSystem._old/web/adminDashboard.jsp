<%-- 
    Document   : adminDashboard
    Created on : 27 Jan 2026, 11:02:07 pm
    Author     : dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !currentUser.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="adminDashboard.jsp">Dashboard</a>
        <a href="reportLost.jsp">Add Lost</a>
        <a href="addFound.jsp">Add Found</a>
        <a href="viewLost.jsp">Lost Items</a>
        <a href="viewFound.jsp">Found Items</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="container">
    <h2>Welcome Admin, <%= currentUser.getEmail() %></h2>

    <div class="card-container">

        <div class="card">
            <h3>Add Lost Item</h3>
            <!--<p>Manually add lost items reported offline.</p>-->
            <a href="reportLost.jsp">ADD</a>
        </div>

        <div class="card">
            <h3>Add Found Item</h3>
            <!--<p>Manually add found items reported offline.</p>-->
            <a href="addFound.jsp">ADD</a>
        </div>

        <div class="card">
            <h3>View Lost Items</h3>
            <!--<p>View and manage all lost item reports.</p>-->
            <a href="viewLost.jsp">VIEW</a>
        </div>

        <div class="card">
            <h3>View Found Items</h3>
            <!--<p>View and manage all found item reports.</p>-->
            <a href="viewFound.jsp">VIEW</a>
        </div>

    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 Lost &amp; Found Management System | Admin Panel
</div>

</body>
</html>





<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if(currentUser == null || !currentUser.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Welcome Admin, <%= currentUser.getEmail() %></h1>
    <ul>
        <li><a href="reportLost.jsp">Add Lost Item</a></li>
        <li><a href="addFound.jsp">Add Found Item</a></li>
        <li><a href="viewLost.jsp">View All Lost Items</a></li>
        <li><a href="viewFound.jsp">View All Found Items</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</body>
</html>--%>
