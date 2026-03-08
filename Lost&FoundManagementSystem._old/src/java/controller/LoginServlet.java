package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import model.User;
import dao.UserDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);

        if(UserDAO.validate(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            if(user.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("dashboard.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}
