<%-- 
    Document   : class-detail.jsp
    Created on : Mar 15, 2026, 8:47:51 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Settings - DayNight Admin</title>
        <script>if (localStorage.getItem("daynight-theme") === "carbon") {
                document.documentElement.classList.add("carbon");
            }</script>
        <link rel="stylesheet" href="css/templatemo-daynight-style.css">

        <style>
            .settings-grid {
                display: grid;
                grid-template-columns: 1fr 3fr !important;
                gap: 1.5rem;
            }

            .class-description {
                margin-bottom: 15px
            }
        </style>

    </head>
    <body>

        <jsp:include page="header-mobile.jsp"/>

        <div class="app-container">
            <jsp:include page="header.jsp"/>
            <!-- Main Content -->
            <main class="main-content">
                <div class="page-header">
                    <h1 class="greeting">Class: ${classroom.className}</h1>
                    <p class="greeting-sub">Manage your classes and preferences</p>
                </div>

                <!-- Two Column Settings Layout -->
                <div class="settings-grid">
                    <!-- Left Column: Account & Appearance -->
                    <div>
                        <section class="settings-section">
                            <div class="card">
                                <h2 class="settings-title">Class Information</h2>
                                <label class="form-label">Duration</label>
                                <p class="class-description">
                                    From ${classroom.startDate} to ${classroom.endDate}
                                </p>
                                
                                <label class="form-label">Students</label>
                                <p class="class-description">
                                     18 / ${classroom.maxStudents}
                                </p>
                                
                                <label class="form-label">Tuition Fee</label>
                                <p class="class-description">
                                    <fmt:formatNumber value="${classroom.tuitionFee}" pattern="###,###" />
                                </p>
                                
                                <label class="form-label">Level </label>
                                <p class="class-description">
                                    ${classroom.level.levelName}
                                </p>
                                
                                <label class="form-label">Teacher </label>
                                <p class="class-description">
                                    ${classroom.teacher.fullName}
                                </p>

                            </div>
                        </section>
                    </div>

                    <!-- Right Column: Notifications & Security -->
                    <div>
                        <section class="settings-section">
                            <div class="card">
                                <h2 class="settings-title">Notifications</h2>
                                <p class="settings-desc">Choose what notifications you receive</p>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Email Notifications</div><div class="settings-row-desc">Receive updates via email</div></div><label class="toggle"><input type="checkbox" id="email-notif" checked><span class="toggle-slider"></span></label></div>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Push Notifications</div><div class="settings-row-desc">Real-time browser alerts</div></div><label class="toggle"><input type="checkbox" id="push-notif" checked><span class="toggle-slider"></span></label></div>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Project Updates</div><div class="settings-row-desc">When projects are updated</div></div><label class="toggle"><input type="checkbox" id="project-notif" checked><span class="toggle-slider"></span></label></div>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Team Mentions</div><div class="settings-row-desc">When someone mentions you</div></div><label class="toggle"><input type="checkbox" id="mention-notif" checked><span class="toggle-slider"></span></label></div>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Weekly Digest</div><div class="settings-row-desc">Weekly activity summary</div></div><label class="toggle"><input type="checkbox" id="digest-notif"><span class="toggle-slider"></span></label></div>
                            </div>
                        </section>

                        <section class="settings-section">
                            <div class="card">
                                <h2 class="settings-title">Security</h2>
                                <p class="settings-desc">Manage account security</p>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Two-Factor Authentication</div><div class="settings-row-desc">Extra layer of security</div></div><label class="toggle"><input type="checkbox" id="two-factor"><span class="toggle-slider"></span></label></div>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Login Alerts</div><div class="settings-row-desc">Notified of new logins</div></div><label class="toggle"><input type="checkbox" id="login-alerts" checked><span class="toggle-slider"></span></label></div>
                                <div class="settings-row"><div class="settings-row-info"><div class="settings-row-label">Session Timeout</div><div class="settings-row-desc">Auto logout after inactivity</div></div><select class="form-input" style="width: auto; min-width: 130px;"><option>15 minutes</option><option selected>30 minutes</option><option>1 hour</option><option>Never</option></select></div>
                                <div style="margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--border-color);">
                                    <h3 style="font-size: 0.9375rem; font-weight: 600; color: var(--text-primary); margin-bottom: 1rem;">Change Password</h3>
                                    <div class="form-group"><label class="form-label">Current Password</label><input type="password" class="form-input" placeholder="Current password"></div>
                                    <div class="form-group"><label class="form-label">New Password</label><input type="password" class="form-input" placeholder="New password"></div>
                                    <button class="btn btn-primary">Update Password</button>
                                </div>
                                <div style="margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--border-color);">
                                    <h3 style="font-size: 0.9375rem; font-weight: 600; color: var(--danger); margin-bottom: 0.5rem;">Danger Zone</h3>
                                    <button class="btn" style="background: rgba(239, 68, 68, 0.1); color: var(--danger); border: 1px solid var(--danger);">Delete Account</button>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </main>

            <footer class="footer"><p>&copy; 2026 DayNight Admin. Designed by <a href="https://www.templatemo.com" target="_blank" rel="nofollow">TemplateMo</a></p></footer>
        </div>
        <script src="js/templatemo-daynight-script.js"></script>
    </body>
</html>
