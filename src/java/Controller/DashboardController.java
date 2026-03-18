/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.AdminDAO;
import Model.DashboardData;
import Model.RevenueMonth;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name="DashboardController", urlPatterns={"/dashboard"})
public class DashboardController extends HttpServlet {
    
    
    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
    }
    
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        DashboardData dashboardData = new DashboardData();
        
        
        adminDAO.getCountUsersByRole(dashboardData);
        adminDAO.getNumClasses(dashboardData);
        adminDAO.getRevenue(dashboardData);
        
        
        List<RevenueMonth> revenues = adminDAO.getRevenueData();
        
        
        long maxRevenue = revenues.stream()
                .mapToLong(RevenueMonth::getRevenue)
                .max()
                .orElse(0);
        
        System.out.println("revenues:" + revenues);
        
        request.setAttribute("data", dashboardData);
        request.setAttribute("revenues", revenues);
        request.setAttribute("maxRevenue", maxRevenue);
        
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 

}
