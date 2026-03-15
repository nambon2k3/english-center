/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import Model.User;
import Utils.ErrorMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.HttpCookie;



@WebServlet(name="LoginController", urlPatterns={"/login"})
public class LoginController extends HttpServlet {
    
    private UserDAO userDAO;
    

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        boolean isLoggedIn = false;
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("isLoggedIn".equals(cookie.getName()) && cookie.getValue() != null) {
                    isLoggedIn = true;
                    break;
                }
            }
        }
        
        if (isLoggedIn) {
            // Redirect to dashboard or proceed
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            // Show login page
            response.sendRedirect("login.jsp");
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String remember = request.getParameter("remember");
        boolean isChecked = "on".equals(remember);
        
        
        User user = userDAO.login(username, password);
        
        if(user == null) {
            request.setAttribute("error", ErrorMessage.LOGIN_ERROR_MSG);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        if(isChecked) {
            Cookie usernameCookie = new Cookie("username", username);
            Cookie rememberCookie = new Cookie("remember", "true");
            Cookie isLoggedInCookie = new Cookie("isLoggedIn", "true");
            
            usernameCookie.setMaxAge(1 * 24 * 60 * 60);  // Expires in 1 day (seconds)
            usernameCookie.setPath("/");
            rememberCookie.setMaxAge(1 * 24 * 60 * 60);
            isLoggedInCookie.setMaxAge(1 * 24 * 60 * 60);
            
            response.addCookie(usernameCookie);
            response.addCookie(rememberCookie);
            response.addCookie(isLoggedInCookie);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    Cookie removeCookie = new Cookie(cookie.getName(), "");
                    removeCookie.setMaxAge(0);
                    response.addCookie(removeCookie);
                }
            }
        }
        
        request.getSession().setAttribute("username", username);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    

}
