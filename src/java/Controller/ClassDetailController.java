/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ClassScheduleDAO;
import DAO.ClassesDAO;
import DAO.EnrollmentDAO;
import DAO.LevelDAO;
import DAO.UserDAO;
import Model.ClassSchedule;
import Model.Classroom;
import Model.Enrollment;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Legion
 */
@WebServlet(name = "ClassDetailController", urlPatterns = {"/class-detail"})
public class ClassDetailController extends HttpServlet {

    private ClassesDAO classesDAO;
    private UserDAO userDAO;
    private LevelDAO levelDAO;
    private EnrollmentDAO enrollmentDAO;
    private ClassScheduleDAO scheduleDAO;

    @Override
    public void init() throws ServletException {
        classesDAO = new ClassesDAO();
        userDAO = new UserDAO();
        levelDAO = new LevelDAO();
        enrollmentDAO = new EnrollmentDAO();
        scheduleDAO = new ClassScheduleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("id"));

        int page = 1;
        int pageSize = 10;

        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        Classroom classroom = classesDAO.getClassroomById(id);

        // Get data
        List<Enrollment> enrollments
                = enrollmentDAO.getEnrollmentsByClassId(id, page, pageSize);

        List<ClassSchedule> schedules = scheduleDAO.getSchedulesByClassId(id);

        String days = schedules.stream()
                .map(s -> String.valueOf(s.getDayOfWeek()))
                .distinct()
                .collect(Collectors.joining(", "));

        int total = enrollmentDAO.countEnrollmentsByClassId(id);
        int totalPages = (int) Math.ceil((double) total / pageSize);

        List<User> students = userDAO.getUsersByRoleId(3, "", page, pageSize, id);

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("schedules", schedules);
        request.setAttribute("students", students);
        request.setAttribute("days", days);
        request.setAttribute("enrollments", enrollments);
        request.setAttribute("currentPage", page);
        request.setAttribute("classroom", classroom);
        request.setAttribute("classId", id);
        request.getRequestDispatcher("class-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "addStudent" ->
                    addStudent(request, response);
                case "deleteStudent" ->
                    deleteStudent(request, response);
                case "updatePaid" ->
                    updatePaid(request, response);
                case "deleteSchedule" ->
                    deleteSchedule(request, response);
                case "addSchedule" ->
                    addSchedule(request, response);
                case "updateSchedule" ->
                    updateSchedule(request, response);
            }
        } else {
            // Handle missing action parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }

    }

    private void updatePaid(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long studentId = Long.valueOf(request.getParameter("studentId"));
        Long classId = Long.valueOf(request.getParameter("classId"));
        int paid = Integer.parseInt(request.getParameter("paid"));

        boolean success = enrollmentDAO.updatePaid(studentId, classId, paid);

        if (success) {
            response.sendRedirect("class-detail?id=" + classId + "&updatePaid=true");
        } else {
            response.sendRedirect("class-detail?id=" + classId + "&updatePaid=false");
        }
    }
    
    private void updateSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long scheduleId = Long.valueOf(request.getParameter("scheduleId"));
        Long classId = Long.valueOf(request.getParameter("classId"));
        LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
        LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));

        boolean success = scheduleDAO.updateSchedule(scheduleId, startTime, endTime);

        if (success) {
            response.sendRedirect("class-detail?id=" + classId + "&updateSchedule=true");
        } else {
            response.sendRedirect("class-detail?id=" + classId + "&updateSchedule=false");
        }
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long studentId = Long.valueOf(request.getParameter("studentId"));
        Long classId = Long.valueOf(request.getParameter("classId"));

        boolean success = enrollmentDAO.addStudentToClass(studentId, classId);

        if (success) {
            response.sendRedirect("class-detail?id=" + classId + "&addStudentSucess=true");
        } else {
            response.sendRedirect("class-detail?id=" + classId + "&addStudentFailed=true");
        }
    }

    private void addSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long classId = Long.valueOf(request.getParameter("classId"));
        int dayOfWeek = Integer.parseInt(request.getParameter("dayOfWeek"));
        LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
        LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));

        boolean success = scheduleDAO.addSchedule(classId, dayOfWeek, startTime, endTime);

        if (success) {
            response.sendRedirect("class-detail?id=" + classId + "&addScheduleSucess=true");
        } else {
            response.sendRedirect("class-detail?id=" + classId + "&addScheduleFailed=true");
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long studentId = Long.valueOf(request.getParameter("studentId"));
        Long classId = Long.valueOf(request.getParameter("classId"));
        String status = request.getParameter("status");

        boolean success = enrollmentDAO.updateEnrollmentStatus(studentId, classId, status);

        if (success) {
            response.sendRedirect("class-detail?id=" + classId + "&deleteStudentSucess=true");
        } else {
            response.sendRedirect("class-detail?id=" + classId + "&deleteStudentFailed=true");
        }
    }

    private void deleteSchedule(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long scheduleId = Long.valueOf(request.getParameter("scheduleId"));
        Long classId = Long.valueOf(request.getParameter("classId"));

        boolean success = scheduleDAO.deleteSchedule(scheduleId, classId);

        if (success) {
            response.sendRedirect("class-detail?id=" + classId + "&deleteScheduleSucess=true");
        } else {
            response.sendRedirect("class-detail?id=" + classId + "&deleteScheduleFailed=true");
        }
    }

}
