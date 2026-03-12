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


        String itemName = request.getParameter("itemName");
        String location = request.getParameter("location");
        String description = request.getParameter("description");


        LostItem item = new LostItem();
        item.setItemName(itemName);
        item.setLocation(location);
        item.setDescription(description);

        
        item.setDate(new Date(System.currentTimeMillis()));

     
        LostItemDAO.save(item);

        response.sendRedirect("viewLost.jsp");
    }
}

