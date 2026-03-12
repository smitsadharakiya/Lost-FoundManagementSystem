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
            <a href="addFound.jsp">ADD</a>
        </div>

        <div class="card">
            <h3>View Lost Items</h3>
            <a href="viewLost.jsp">VIEW</a>
        </div>

        <div class="card">
            <h3>View Found Items</h3>
            <a href="viewFound.jsp">VIEW</a>
        </div>

    </div>
</div>


<div class="footer">
    &copy; 2026 Lost &amp; Found Management System | Admin Panel
</div>

</body>
</html>




</html>--%>
