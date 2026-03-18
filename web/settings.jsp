<%-- 
    Document   : settings
    Created on : Mar 18, 2026, 6:25:36 AM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Settings - DayNight Admin</title>
        <script>if (localStorage.getItem("daynight-theme") === "carbon") {
                document.documentElement.classList.add("carbon");
            }</script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <link rel="stylesheet" href="css/templatemo-daynight-style.css">
        <!--
    
    TemplateMo 608 DayNight Admin
    
    https://templatemo.com/tm-608-daynight-admin
    
        -->
        <style>
            .td-name{
                width: 160px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .disabled{
                pointer-events: none;
                opacity: 0.5;
                cursor: default;
            }
            .btn-small {
                padding: 4px 6px !important;
                font-size: 12px;
                border-radius: 4px;
                color: var(--text-primary);
                border: 1px solid var(--border-color);
            }

            .btn-danger {
                background: rgba(239, 68, 68, 0.1);
                color: var(--danger);
            }

            .btn-danger:hover {
                background:  var(--danger);
                color: white;
            }

            .btn-success {
                background: #feffff17;
                color:  var(--accent-hover);
            }

            .btn-success:hover {
                background: var(--accent-hover);
                color: greenyellow;
            }

            .btn-secondary:hover {
                border-color: var(--accent) !important;
                color: var(--accent) !important;
                background: var(--bg-surface) !important;
            }
            .form-row{
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            .form-group{
                display: flex;
                flex-direction: column;
            }

            .form-input{
                width: 100%;
            }


            .toast{
                transition: background-color 0.5s ease, transform 0.4s ease, opacity 0.4s ease;
            }

            .toast-success-animate{
                animation: successPulse 0.8s ease;
            }

            @keyframes successPulse{
                0%{
                    background-color:#198754;
                    transform:scale(0.95);
                }
                50%{
                    background-color:#28a745;
                    transform:scale(1.02);
                }
                100%{
                    background-color:#198754;
                    transform:scale(1);
                }
            }


        </style>
    </head>
    <body>
        <jsp:include page="header-mobile.jsp"/>

        <c:if test="${param.updateSuccess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Account updated successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.updateFail eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Account updated Failed!
                    </div>
                </div>
            </div>
        </c:if>


        <c:if test="${param.changeSuccess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Change password successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.changeFail eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Change password Failed!
                    </div>
                </div>
            </div>
        </c:if>

        <div class="app-container">
            <!-- Top Navigation -->
            <jsp:include page="header.jsp"/>

            <!-- Main Content -->
            <main class="main-content">
                <div class="page-header">
                    <h1 class="greeting">Settings</h1>
                    <p class="greeting-sub">Manage your account and preferences</p>
                </div>

                <!-- Two Column Settings Layout -->
                <div class="settings-grid">
                    <!-- Left Column: Account & Appearance -->
                    <div>
                        <section class="settings-section">
                            <div class="card">
                                <h2 class="settings-title">Account Information</h2>
                                <p class="settings-desc">Update your personal information</p>

                                <form class="add-form" action="settings" method="post">
                                    <input type="hidden" name="action" value="update">
                                    <div class="form-group" style="margin-bottom: 1.25rem;">
                                        <label class="form-label">Full Name</label>
                                        <input type="text" name="fullName" class="form-input" value="${user.fullName}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Email Address</label>
                                        <input type="email" name="email" class="form-input" value="${user.email}">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" name="phone" class="form-input" value="${user.phone}">
                                    </div>

                                    <div class="form-group" >
                                        <label>Date of Birth</label>
                                        <input type="date" name="dateOfBirth" class="form-input" value="${user.dateOfBirth}">
                                    </div>

                                    <div class="form-group" style="margin-bottom: 0;">
                                        <label class="form-label">Address</label>
                                        <input type="text"name="address" class="form-input" value="${user.address}">
                                    </div>

                                    <div style="margin-top: 1.25rem;">
                                        <button class="btn btn-primary">Save Changes</button>
                                    </div>
                                </form>


                            </div>
                        </section>


                    </div>

                    <!-- Right Column: Notifications & Security -->
                    <div>


                        <section class="settings-section">
                            <div class="card">
                                <h2 class="settings-title">Security</h2>


                                <div style="margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--border-color);">
                                    <h3 style="font-size: 0.9375rem; font-weight: 600; color: var(--text-primary); margin-bottom: 1rem;">Change Password</h3>
                                    <form class="add-form" action="settings" method="post">
                                        <input type="hidden" name="action" value="change">
                                        <div class="form-group">
                                            <label class="form-label">Current Password</label>
                                            <input type="password" class="form-input" name="currentPassword" placeholder="Current password">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">New Password</label>
                                            <input type="password" class="form-input" name="newPassword" placeholder="New password">
                                        </div >
                                        <c:if test="${param.changeFail eq 'true'}">
                                            <div class="form-group">
                                                <p class="form-label" style="color: red">Wrong password! Please Try again!</p>
                                            </div>
                                        </c:if>
                                        <button class="btn btn-primary">Update Password</button>
                                    </form>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </main>

            <footer class="footer"><p>&copy; 2026 DayNight Admin. Designed by <a href="https://www.templatemo.com" target="_blank" rel="nofollow">TemplateMo</a></p></footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
        <script src="js/templatemo-daynight-script.js"></script>

        <script>
            setTimeout(() => {
                const toast = document.querySelector(".toast-success-animate");
                if (toast) {
                    toast.remove();
                }
            }, 3000);
        </script>
    </body>
</html>

