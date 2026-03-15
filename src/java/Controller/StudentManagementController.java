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
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name = "StudentManagementController", urlPatterns = {"/students"})
public class StudentManagementController extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int pageSize = 10;

        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        String searchContent = request.getParameter("searchContent");

        List<User> students = userDAO.getUsersByRoleId(3, searchContent, page, pageSize);
        int totalStudents = userDAO.countStudents(3, searchContent);
        int totalPages = (int) Math.ceil((double) totalStudents / pageSize);

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("students", students);
        request.setAttribute("currentPage", page);
        request.setAttribute("searchContent", searchContent);

        request.getRequestDispatcher("students.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Determine action (add or update)
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add" ->
                    addStudent(request, response);
                case "update" ->
                    updateStudent(request, response);
                case "delete" ->
                    deleteStudent(request, response);
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String specialization = request.getParameter("specialization");

        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String dobStr = request.getParameter("dateOfBirth");

        LocalDate dateOfBirth = null;
        if (dobStr != null && !dobStr.isBlank()) {
            dateOfBirth = LocalDate.parse(dobStr);
        }

        boolean success = false;

        // check duplicate email
        User existingUser = userDAO.getUserByEmailOrUsername(email, username);

        if (existingUser == null) {

            Role role = new Role();
            role.setId((long) roleId);

            User newUser = User.builder()
                    .username(username)
                    .passwordHash(password) // ideally hash password
                    .fullName(fullName)
                    .dateOfBirth(dateOfBirth)
                    .phone(phone)
                    .email(email)
                    .address(address)
                    .specialization(specialization)
                    .role(role)
                    .build();

            success = userDAO.addUser(newUser);
        }

        if (success) {
            response.sendRedirect("students?success=true");
        } else {
            response.sendRedirect("students?fail=true");
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("id"));

        String username = request.getParameter("username");
        String passwordHash = request.getParameter("passwordHash");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String specialization = request.getParameter("specialization");
        String dobStr = request.getParameter("dateOfBirth");

        int roleId = Integer.parseInt(request.getParameter("roleId"));

        LocalDate dateOfBirth = null;
        if (dobStr != null && !dobStr.isBlank()) {
            dateOfBirth = LocalDate.parse(dobStr);
        }

        Role role = new Role();
        role.setId((long) roleId);

        User user = User.builder()
                .id(id)
                .username(username)
                .fullName(fullName)
                .passwordHash(passwordHash)
                .email(email)
                .phone(phone)
                .address(address)
                .dateOfBirth(dateOfBirth)
                .specialization(specialization)
                .role(role)
                .build();

        System.out.println("User: " + user);
        
        boolean success = userDAO.updateUser(user);

        if (success) {
            response.sendRedirect("students?updateSuccess=true");
        } else {
            response.sendRedirect("students?updateFail=true");
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("id"));

        boolean success = userDAO.deleteUser(id);

        if (success) {
            response.sendRedirect("students?deleteSuccess=true");
        } else {
            response.sendRedirect("students?deleteFail=true");
        }
    }

}
