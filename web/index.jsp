<%-- 
    Document   : index
    Created on : Mar 14, 2026, 9:28:04 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - DayNight Admin</title>
        <script>
            // Prevent flash of white in dark mode - runs before CSS/page render
            if (localStorage.getItem('daynight-theme') === 'carbon') {
                document.documentElement.classList.add('carbon');
            }
        </script>
        <link rel="stylesheet" href="css/templatemo-daynight-style.css">
        <!--
    
    TemplateMo 608 DayNight Admin
    
    https://templatemo.com/tm-608-daynight-admin
    
        -->
    </head>
    <body>
        <c:set var="activePage" value="dashboard" scope="request"/>
        <jsp:include page="header-mobile.jsp"/>

        <div class="app-container">
            <!-- Top Navigation -->
            <jsp:include page="header.jsp"/>


            <!-- Main Content -->
            <main class="main-content">
                <!-- Page Header -->
                <div class="page-header">
                    <h1 class="greeting" id="greeting">Good morning, ${sessionScope.username}</h1>
                    <p class="greeting-sub">Here's what's happening with your projects today. </p>
                </div>

                <!-- Stats Grid -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-label">Total Revenue</div>
                        <div class="stat-value">
                            <fmt:formatNumber value="${data.revenue}" pattern="###,###" /> VND
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-label">Active Students</div>
                        <div class="stat-value">
                            ${data.numStudents}
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-label">Active Teachers</div>
                        <div class="stat-value">
                            ${data.numTeachers}
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-label">Total CLasses</div>
                        <div class="stat-value">
                            ${data.classes}
                        </div>
                    </div>
                </div>

                <!-- Two Column Layout -->
                <!-- Comparison Chart -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Revenue Overview</h3>
                            <p class="card-subtitle">Compare this period with previous</p>
                        </div>
                    </div>
                    <div class="chart-container" style="grid-column: 2">
                        <div class="chart-scroll">
                            <div class="chart-scroll-inner">
                                <div class="bar-chart">
                                    <div class="y-axis">
                                        <span class="y-axis-label">
                                            <fmt:formatNumber value="${maxRevenue}" pattern="###,###" />
                                        </span>
                                        <span class="y-axis-label">
                                            <fmt:formatNumber value="${maxRevenue / 5 * 4}" pattern="###,###" />
                                        </span>
                                        <span class="y-axis-label">
                                            <fmt:formatNumber value="${maxRevenue / 5 * 3}" pattern="###,###" />
                                        </span>
                                        <span class="y-axis-label">
                                            <fmt:formatNumber value="${maxRevenue / 5 * 2}" pattern="###,###" />
                                        </span>
                                        <span class="y-axis-label">
                                            <fmt:formatNumber value="${maxRevenue / 5 * 1}" pattern="###,###" />
                                        </span>
                                        <span class="y-axis-label">
                                            0 
                                        </span>
                                    </div>
                                    <div class="y-axis-lines">
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                    </div>

                                    <c:forEach var="r" items="${revenues}">
                                        <div class="bar-group">
                                            <div class="bar-wrapper">
                                                <div class="bar current" style="height: ${140 * r.revenue / maxRevenue}px;"></div>
                                            </div>
                                            <span class="bar-label">Jan</span>
                                        </div>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Activity Feed -->

                </div>
            </main>

            <!-- Footer -->
            <footer class="footer">
                <p>&copy; 2026 DayNight Admin. Designed by <a href="https://www.templatemo.com" target="_blank" rel="nofollow">TemplateMo</a></p>
            </footer>
        </div>

        <script src="js/templatemo-daynight-script.js"></script>
    </body>
</html>
