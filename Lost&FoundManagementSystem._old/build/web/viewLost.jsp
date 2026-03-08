<%-- 
    Document   : viewLost
    Created on : 27 Jan 2026, 11:00:51 pm
    Author     : dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.LostItem" %>
<%@ page import="dao.LostItemDAO" %>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    ArrayList<LostItem> lostList = LostItemDAO.getAllLostItems();
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Lost Items</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>">Dashboard</a>
        <!--<a href="viewLost.jsp">Lost Items</a>-->
        <a href="reportLost.jsp">Report Lost</a>
        <a href="viewFound.jsp">Found Items</a>
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h2>Lost Items</h2>

    <table>
        <tr>
            <th>Item Name</th>
            <th>Last Seen Location</th>
            <th>Description</th>
            <th>Date</th>
        </tr>

        <% if (lostList.isEmpty()) { %>
        <tr>
            <td colspan="4" style="text-align:center;">No lost items reported yet.</td>
        </tr>
        <% } else {
            for (LostItem item : lostList) { %>
        <tr>
            <td><%= item.getItemName() %></td>
            <td><%= item.getLocation() %></td>
            <td><%= item.getDescription() %></td>
            <td><%= item.getDate() %></td>
        </tr>
        <% }} %>

    </table>

    <div style="text-align:center; margin-top:20px;">
        <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>" class="btn">
            Back to Dashboard
        </a>
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
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Lost Items</title>
</head>
<body>
    <h1>Lost Items</h1>
    <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>">Back to Dashboard</a>
</body>
</html>--%>


