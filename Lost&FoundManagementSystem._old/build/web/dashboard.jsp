<%-- 
    Document   : dashboard
    Created on : 27 Jan 2026, 11:00:20 pm
    Author     : dhruv
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    } else if (currentUser.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("adminDashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="reportLost.jsp">Report Lost</a>
        <a href="addFound.jsp">Add Found</a>
        <a href="viewLost.jsp">Lost Items</a>
        <a href="viewFound.jsp">Found Items</a>
        <a href="claimItem.jsp">Claim Item</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="container">
    <h2>Welcome, <%= currentUser.getEmail() %></h2>

    <div class="card-container">

        <div class="card">
            <h3>Report Lost Item</h3>
            <!--<p>Report items you have lost on campus.</p>-->
            <a href="reportLost.jsp">REPORT</a>
        </div>

        <div class="card">
            <h3>Add Found Item</h3>
            <!--<p>Add items you have found on campus.</p>-->
            <a href="addFound.jsp">ADD</a>
        </div>

        <div class="card">
            <h3>View Lost Items</h3>
            <!--<p>Browse reported lost items.</p>-->
            <a href="viewLost.jsp">VIEW</a>
        </div>

        <div class="card">
            <h3>View Found Items</h3>
            <!--<p>Browse found items.</p>-->
            <a href="viewFound.jsp">VIEW</a>
        </div>

        <div class="card">
            <h3>Claim Item</h3>
            <!--<p>Request claim for a found item.</p>-->
            <a href="claimItem.jsp">CLAIM</a>
        </div>

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
    if(currentUser == null) {
        response.sendRedirect("index.jsp");
    } else if(currentUser.getRole().equalsIgnoreCase("admin")) {
        response.sendRedirect("adminDashboard.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
</head>
<body>
    <h1>Welcome, <%= currentUser.getEmail() %></h1>

    <ul>
        <li><a href="reportLost.jsp">Report Lost Item</a></li>
        <li><a href="addFound.jsp">Add Found Item</a></li>
        <li><a href="viewLost.jsp">View Lost Items</a></li>
        <li><a href="viewFound.jsp">View Found Items</a></li>
        <li><a href="claimItem.jsp">Claim Item</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</body>
</html>--%>
