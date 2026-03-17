<%-- 
    Document   : class-detail.jsp
    Created on : Mar 15, 2026, 8:47:51 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <style>
            .settings-grid {
                display: grid;
                grid-template-columns: 1fr 3fr !important;
                gap: 1.5rem;
            }

            .class-description {
                margin-bottom: 15px
            }

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

        <c:if test="${param.addStudentSucess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Student added successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.addStudentSucess eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Failed to add student!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.addScheduleSucess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Schedule added successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.addScheduleFailed eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Failed to add schedule!
                    </div>
                </div>
            </div>
        </c:if>


        <c:if test="${param.deleteStudentSucess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Student remove/undo successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.deleteStudentFailed eq 'true'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Failed to remove/undo student!
                    </div>
                </div>
            </div>
        </c:if>


        <c:if test="${param.updatePaid eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Student Paid Status changed successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.updatePaid eq 'false'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Failed to change Student Paid Status!
                    </div>
                </div>
            </div>
        </c:if>


        <c:if test="${param.deleteScheduleSucess eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Delete Schedule successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.deleteScheduleFailed eq 'false'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Failed to delete Schedule!
                    </div>
                </div>
            </div>
        </c:if>
        
        
        <c:if test="${param.updateSchedule eq 'true'}">
            <div  class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div class="toast text-bg-success toast-success-animate show">
                    <div class="toast-body">
                        Update Schedule successfully!
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${param.updateSchedule eq 'false'}">
            <div class="toast-container position-fixed start-50 translate-middle" style="top: 10%">
                <div id="failToast" class="toast text-bg-danger border-0 show ">
                    <div class="toast-body">
                        Failed to update Schedule!
                    </div>
                </div>
            </div>
        </c:if>

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
                        <section class="settings-section">
                            <div class="card">
                                <h2 class="settings-title" style="display: flex; align-items: center; justify-content: space-between; ">

                                    <span>Class Schedule</span>
                                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal_1">
                                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg>
                                        Add Schedule
                                    </button>

                                </h2>

                                <table>
                                    <c:forEach var="s" items="${schedules}">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${s.dayOfWeek == 1}">Monday</c:when>
                                                    <c:when test="${s.dayOfWeek == 2}">Tuesday</c:when>
                                                    <c:when test="${s.dayOfWeek == 3}">Wednesday</c:when>
                                                    <c:when test="${s.dayOfWeek == 4}">Thursday</c:when>
                                                    <c:when test="${s.dayOfWeek == 5}">Friday</c:when>
                                                    <c:when test="${s.dayOfWeek == 6}">Saturday</c:when>
                                                    <c:when test="${s.dayOfWeek == 7}">Sunday</c:when>
                                                    <c:otherwise>Unknown</c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>
                                                ${s.startTime}
                                            </td>

                                            <td>
                                                ${s.endTime}
                                            </td>

                                            <td colspan="2">

                                                <div style="display: flex; align-items: center; justify-content: center; gap: 2px">
                                                    <button type="button" class="btn  btn-small btn-danger" data-bs-toggle="modal" data-bs-target="#deleteScheduleModal_${s.id}">
                                                        X
                                                    </button>
                                                    <div class="modal fade" id="deleteScheduleModal_${s.id}" tabindex="-1" aria-labelledby="deleteScheduleModal_${s.id}" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="deleteScheduleModal_${s.id}">Remove Schedule</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body text-center">
                                                                    <p class="fs-5 mb-2">
                                                                        Confirm delete schedule with ID: 
                                                                        <span class="fw-bold text-danger">${s.id}</span>
                                                                    </p>

                                                                    <p>
                                                                        <c:choose>
                                                                            <c:when test="${s.dayOfWeek == 1}">Monday</c:when>
                                                                            <c:when test="${s.dayOfWeek == 2}">Tuesday</c:when>
                                                                            <c:when test="${s.dayOfWeek == 3}">Wednesday</c:when>
                                                                            <c:when test="${s.dayOfWeek == 4}">Thursday</c:when>
                                                                            <c:when test="${s.dayOfWeek == 5}">Friday</c:when>
                                                                            <c:when test="${s.dayOfWeek == 6}">Saturday</c:when>
                                                                            <c:when test="${s.dayOfWeek == 7}">Sunday</c:when>
                                                                            <c:otherwise>Unknown</c:otherwise>
                                                                        </c:choose>
                                                                        : ${s.startTime} to ${s.endTime}
                                                                    </p>


                                                                    <form class="add-form" action="class-detail" method="post">
                                                                        <input type="hidden" name="action" value="deleteSchedule">
                                                                        <input type="hidden" name="scheduleId" value="${s.id}">
                                                                        <input type="hidden" name="classId" value="${classId}">

                                                                        <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                            <button type="submit" class="btn btn-primary btn-danger">Confirm</button>
                                                                            <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <button type="button" class="btn btn-success btn-small" data-bs-toggle="modal" data-bs-target="#updateScheduleModal_${s.id}">
                                                        Edit
                                                    </button>

                                                    <div class="modal fade" id="updateScheduleModal_${s.id}" tabindex="-1" aria-labelledby="updateScheduleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" style="max-width: 800px">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="updateScheduleModalLabel">Modal title</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form id="scheduleForm" class="add-form" action="class-detail" method="post">
                                                                        <input type="hidden" name="action" value="updateSchedule">
                                                                        <input type="hidden" name="classId" value="${classId}">
                                                                        <input type="hidden" name="scheduleId" value="${s.id}">
                                                                        <div class="form-row"  style="grid-template-columns: 1fr 1fr; gap:20px;"">
                                                                            <div class="form-group">
                                                                                <label>Day of Week</label>
                                                                                <select name="dayOfWeek" class="form-input" required>
                                                                                    <option value="${s.dayOfWeek}">
                                                                                        <c:choose>
                                                                                            <c:when test="${s.dayOfWeek == 1}">Monday</c:when>
                                                                                            <c:when test="${s.dayOfWeek == 2}">Tuesday</c:when>
                                                                                            <c:when test="${s.dayOfWeek == 3}">Wednesday</c:when>
                                                                                            <c:when test="${s.dayOfWeek == 4}">Thursday</c:when>
                                                                                            <c:when test="${s.dayOfWeek == 5}">Friday</c:when>
                                                                                            <c:when test="${s.dayOfWeek == 6}">Saturday</c:when>
                                                                                            <c:when test="${s.dayOfWeek == 7}">Sunday</c:when>
                                                                                        </c:choose>
                                                                                    </option>
                                                                                    <c:forEach var="day" begin="1" end="7">

                                                                                        <c:set var="exists" value="false" />

                                                                                        <!-- Check if day already exists -->
                                                                                        <c:forEach var="s" items="${schedules}">
                                                                                            <c:if test="${s.dayOfWeek == day}">
                                                                                                <c:set var="exists" value="true" />
                                                                                            </c:if>
                                                                                        </c:forEach>

                                                                                        <!-- Show only if not exists -->
                                                                                        <c:if test="${!exists}">
                                                                                            <option value="${day}">
                                                                                                <c:choose>
                                                                                                    <c:when test="${day == 1}">Monday</c:when>
                                                                                                    <c:when test="${day == 2}">Tuesday</c:when>
                                                                                                    <c:when test="${day == 3}">Wednesday</c:when>
                                                                                                    <c:when test="${day == 4}">Thursday</c:when>
                                                                                                    <c:when test="${day == 5}">Friday</c:when>
                                                                                                    <c:when test="${day == 6}">Saturday</c:when>
                                                                                                    <c:when test="${day == 7}">Sunday</c:when>
                                                                                                </c:choose>
                                                                                            </option>
                                                                                        </c:if>

                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <!-- empty column for layout balance -->
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-row">
                                                                            <div class="form-group">
                                                                                <label>Start Time:</label>
                                                                                <input type="time" name="startTime" class="form-input"  required>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>End Time:</label>
                                                                                <input type="time" name="endTime" class="form-input" required>
                                                                            </div>
                                                                        </div>



                                                                        <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                            <button type="submit" class="btn btn-primary">Update Schedule</button>
                                                                            <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
                                                                        </div>

                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>

                            </div>
                        </section>
                    </div>

                    <!-- Right Column: Notifications & Security -->
                    <div>
                        <section class="settings-section">
                            <div class="card">
                                <div style="display: flex; align-items: center; justify-content: space-between; ">
                                    <div>
                                        <h2 class="settings-title">Student Information</h2>
                                        <p class="settings-desc">Choose what notifications you receive</p>
                                    </div>
                                    <div>
                                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                            </svg>
                                            Add Student
                                        </button>
                                    </div>
                                </div>


                                <table>
                                    <thead>
                                        <tr>
                                            <th>Full Name</th>
                                            <th>Date of Birth</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Tution</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="enrollment" items="${enrollments}">
                                            <tr>
                                                <td class="td-name">${enrollment.student.fullName}</td>
                                                <td class="td-name">${enrollment.student.dateOfBirth}</td>
                                                <td class="td-name">${enrollment.student.phone}</td>
                                                <td class="td-name">
                                                    <c:if test="${enrollment.status == 'ACTIVE'}">
                                                        <span class="badge badge-green">
                                                            Active
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${enrollment.status == 'DROPPED'}">
                                                        <span class="badge badge-red">
                                                            DROPPED
                                                        </span>
                                                    </c:if>
                                                </td>
                                                <td class="td-name">
                                                    <c:if test="${enrollment.paid == 1}">
                                                        <span class="badge badge-green">
                                                            Paid
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${enrollment.paid == 0}">
                                                        <span class="badge badge-red">
                                                            Unpaid
                                                        </span>
                                                    </c:if>
                                                </td>
                                                <td class="td-name">
                                                    <button type="button" class="btn  btn-small btn-success" data-bs-toggle="modal" data-bs-target="#updateModal_${enrollment.student.id}">
                                                        Edit
                                                    </button>
                                                    <div class="modal fade" id="updateModal_${enrollment.student.id}" tabindex="-1" aria-labelledby="updateModalLabel_${enrollment.student.id}" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered" style="max-width: 800px">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="updateModalLabel_${enrollment.student.id}">Update Student</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form class="add-form" action="class-detail" method="post">
                                                                        <input type="hidden" name="action" value="updatePaid">
                                                                        <input type="hidden" name="studentId" value="${enrollment.student.id}">
                                                                        <input type="hidden" name="classId" value="${classId}">
                                                                        <input type="hidden" name="paid" value="${enrollment.paid == 1 ? 0 : 1}">

                                                                        <div class="form-row">
                                                                            <div class="form-group">
                                                                                <label>Full Name</label>
                                                                                <input type="text" name="fullName" class="form-input" value="${enrollment.student.fullName}" readonly>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Date of Birth</label>
                                                                                <input type="date" name="dateOfBirth" class="form-input" value="${enrollment.student.dateOfBirth}" readonly>
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-row">
                                                                            <div class="form-group">
                                                                                <label>Email</label>
                                                                                <input type="email" name="email" class="form-input" required value="${enrollment.student.email}" readonly>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Phone</label>
                                                                                <input type="text" name="phone" class="form-input" required value="${enrollment.student.phone}" readonly> 
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                            <button type="submit" class="btn btn-primary">${enrollment.paid == 0 ? 'Set as Paid' : 'Set as UnPaid'} </button>
                                                                            <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
                                                                        </div>

                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <c:if test="${enrollment.status == 'ACTIVE'}">
                                                        <button type="button" class="btn  btn-small btn-danger" data-bs-toggle="modal" data-bs-target="#deleteStudentModal_${enrollment.student.id}">
                                                            Remove
                                                        </button>
                                                    </c:if>

                                                    <c:if test="${enrollment.status != 'ACTIVE'}">
                                                        <button type="button" class="btn  btn-small btn-success"  data-bs-toggle="modal" data-bs-target="#deleteStudentModal_${enrollment.student.id}">
                                                            Undo
                                                        </button>
                                                    </c:if>

                                                    <div class="modal fade" id="deleteStudentModal_${enrollment.student.id}" tabindex="-1" aria-labelledby="deleteStudentModal_${enrollment.student.id}" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="deleteStudentModal_${enrollment.student.id}">Remove/Restore student</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body text-center">
                                                                    <c:if test="${enrollment.status == 'ACTIVE'}">
                                                                        <p class="fs-5 mb-2">
                                                                            Confirm delete from class, student with ID: 
                                                                            <span class="fw-bold text-danger">${enrollment.student.id}</span>
                                                                        </p>
                                                                        <form class="add-form" action="class-detail" method="post">
                                                                            <input type="hidden" name="action" value="deleteStudent">
                                                                            <input type="hidden" name="studentId" value="${enrollment.student.id}">
                                                                            <input type="hidden" name="classId" value="${classId}">
                                                                            <input type="hidden" name="status" value="DROPPED">

                                                                            <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                                <button type="submit" class="btn btn-primary btn-danger">Confirm</button>
                                                                                <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
                                                                            </div>
                                                                        </form>
                                                                    </c:if>

                                                                    <c:if test="${enrollment.status != 'ACTIVE'}">
                                                                        <p class="fs-5 mb-2">
                                                                            Confirm restore student in class with student ID: 
                                                                            <span class="fw-bold text-danger">${enrollment.student.id}</span>
                                                                        </p>
                                                                        <form class="add-form" action="class-detail" method="post">
                                                                            <input type="hidden" name="action" value="deleteStudent">
                                                                            <input type="hidden" name="studentId" value="${enrollment.student.id}">
                                                                            <input type="hidden" name="classId" value="${classId}">
                                                                            <input type="hidden" name="status" value="ACTIVE">

                                                                            <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                                                                <button type="submit" class="btn btn-primary btn-danger">Confirm</button>
                                                                                <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
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
                                       href="?page=${currentPage-1}&id=${classId}">
                                        Prev
                                    </a>

                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <a class="page-number ${i == currentPage ? 'active' : ''}"
                                           href="?page=${i}&id=${classId}">
                                            ${i}
                                        </a>
                                    </c:forEach>

                                    <a class="page-btn ${currentPage == totalPages ? 'disabled' : ''}"
                                       href="?page=${currentPage+1}&id=${classId}">
                                        Next
                                    </a>

                                </div>

                        </section>
                    </div>
                </div>
            </main>

            <footer class="footer"><p>&copy; 2026 DayNight Admin. Designed by <a href="https://www.templatemo.com" target="_blank" rel="nofollow">TemplateMo</a></p></footer>
        </div>


        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="max-width: 800px">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="add-form" action="class-detail" method="post">
                            <input type="hidden" name="action" value="addStudent">
                            <input type="hidden" name="classId" value="${classId}">
                            <div style="margin-bottom: 20px">
                                <select name="studentId" class="form-input" required>
                                    <c:forEach var="student" items="${students}">
                                        <option value="${student.id}">
                                            ${student.fullName} - ${student.phone} - ${student.email}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                <button type="submit" class="btn btn-primary">Add Student</button>
                                <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModal_1" tabindex="-1" aria-labelledby="exampleModalLabel_1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" style="max-width: 800px">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel_1">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="scheduleForm" class="add-form" action="class-detail" method="post">
                            <input type="hidden" name="action" value="addSchedule">
                            <input type="hidden" name="classId" value="${classId}">
                            <div class="form-row"  style="grid-template-columns: 1fr 1fr; gap:20px;"">
                                <div class="form-group">
                                    <label>Day of Week</label>
                                    <select name="dayOfWeek" class="form-input" required>
                                        <c:forEach var="day" begin="1" end="7">

                                            <c:set var="exists" value="false" />

                                            <!-- Check if day already exists -->
                                            <c:forEach var="s" items="${schedules}">
                                                <c:if test="${s.dayOfWeek == day}">
                                                    <c:set var="exists" value="true" />
                                                </c:if>
                                            </c:forEach>

                                            <!-- Show only if not exists -->
                                            <c:if test="${!exists}">
                                                <option value="${day}">
                                                    <c:choose>
                                                        <c:when test="${day == 1}">Monday</c:when>
                                                        <c:when test="${day == 2}">Tuesday</c:when>
                                                        <c:when test="${day == 3}">Wednesday</c:when>
                                                        <c:when test="${day == 4}">Thursday</c:when>
                                                        <c:when test="${day == 5}">Friday</c:when>
                                                        <c:when test="${day == 6}">Saturday</c:when>
                                                        <c:when test="${day == 7}">Sunday</c:when>
                                                    </c:choose>
                                                </option>
                                            </c:if>

                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <!-- empty column for layout balance -->
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Start Time:</label>
                                    <input type="time" name="startTime" class="form-input" required>
                                </div>

                                <div class="form-group">
                                    <label>End Time:</label>
                                    <input type="time" name="endTime" class="form-input" required>
                                </div>
                            </div>



                            <div class="form-actions" style="display: flex; justify-content: end; align-items: center; gap: 4px ">
                                <button type="submit" class="btn btn-primary">Add Schedule</button>
                                <a data-bs-dismiss="modal" class="btn btn-secondary">Cancel</a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
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
            document.getElementById('scheduleForm').addEventListener("submit", function (e) {
                const start = document.querySelector("[name='startTime']").value;
                const end = document.querySelector("[name='endTime']").value;

                if (start && end && start >= end) {
                    alert("End time must be after start time!");
                    e.preventDefault();
                }
            });
        </script>
    </body>
</html>
