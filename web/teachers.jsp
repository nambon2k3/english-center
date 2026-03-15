<%-- 
    Document   : teachers
    Created on : Mar 14, 2026, 10:13:27 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Analytics - DayNight Admin</title>
        <script>if (localStorage.getItem("daynight-theme") === "carbon") {
                document.documentElement.classList.add("carbon");
            }</script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

        <link rel="stylesheet" href="css/templatemo-daynight-style.css">


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
        <!-- Mobile Menu -->
        <c:set var="activePage" value="teachers" scope="request"/>
        <jsp:include page="header-mobile.jsp"/>

        <c:if test="${param.success eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Teachers added successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.deleteSuccess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Teachers deleted/restored successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.updateSuccess eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Teachers Updated successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.fail eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show">
                    <div class="toast-body">
                        Teachers to add teacher!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.updateFail eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Teachers Updated Failed!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.deleteFail eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Teachers deleted/restored Failed!
                    </div>
                </div>
            </div>
        </c:if>

        <div class="app-container">
            <jsp:include page="header.jsp"/>

            <!-- Main Content -->
            <main class="main-content">


                <!-- Top Pages Table -->
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Teachers List</h3>
                            <p class="card-subtitle">Most visited pages this period</p>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: center; gap: 5px">
                            <form class="search-form"  action="teachers" method="get" style="display: flex; align-items: center; justify-content: center">
                                <input type="text" class="form-input" placeholder="Search teachers..." 
                                       name="searchContent" value="${requestScope.searchContent}"
                                       style="padding: 0.5rem 1rem; margin-right: 10px">
                                <button class="btn btn-secondary">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="11" cy="11" r="8"></circle>
                                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                    </svg>
                                    Search
                                </button>
                            </form>
                            <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                </svg>
                                Add
                            </button>
                        </div>

                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Full Name</th>
                                    <th>Date of Birth</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Specialization</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="teacher" items="${teachers}">
                                    <tr>
                                        <td class="td-name">
                                            <div style="font-weight: 500;">
                                                ${teacher.username}
                                            </div>
                                        </td>
                                        <td class="td-name">${teacher.fullName}</td>
                                        <td class="td-name">${teacher.dateOfBirth}</td>
                                        <td class="td-name">${teacher.phone}</td>
                                        <td class="td-name">${teacher.email}</td>
                                        <td class="td-name">
                                            <div style="font-size: 0.85rem; color: var(--text-secondary);">
                                                ${teacher.address}
                                            </div>
                                        </td>
                                        <td class="td-name">
                                            <span class="badge badge-green">
                                                ${teacher.specialization}
                                            </span>
                                        </td>
                                        <td class="td-name">
                                            <c:if test="${!teacher.isDeleted}">
                                                <span class="badge badge-green">
                                                    Active
                                                </span>
                                            </c:if>
                                            <c:if test="${teacher.isDeleted}">
                                                <span class="badge badge-red">
                                                    Deleted
                                                </span>
                                            </c:if>
                                        </td>
                                        <td class="td-name">
                                            <button type="button" class="btn  btn-small btn-success" data-bs-toggle="modal" data-bs-target="#updateModal_${teacher.id}">
                                                Edit
                                            </button>
                                            <div class="modal fade" id="updateModal_${teacher.id}" tabindex="-1" aria-labelledby="updateModalLabel_${teacher.id}" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" style="max-width: 800px">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="updateModalLabel_${teacher.id}">Update Teacher</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form class="add-form" action="teachers" method="post">
                                                                <input type="hidden" name="action" value="update">
                                                                <input type="hidden" name="id" value="${teacher.id}">
                                                                <div class="form-row"  style="grid-template-columns: 1fr 1fr; gap:20px;"">
                                                                    <div class="form-group">
                                                                        <label>Username</label>
                                                                        <input type="text" name="username" class="form-input" value="${teacher.username}" required>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>Password</label>
                                                                        <input type="password" name="passwordHash" class="form-input" value="${teacher.passwordHash}" required>
                                                                    </div>
                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group">
                                                                        <label>Full Name</label>
                                                                        <input type="text" name="fullName" class="form-input" value="${teacher.fullName}" required>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>Date of Birth</label>
                                                                        <input type="date" name="dateOfBirth" class="form-input" value="${teacher.dateOfBirth}">
                                                                    </div>
                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group">
                                                                        <label>Email</label>
                                                                        <input type="email" name="email" class="form-input" required value="${teacher.email}">
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label>Phone</label>
                                                                        <input type="text" name="phone" class="form-input" required value="${teacher.phone}"> 
                                                                    </div>
                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group">
                                                                        <label>Address</label>
                                                                        <input type="text" name="address" class="form-input" value="${teacher.address}">
                                                                    </div>

                                                                    <div class="form-group" style="display: none">
                                                                        <label>Specialization</label>
                                                                        <input type="text" name="specialization" class="form-input" value="None">
                                                                    </div>
                                                                </div>

                                                                <div class="form-row" style="display: none">
                                                                    <div class="form-group">
                                                                        <label>Role</label>
                                                                        <select name="roleId" class="form-input">
                                                                            <option value="2" selected="">Teacher</option>
                                                                        </select>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <!-- empty column for layout balance -->
                                                                    </div>
                                                                </div>

                                                                <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                    <button type="submit" class="btn btn-primary">Update Teacher</button>
                                                                    <a href="teachers" class="btn btn-secondary">Cancel</a>
                                                                </div>

                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${!teacher.isDeleted}">
                                                <button type="button" class="btn  btn-small btn-danger" data-bs-toggle="modal" data-bs-target="#deleteStudentModal_${teacher.id}">
                                                    Delete
                                                </button>
                                            </c:if>

                                            <c:if test="${teacher.isDeleted}">
                                                <button type="button" class="btn  btn-small btn-success"  data-bs-toggle="modal" data-bs-target="#deleteStudentModal_${teacher.id}">
                                                    Restore
                                                </button>
                                            </c:if>
                                            <div class="modal fade" id="deleteStudentModal_${teacher.id}" tabindex="-1" aria-labelledby="deleteStudentModal_${teacher.id}" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="deleteStudentModal_${teacher.id}">Delete Teacher</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body text-center">
                                                            <c:if test="${!teacher.isDeleted}">
                                                                <p class="fs-5 mb-2">
                                                                    Confirm delete class with ID: 
                                                                    <span class="fw-bold text-danger">${teacher.id}</span>
                                                                </p>
                                                                <form class="add-form" action="teachers" method="post">
                                                                    <input type="hidden" name="action" value="delete">
                                                                    <input type="hidden" name="id" value="${teacher.id}">

                                                                    <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                        <button type="submit" class="btn btn-primary btn-danger">Confirm</button>
                                                                        <a href="students" class="btn btn-secondary">Cancel</a>
                                                                    </div>
                                                                </form>
                                                            </c:if>

                                                            <c:if test="${teacher.isDeleted}">
                                                                <p class="fs-5 mb-2">
                                                                    Confirm restore class with ID: 
                                                                    <span class="fw-bold text-danger">${teacher.id}</span>
                                                                </p>
                                                                <form class="add-form" action="students" method="post">
                                                                    <input type="hidden" name="action" value="delete">
                                                                    <input type="hidden" name="id" value="${teacher.id}">

                                                                    <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                        <button type="submit" class="btn btn-primary btn-danger">Confirm</button>
                                                                        <a href="students" class="btn btn-secondary">Cancel</a>
                                                                    </div>
                                                                </form>
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination-container">

                            <a class="page-btn ${currentPage == 1 ? 'disabled' : ''}"
                               href="?page=${currentPage-1}&searchContent=${searchContent}">
                                Prev
                            </a>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <a class="page-number ${i == currentPage ? 'active' : ''}"
                                   href="?page=${i}&searchContent=${searchContent}">
                                    ${i}
                                </a>
                            </c:forEach>

                            <a class="page-btn ${currentPage == totalPages ? 'disabled' : ''}"
                               href="?page=${currentPage+1}&searchContent=${searchContent}">
                                Next
                            </a>

                        </div>
                    </div>
                </div>
            </main>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" style="max-width: 800px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Teacher</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="add-form" action="teachers" method="post">
                                <input type="hidden" name="action" value="add">
                                <div class="form-row"  style="grid-template-columns: 1fr 1fr; gap:20px;"">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" name="username" class="form-input" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" class="form-input" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <input type="text" name="fullName" class="form-input" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <input type="date" name="dateOfBirth" class="form-input">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="email" class="form-input" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" name="phone" class="form-input">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" name="address" class="form-input">
                                    </div>

                                    <div class="form-group">
                                        <label>Specialization</label>
                                        <input type="text" name="specialization" class="form-input" placeholder="ITELS, TOEIC,...">
                                    </div>
                                </div>

                                <div class="form-row" style="display: none">
                                    <div class="form-group">
                                        <label>Role</label>
                                        <select name="roleId" class="form-input">
                                            <option value="2" selected="">Student</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <!-- empty column for layout balance -->
                                    </div>
                                </div>

                                <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                    <button type="submit" class="btn btn-primary">Add Teacher</button>
                                    <a href="teachers" class="btn btn-secondary">Cancel</a>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                <p>&copy; 2026 DayNight Admin. Designed by <a href="https://www.templatemo.com" target="_blank" rel="nofollow">TemplateMo</a></p>
            </footer>
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

