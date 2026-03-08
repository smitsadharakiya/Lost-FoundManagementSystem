<%-- 
    Document   : viewFound
    Created on : 27 Jan 2026, 11:01:20 pm
    Author     : dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="model.FoundItem" %>
<%@ page import="dao.FoundItemDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    ArrayList<FoundItem> foundList = FoundItemDAO.getAllFoundItems();
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Found Items</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <h1>Lost &amp; Found Management System</h1>
    <div style="float:right;">
        <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>">Dashboard</a>
        <a href="addFound.jsp">Add Found</a>
        <a href="viewLost.jsp">Lost Items</a>
        <!--<a href="viewFound.jsp">Found Items</a>-->
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">
    <h2>Found Items</h2>

    <table>
        <tr>
            <th>Item Name</th>
            <th>Location</th>
            <th>Description</th>
            <th>Date</th>
        </tr>

        <% if (foundList.isEmpty()) { %>
        <tr>
            <td colspan="4">No found items available</td>
        </tr>
        <% } else {
            for (FoundItem item : foundList) { %>
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
    <title>View Found Items</title>
</head>
<body>
    <h1>Found Items</h1>
    <!-- You can use JSTL or Servlet to fetch data from found_items table -->
    <a href="<%= currentUser.getRole().equalsIgnoreCase("admin") ? "adminDashboard.jsp" : "dashboard.jsp" %>">Back to Dashboard</a>
</body>
</html>--%>
