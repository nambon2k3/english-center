/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ClassesDAO;
import DAO.LevelDAO;
import DAO.UserDAO;
import Model.Classroom;
import Model.Level;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name = "ClassController", urlPatterns = {"/classes"})
public class ClassController extends HttpServlet {

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

        int page = 1;
        int pageSize = 10;

        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        String searchContent = request.getParameter("searchContent");

        List<Classroom> classrooms = classesDAO.getClassrooms(searchContent, page, pageSize);
        List<User> teachers = userDAO.getUsersByRoleId(2);
        List<Level> levels = levelDAO.getAllLevels();

        int totalRecords
                = classesDAO.countClassrooms(searchContent);

        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        request.setAttribute("classrooms", classrooms);
        request.setAttribute("teachers", teachers);
        request.setAttribute("levels", levels);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchContent", searchContent);

        request.getRequestDispatcher("classrooms.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add" ->
                    addClass(request, response);
                case "update" ->
                    updateClass(request, response);
                case "delete" ->
                    deleteClass(request, response);
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void addClass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String className = request.getParameter("className");
        Long levelId = Long.valueOf(request.getParameter("levelId"));
        Long teacherId = Long.valueOf(request.getParameter("teacherId"));

        Integer maxStudents = Integer.valueOf(request.getParameter("maxStudents"));
        BigDecimal tuitionFee = new BigDecimal(request.getParameter("tuitionFee"));

        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        Classroom classroom = Classroom.builder()
                .className(className)
                .level(Level.builder().id(levelId).build())
                .teacher(User.builder().id(teacherId).build())
                .maxStudents(maxStudents)
                .tuitionFee(tuitionFee)
                .startDate(startDate)
                .endDate(endDate)
                .build();

        boolean success = classesDAO.addClassroom(classroom);

        if (success) {
            response.sendRedirect("classes?success=true");
        } else {
            response.sendRedirect("classes?fail=true");
        }

    }

    private void updateClass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("id"));

        String className = request.getParameter("className");
        Long levelId = Long.valueOf(request.getParameter("levelId"));
        Long teacherId = Long.valueOf(request.getParameter("teacherId"));

        Integer maxStudents = Integer.valueOf(request.getParameter("maxStudents"));
        BigDecimal tuitionFee = new BigDecimal(request.getParameter("tuitionFee"));

        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        Classroom classroom = Classroom.builder()
                .id(id)
                .className(className)
                .level(Level.builder().id(levelId).build())
                .teacher(User.builder().id(teacherId).build())
                .maxStudents(maxStudents)
                .tuitionFee(tuitionFee)
                .startDate(startDate)
                .endDate(endDate)
                .build();

        boolean success = classesDAO.updateClassroom(classroom);

        if (success) {
            response.sendRedirect("classes?updateSuccess=true");
        } else {
            response.sendRedirect("classes?updateFail=true");
        }
    }

    private void deleteClass(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("id"));

        boolean success = classesDAO.deleteClassroom(id);

        if (success) {
            response.sendRedirect("classes?deleteSuccess=true");
        } else {
            response.sendRedirect("classes?deleteFail=true");
        }

    }

}
