package controller;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.FoundItem;
import dao.FoundItemDAO;

@WebServlet("/FoundItemServlet")
public class FoundItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // ✅ MATCH JSP FIELD NAMES
        String itemName = request.getParameter("itemName");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        FoundItem item = new FoundItem();
        item.setItemName(itemName);
        item.setLocation(location);
        item.setDescription(description);

        // ✅ SET DATE
        item.setDate(new Date(System.currentTimeMillis()));

        FoundItemDAO.save(item);

        // ✅ Redirect to VIEW page
        response.sendRedirect("viewFound.jsp");
    }
}