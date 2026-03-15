<%-- 
    Document   : index
    Created on : Mar 14, 2026, 9:28:04 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="stat-value">$48,250</div>
                    <div class="stat-change positive">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                            <polyline points="17 6 23 6 23 12"/>
                        </svg>
                        +12.5% vs last period
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Active Users</div>
                    <div class="stat-value">2,420</div>
                    <div class="stat-change positive">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                            <polyline points="17 6 23 6 23 12"/>
                        </svg>
                        +8.2% vs last period
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Total Orders</div>
                    <div class="stat-value">1,840</div>
                    <div class="stat-change negative">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="23 18 13.5 8.5 8.5 13.5 1 6"/>
                            <polyline points="17 18 23 18 23 12"/>
                        </svg>
                        -3.1% vs last period
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Conversion Rate</div>
                    <div class="stat-value">3.24%</div>
                    <div class="stat-change positive">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                            <polyline points="17 6 23 6 23 12"/>
                        </svg>
                        +0.8% vs last period
                    </div>
                </div>
            </div>

            <!-- Two Column Layout -->
            <div class="two-col">
                <!-- Comparison Chart -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Revenue Overview</h3>
                            <p class="card-subtitle">Compare this period with previous</p>
                        </div>
                        <div class="date-picker">
                            <button class="date-btn" onclick="setDateRange('7d', this)">7D</button>
                            <button class="date-btn active" onclick="setDateRange('30d', this)">30D</button>
                            <button class="date-btn" onclick="setDateRange('90d', this)">90D</button>
                            <button class="date-btn" onclick="setDateRange('12m', this)">12M</button>
                        </div>
                    </div>
                    <div class="chart-container">
                        <div class="chart-scroll">
                            <div class="chart-scroll-inner">
                                <div class="bar-chart">
                                    <div class="y-axis">
                                        <span class="y-axis-label">$50K</span>
                                        <span class="y-axis-label">$40K</span>
                                        <span class="y-axis-label">$30K</span>
                                        <span class="y-axis-label">$20K</span>
                                        <span class="y-axis-label">$10K</span>
                                        <span class="y-axis-label">$0</span>
                                    </div>
                                    <div class="y-axis-lines">
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 80px;"></div>
                                            <div class="bar current" style="height: 100px;"></div>
                                        </div>
                                        <span class="bar-label">Jan</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 95px;"></div>
                                            <div class="bar current" style="height: 120px;"></div>
                                        </div>
                                        <span class="bar-label">Feb</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 70px;"></div>
                                            <div class="bar current" style="height: 85px;"></div>
                                        </div>
                                        <span class="bar-label">Mar</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 110px;"></div>
                                            <div class="bar current" style="height: 140px;"></div>
                                        </div>
                                        <span class="bar-label">Apr</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 90px;"></div>
                                            <div class="bar current" style="height: 105px;"></div>
                                        </div>
                                        <span class="bar-label">May</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 130px;"></div>
                                            <div class="bar current" style="height: 155px;"></div>
                                        </div>
                                        <span class="bar-label">Jun</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 100px;"></div>
                                            <div class="bar current" style="height: 125px;"></div>
                                        </div>
                                        <span class="bar-label">Jul</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar previous" style="height: 85px;"></div>
                                            <div class="bar current" style="height: 110px;"></div>
                                        </div>
                                        <span class="bar-label">Aug</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="chart-legend">
                            <div class="legend-item">
                                <span class="legend-dot current"></span>
                                This Period
                            </div>
                            <div class="legend-item">
                                <span class="legend-dot previous"></span>
                                Previous Period
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Activity Feed -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Recent Activity</h3>
                            <p class="card-subtitle">Latest updates from your team</p>
                        </div>
                        <button class="btn btn-ghost">View All</button>
                    </div>
                    <div class="card-scroll">
                        <div class="card-scroll-inner" style="min-width: 360px;">
                            <div class="activity-feed">
                        <div class="activity-item">
                            <div class="activity-icon blue">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                                    <polyline points="14 2 14 8 20 8"/>
                                    <line x1="16" y1="13" x2="8" y2="13"/>
                                    <line x1="16" y1="17" x2="8" y2="17"/>
                                </svg>
                            </div>
                            <div class="activity-content">
                                <p class="activity-text"><strong>Sarah Chen</strong> uploaded new design files for Dashboard v2</p>
                                <span class="activity-time">2 minutes ago</span>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon green">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                                    <polyline points="22 4 12 14.01 9 11.01"/>
                                </svg>
                            </div>
                            <div class="activity-content">
                                <p class="activity-text"><strong>Michael Torres</strong> completed task "API Integration"</p>
                                <span class="activity-time">15 minutes ago</span>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon orange">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
                                </svg>
                            </div>
                            <div class="activity-content">
                                <p class="activity-text"><strong>Emma Wilson</strong> commented on your project proposal</p>
                                <span class="activity-time">1 hour ago</span>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon blue">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                                    <circle cx="8.5" cy="7" r="4"/>
                                    <line x1="20" y1="8" x2="20" y2="14"/>
                                    <line x1="23" y1="11" x2="17" y2="11"/>
                                </svg>
                            </div>
                            <div class="activity-content">
                                <p class="activity-text"><strong>James Lee</strong> joined the team as Frontend Developer</p>
                                <span class="activity-time">3 hours ago</span>
                            </div>
                        </div>
                        <div class="activity-item">
                            <div class="activity-icon green">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="12" r="10"/>
                                    <polyline points="12 6 12 12 16 14"/>
                                </svg>
                            </div>
                            <div class="activity-content">
                                <p class="activity-text">Scheduled deployment for <strong>v2.4.0</strong> completed successfully</p>
                                <span class="activity-time">5 hours ago</span>
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Chart Row -->
            <div class="two-col" style="margin-top: 1.5rem;">
                <!-- User Growth Chart -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">User Growth</h3>
                            <p class="card-subtitle">New users vs returning users</p>
                        </div>
                    </div>
                    <div class="chart-container">
                        <div class="chart-scroll">
                            <div class="chart-scroll-inner">
                                <div class="bar-chart">
                                    <div class="y-axis">
                                        <span class="y-axis-label">500</span>
                                        <span class="y-axis-label">400</span>
                                        <span class="y-axis-label">300</span>
                                        <span class="y-axis-label">200</span>
                                        <span class="y-axis-label">100</span>
                                        <span class="y-axis-label">0</span>
                                    </div>
                                    <div class="y-axis-lines">
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                        <div class="y-axis-line"></div>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 70px; background: var(--success);"></div>
                                            <div class="bar" style="height: 90px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 1</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 85px; background: var(--success);"></div>
                                            <div class="bar" style="height: 100px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 2</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 95px; background: var(--success);"></div>
                                            <div class="bar" style="height: 115px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 3</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 110px; background: var(--success);"></div>
                                            <div class="bar" style="height: 130px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 4</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 100px; background: var(--success);"></div>
                                            <div class="bar" style="height: 125px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 5</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 120px; background: var(--success);"></div>
                                            <div class="bar" style="height: 145px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 6</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 130px; background: var(--success);"></div>
                                            <div class="bar" style="height: 155px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 7</span>
                                    </div>
                                    <div class="bar-group">
                                        <div class="bar-wrapper">
                                            <div class="bar" style="height: 140px; background: var(--success);"></div>
                                            <div class="bar" style="height: 160px; background: #A855F7;"></div>
                                        </div>
                                        <span class="bar-label">Week 8</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="chart-legend">
                            <div class="legend-item">
                                <span class="legend-dot" style="background: var(--success);"></span>
                                New Users
                            </div>
                            <div class="legend-item">
                                <span class="legend-dot" style="background: #A855F7;"></span>
                                Returning Users
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Performance Metrics -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Performance Metrics</h3>
                            <p class="card-subtitle">Key performance indicators</p>
                        </div>
                    </div>
                    <div class="card-scroll">
                        <div class="card-scroll-inner" style="min-width: 400px;">
                            <div style="padding: 0.5rem 0;">
                                <div style="margin-bottom: 1.5rem;">
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                        <span style="font-size: 0.875rem; color: var(--text-primary);">Customer Satisfaction</span>
                                        <span style="font-size: 0.875rem; font-weight: 600; color: var(--success);">92%</span>
                                    </div>
                                    <div class="progress-bar">
                                        <div class="progress-fill success" style="width: 92%;"></div>
                                    </div>
                                </div>
                                <div style="margin-bottom: 1.5rem;">
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                        <span style="font-size: 0.875rem; color: var(--text-primary);">Response Time</span>
                                        <span style="font-size: 0.875rem; font-weight: 600; color: var(--accent);">78%</span>
                                    </div>
                                    <div class="progress-bar">
                                        <div class="progress-fill accent" style="width: 78%;"></div>
                                    </div>
                                </div>
                                <div style="margin-bottom: 1.5rem;">
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                        <span style="font-size: 0.875rem; color: var(--text-primary);">Task Completion</span>
                                        <span style="font-size: 0.875rem; font-weight: 600; color: var(--success);">85%</span>
                                    </div>
                                    <div class="progress-bar">
                                        <div class="progress-fill success" style="width: 85%;"></div>
                                    </div>
                                </div>
                                <div style="margin-bottom: 1.5rem;">
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                        <span style="font-size: 0.875rem; color: var(--text-primary);">System Uptime</span>
                                        <span style="font-size: 0.875rem; font-weight: 600; color: var(--success);">99.9%</span>
                                    </div>
                                    <div class="progress-bar">
                                        <div class="progress-fill success" style="width: 99.9%;"></div>
                                    </div>
                                </div>
                                <div>
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                                        <span style="font-size: 0.875rem; color: var(--text-primary);">Bug Resolution</span>
                                        <span style="font-size: 0.875rem; font-weight: 600; color: var(--warning);">68%</span>
                                    </div>
                                    <div class="progress-bar">
                                        <div class="progress-fill warning" style="width: 68%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
