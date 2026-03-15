/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ClassesDAO;
import DAO.LevelDAO;
import DAO.UserDAO;
import Model.Classroom;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Legion
 */
@WebServlet(name = "ClassDetailController", urlPatterns = {"/class-detail"})
public class ClassDetailController extends HttpServlet {
    
    private ClassesDAO classesDAO;
    private UserDAO userDAO;
    private LevelDAO levelDAO;

    @Override
    public void init() throws ServletException {
        classesDAO = new ClassesDAO();
        userDAO = new UserDAO();
        levelDAO = new LevelDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));

        Classroom classroom = classesDAO.getClassroomById(id);
        
        request.setAttribute("classroom", classroom);
        request.getRequestDispatcher("class-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
