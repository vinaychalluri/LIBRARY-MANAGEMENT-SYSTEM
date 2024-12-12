package ProjectLibrary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session to clear all session attributes
        HttpSession session = request.getSession(false); // Get the current session, don't create a new one
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        
        // Set headers to prevent caching of the page
        response.setHeader("Cache-Control", "no-store"); // Prevent caching
        response.setHeader("Pragma", "no-cache"); // For HTTP/1.0 compatibility
        response.setDateHeader("Expires", 0); // Expiry set to 0 to prevent caching

        // Redirect to login page after logout
        response.sendRedirect("studentLogin.jsp"); // Redirect to the login page
    }
}
