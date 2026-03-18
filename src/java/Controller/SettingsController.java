/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import Model.Role;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author Legion
 */
@WebServlet(name="SettingsController", urlPatterns={"/settings"})
public class SettingsController extends HttpServlet {
    
    private UserDAO userDAO;
    

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String username = (String) request.getSession().getAttribute("username");
        
        User user = userDAO.getUserByUsername(username);
        
        request.setAttribute("user", user);
        
        request.getRequestDispatcher("settings.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "update" ->
                    updateAccount(request, response);
                case "change" ->
                    changePassword(request, response);
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
    
    
    private void updateAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String dobStr = request.getParameter("dateOfBirth");


        LocalDate dateOfBirth = null;
        if (dobStr != null && !dobStr.isBlank()) {
            dateOfBirth = LocalDate.parse(dobStr);
        }


        String username = (String) request.getSession().getAttribute("username");
        
        User user = userDAO.getUserByUsername(username);

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setDateOfBirth(dateOfBirth);

        System.out.println("User: " + user);
        
        boolean success = userDAO.updateUser(user);

        if (success) {
            response.sendRedirect("settings?updateSuccess=true");
        } else {
            response.sendRedirect("settings?updateFail=true");
        }
    }
    
    
    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        
        String username = (String) request.getSession().getAttribute("username");
        
        User user = userDAO.login(username, currentPassword);
        
        if (user == null) {
            response.sendRedirect("settings?updateFail=true&err=Wrong");
            return;
        }
        user.setPasswordHash(newPassword);

        boolean success = userDAO.updateUser(user);

        if (success) {
            response.sendRedirect("settings?changeSuccess=true");
        } else {
            response.sendRedirect("settings?changeFail=true");
        }
    }

    

}
