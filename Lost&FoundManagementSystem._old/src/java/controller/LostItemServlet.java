package controller;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LostItem;
import dao.LostItemDAO;

@WebServlet("/LostItemServlet")
public class LostItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // Get form data (names MATCH JSP)
        String itemName = request.getParameter("itemName");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // Create model
        LostItem item = new LostItem();
        item.setItemName(itemName);
        item.setLocation(location);
        item.setDescription(description);

        // ✅ SET DATE (VERY IMPORTANT)
        item.setDate(new Date(System.currentTimeMillis()));

        // Save to DB
        LostItemDAO.save(item);

        // ✅ Redirect to VIEW page (not dashboard)
        response.sendRedirect("viewLost.jsp");
    }
}
