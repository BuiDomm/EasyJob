<%-- 
    Document   : header
    Created on : May 24, 2024, 9:44:29 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/images/android-chrome-192x192.png">
        <title>EasyJob | Free Job For Everyone</title>
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
    </head>
    <body>
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <c:choose>
                        <c:when test="${sessionScope.account == null}">
                            <a style="width: 55px;height: 55px;display: inline-block" class="navbar-brand" href="index.jsp">
                            </c:when>
                            <c:otherwise> 
                                <a style="width: 55px;height: 55px;display: inline-block" class="navbar-brand" href="home">

                                </c:otherwise>

                            </c:choose>
                            <figure style="width: 100%;height: 100%;margin-right: -30px;">
                                <img style="height: 100%;width: 100%;object-fit: cover;" src="./assets/images/easyjobb.png" alt="alt"/>
                            </figure>

                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <c:choose>
                                        <c:when test="${sessionScope.account == null}">
                                            <a class="nav-link" href="index.jsp">Home
                                            </c:when>
                                            <c:otherwise> 
                                                <a class="nav-link" href="home">Home

                                                </c:otherwise>

                                            </c:choose>
                                            <span class="sr-only">(current)</span>
                                        </a>
                                </li> 
                                <li class="nav-item"><a class="nav-link" href="paging?id=1">Jobs</a></li>

                                <li class="nav-item active"><a class="nav-link" href="about-us.jsp">About us</a></li>

                                <li class="nav-item"><a class="nav-link" href="blogs">Blog</a></li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">More</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="team.jsp">Team</a>

                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/companyList">Enterprise</a>

                                        <a class="dropdown-item" href="terms.jsp">Terms</a>
                                        <c:choose>
                                            <c:when test="${sessionScope.account != null}">
                                                <a class="dropdown-item" href="./CVSeeker">CV Profile</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/favoriteJobList">List saved job</a>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </li>

                                <li class="nav-item"><a class="nav-link" href="managerblog">Manager Blog</a></li>
                            </ul>
                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <div style="display: flex;align-items: center;margin-left: 75px;">
                                        <div style="display: flex;max-height: 45px;margin-bottom: 15px;">
                                            <a style="--clr:#ff6600" class="button" href="login.jsp">
                                                <span class="button__icon-wrapper">
                                                    <svg width="10" class="button__icon-svg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>

                                                    <svg class="button__icon-svg  button__icon-svg--copy" xmlns="http://www.w3.org/2000/svg" width="10" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>
                                                </span>
                                                Find A Job
                                            </a>

                                        </div>
                                        <div style="display: flex;max-height: 45px;margin-bottom: 15px; margin-left: 20px">
                                            <a style="--clr:#7808d0 " class="button" href="loginemployeer.jsp">
                                                <span class="button__icon-wrapper">
                                                    <svg width="10" class="button__icon-svg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>

                                                    <svg class="button__icon-svg  button__icon-svg--copy" xmlns="http://www.w3.org/2000/svg" width="10" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>
                                                </span>
                                                Post A Job
                                            </a>

                                        </div>
                                    </div>
                                </c:when >
                                <c:otherwise >
                                    <ul class="example-2" style="display: flex;max-height: 45px;margin-left: 120px;margin-bottom: 15px;">
                                        <div class="shadow-lg d-none" id="boxNotification" style="position: absolute; background: white; top: 80%;width: 400px;right: 15px;">
                                            <h5 class="fw-semibold px-3 py-2 m-0 d-flex justify-content-between">Notifications
                                                <a href="readAll" class="btn btn-info float-end ">Read All</a></h5>
                                                <c:set var="newNotification" value="${notidao.getNewNotificationsesByAccount(sessionScope.account.getIdUser())}" />
                                                <c:forEach var="n" items="${newNotification}">
                                                <a href="javascript:void(0)" class="dropdown-item ">
                                                    <div class="d-flex align-items-start py-2 " style=" white-space: nowrap;
                                                         overflow: hidden;
                                                         text-overflow: ellipsis;
                                                         ${n.readStatus == 1 ? '':'opacity:0.5;'} ">

                                                        <div class="m-0 d-flex justify-content-between ">
                                                            <span class="${n.readStatus == 1 ? ' bg-primary badge rounded-pill h-100 ':'' }"> </span>
                                                            <h6 class="mb-1 fw-semibold">${fn:substring(n.time, 0, 10)}  
                                                                &nbsp;&nbsp;&nbsp;&nbsp;</h6>
                                                            <p class="mb-1">${n.message}</p>

                                                        </div>
                                                    </div>
                                                </a>
                                            </c:forEach>
                                            <div class="d-grid p-3 border-top w-100">
                                                <a href="notifications" class="btn btn-outline-primary w-100">View all</a>
                                            </div>
                                        </div>
                                        <li class="icon-content">
                                            <c:set value="${notidao.getNumberNewNotificationses(sessionScope.account.getIdUser())}" var="number"></c:set>
                                            <c:if test="${number != 0}">
                                                <span class="count rounded-circle bg-danger" style="position: absolute; z-index: 10;top: -15px;right: -10px;width: 25px;">${number}</span>
                                            </c:if>

                                            <a href="#!" aria-label="Discord" onclick="handleDisplayBox()" >
                                                <div class="filled"></div>
                                                <img width="24" height="24" src="https://img.icons8.com/material-outlined/24/appointment-reminders--v1.png" alt="appointment-reminders--v1"/>

                                            </a>


                                            <div class="tooltip">Notification</div>
                                        </li>
                                        <li class="icon-content">
                                            <a
                                                href="messageListAccount"


                                                >
                                                <div class="filled"></div>
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100" viewBox="0 0 24 24">
                                                <path d="M 12 2 C 6.486 2 2 6.262 2 11.5 C 2 14.045 3.088 16.487484 5 18.271484 L 5 22.617188 L 9.0800781 20.578125 C 10.039078 20.857125 11.02 21 12 21 C 17.514 21 22 16.738 22 11.5 C 22 6.262 17.514 2 12 2 z M 12 4 C 16.411 4 20 7.365 20 11.5 C 20 15.635 16.411 19 12 19 C 11.211 19 10.415672 18.884203 9.6386719 18.658203 L 8.8867188 18.439453 L 8.1855469 18.789062 L 7 19.382812 L 7 18.271484 L 7 17.402344 L 6.3632812 16.810547 C 4.8612813 15.408547 4 13.472 4 11.5 C 4 7.365 7.589 4 12 4 z M 11 9 L 6 14 L 10.5 12 L 13 14 L 18 9 L 13.5 11 L 11 9 z"></path>
                                                </svg>
                                            </a>
                                            <div class="tooltip">Message</div>
                                        </li>
                                        <li class="icon-content icon-content-1">
                                            <label class="popup" style="display: inline-block; margin-bottom: -8px;">
                                                <input type="checkbox">
                                                <div class="burger" tabindex="0">
                                                    <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </div>
                                                <nav class="popup-window">
                                                    <legend>Actions</legend>
                                                    <ul>
                                                        <li>


                                                            <a class="a-new" href="updateprofilejb">
                                                                <svg stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="currentColor" fill="none" viewBox="0 0 24 24" height="14" width="14" xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                                                <circle r="4" cy="7" cx="9"></circle>
                                                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                                                </svg>
                                                                <span>Edit Profile</span>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a class="a-new" href="changepass">
                                                                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g id="style"> <g id="setting"> <path id="vector" d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="#6495ed" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> <path id="vector_2" d="M2 12.88V11.12C2 10.08 2.85 9.22 3.9 9.22C5.71 9.22 6.45 7.94 5.54 6.37C5.02 5.47 5.33 4.3 6.24 3.78L7.97 2.79C8.76 2.32 9.78 2.6 10.25 3.39L10.36 3.58C11.26 5.15 12.74 5.15 13.65 3.58L13.76 3.39C14.23 2.6 15.25 2.32 16.04 2.79L17.77 3.78C18.68 4.3 18.99 5.47 18.47 6.37C17.56 7.94 18.3 9.22 20.11 9.22C21.15 9.22 22.01 10.07 22.01 11.12V12.88C22.01 13.92 21.16 14.78 20.11 14.78C18.3 14.78 17.56 16.06 18.47 17.63C18.99 18.54 18.68 19.7 17.77 20.22L16.04 21.21C15.25 21.68 14.23 21.4 13.76 20.61L13.65 20.42C12.75 18.85 11.27 18.85 10.36 20.42L10.25 20.61C9.78 21.4 8.76 21.68 7.97 21.21L6.24 20.22C5.33 19.7 5.02 18.53 5.54 17.63C6.45 16.06 5.71 14.78 3.9 14.78C2.85 14.78 2 13.92 2 12.88Z" stroke="#6495ed" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> </g> </g> </g></svg>
                                                                <span>Change Password</span>
                                                            </a>

                                                        </li>
                                                        <li>
                                                            <a target="_blank" class="a-new" href="CVGenerator.jsp">
                                                                <svg stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="currentColor" fill="none" viewBox="0 0 24 24" height="14" width="14" xmlns="http://www.w3.org/2000/svg">
                                                                <rect ry="2" rx="2" height="13" width="13" y="9" x="9"></rect>
                                                                <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                                                                </svg>
                                                                <span>Create CV</span>
                                                            </a>
                                                        </li>

                                                        <hr>
                                                        <li>
                                                            <a class="a-new" href="listUserPackage">
                                                                <img width="30" height="30" src="https://img.icons8.com/material/30/buy-upgrade--v1.png" alt="buy-upgrade--v1"/>
                                                                <span>Upgrade Package</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="a-new" href="cvapplied">
                                                                <img width="30" height="30" src="https://img.icons8.com/material-outlined/30/view.png" alt="view"/>
                                                                <span>CVs submitted</span>
                                                            </a>
                                                        </li>
                                                        <hr>
                                                        <li>
                                                            <a class="a-new" href="loginjobseeker">
                                                                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#FF0000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M8.00171 7C8.01382 4.82497 8.11027 3.64706 8.87865 2.87868C9.75733 2 11.1715 2 14 2H15C17.8284 2 19.2426 2 20.1213 2.87868C21 3.75736 21 5.17157 21 8V16C21 18.8284 21 20.2426 20.1213 21.1213C19.2426 22 17.8284 22 15 22H14C11.1715 22 9.75733 22 8.87865 21.1213C8.11027 20.3529 8.01382 19.175 8.00171 17" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round"></path> <path opacity="0.5" d="M8 19.5C5.64298 19.5 4.46447 19.5 3.73223 18.7678C3 18.0355 3 16.857 3 14.5V9.5C3 7.14298 3 5.96447 3.73223 5.23223C4.46447 4.5 5.64298 4.5 8 4.5" stroke="#FF0000" stroke-width="1.5"></path> <path d="M15 12L6 12M6 12L8 14M6 12L8 10" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                                                                <span>Logout</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </label>
                                            <div class="tooltip">Account</div>
                                        </li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                </div>
            </nav>
        </header>
    </body>
    <script>
        handleDisplayBox = () => {
            var element = document.getElementById("boxNotification");
            element.classList.toggle("d-block");
        };
    </script>
</html>
