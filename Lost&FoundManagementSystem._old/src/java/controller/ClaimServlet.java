package controller;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ClaimDAO;

@WebServlet("/ClaimServlet")
public class ClaimServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String itemName = request.getParameter("itemName");

        ClaimDAO.save(itemName);

        response.sendRedirect("dashboard.jsp");
    }
}
