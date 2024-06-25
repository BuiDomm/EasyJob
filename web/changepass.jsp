<%-- 
    Document   : profilejb
    Created on : May 16, 2024, 1:00:11 AM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/login.css">
        <!--<link rel="stylesheet" href="assets/css/style.css">-->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <%@ page import="java.text.SimpleDateFormat" %>
        <%@ page import="java.sql.Date" %>


        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Easyjob | Free Job For Everyone</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">

        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <body>


        <%
        Boolean isVerifiedd = (Boolean) request.getAttribute("successfully");
        if (isVerifiedd == null) {
            isVerifiedd = false;
        }
            
        %>
        <script>
            var isVerifiedParam = <%= isVerifiedd %>;
            console.log(isVerifiedParam);
            if (isVerifiedParam) {
                toastr.success("Your request has been processed successfully", "Easyjob Notice", {
                    timeOut: 2000,
                });

            }

        </script>


        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <c:choose>
                    <c:when test="${sessionScope.account == null}">
                        <div class="container">


                            <a class="navbar-brand" href="home.jsp">
                                <figure style="width: 55px;height: 55px;">
                                    <img style="height: 100%;width: 100%;object-fit: cover;" src="./assets/images/easyjobb.png" alt="alt"/>
                                </figure>

                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarResponsive">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="index.jsp">Home
                                            <span class="sr-only">(current)</span>
                                        </a>
                                    </li> 

                                    <li class="nav-item"><a class="nav-link" href="jobs.jsp">Jobs</a></li>

                                    <li class="nav-item"><a class="nav-link" href="about-us.jsp">About us</a></li>

                                    <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">More</a>

                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="team.jsp">Team</a>
                                            <a class="dropdown-item" href="testimonials.jsp">Testimonials</a>
                                            <a class="dropdown-item" href="terms.jsp">Terms</a>
                                        </div>
                                    </li>

                                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>



                                </ul>

                                <ul class="example-2" style="display: flex;max-height: 45px;margin-left: 120px;margin-bottom: 15px;">
                                    <li class="icon-content">
                                        <a href="#!" aria-label="Discord" >
                                            <div class="filled"></div>
                                            <img width="24" height="24" src="https://img.icons8.com/material-outlined/24/appointment-reminders--v1.png" alt="appointment-reminders--v1"/>
                                        </a>
                                        <div class="tooltip">Notification</div>
                                    </li>
                                    <li class="icon-content">
                                        <a
                                            href="#!"


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
                                                        <a class="a-new" href="profilejb.jsp">
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
                                                        <a class="a-new" href="#!">
                                                            <svg stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="currentColor" fill="none" viewBox="0 0 24 24" height="14" width="14" xmlns="http://www.w3.org/2000/svg">
                                                            <rect ry="2" rx="2" height="13" width="13" y="9" x="9"></rect>
                                                            <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                                                            </svg>
                                                            <span>Create CV</span>
                                                        </a>
                                                    </li>

                                                    <hr>
                                                    <li>
                                                        <a class="a-new" href="#!">
                                                            <img width="30" height="30" src="https://img.icons8.com/material/30/buy-upgrade--v1.png" alt="buy-upgrade--v1"/>
                                                            <span>Upgrade Package</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="a-new" href="#!">
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



                            </div>
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.account.roleId == 2}">
                        <style>
                            header {top: 0}
                        </style>
                        <jsp:include page="header.jsp"/>

                    </c:when>
                    <c:when test="${sessionScope.account.roleId == 3}">

                        <jsp:include page="headeremp.jsp"/>

                    </c:when>
                    <c:when test="${sessionScope.account.roleId == 1}">

                        <jsp:include page="headeremp.jsp"/>

                    </c:when>

                </c:choose>

            </nav>
        </header>


        <div class="container">
            <div style="display:flex;justify-content: center;">
                <div class="login-box" style="margin-top: 230px;">
                    <form class="form_container" method="post" action="changepass?role=2">

                        <div style="display: flex; "> 

                            <div class="left--block">
                                <div class="title_container title_container-1">
                                    <p class="title" style="justify-items: start">
                                        Change password systems</p>
                                    <span class="subtitle">Update new password in this platform.</span>
                                </div>
                                <br>
                                <br>

                                <div class="input_container">
                                    <label class="input_label" for="">Current Password</label>
                                    <svg fill="none" viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg" class="icon">
                                    <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#141B34" d="M7 8.5L9.94202 10.2394C11.6572 11.2535 12.3428 11.2535 14.058 10.2394L17 8.5"></path>
                                    <path stroke-linejoin="round" stroke-width="1.5" stroke="#141B34" d="M2.01577 13.4756C2.08114 16.5412 2.11383 18.0739 3.24496 19.2094C4.37608 20.3448 5.95033 20.3843 9.09883 20.4634C11.0393 20.5122 12.9607 20.5122 14.9012 20.4634C18.0497 20.3843 19.6239 20.3448 20.7551 19.2094C21.8862 18.0739 21.9189 16.5412 21.9842 13.4756C22.0053 12.4899 22.0053 11.5101 21.9842 10.5244C21.9189 7.45886 21.8862 5.92609 20.7551 4.79066C19.6239 3.65523 18.0497 3.61568 14.9012 3.53657C12.9607 3.48781 11.0393 3.48781 9.09882 3.53656C5.95033 3.61566 4.37608 3.65521 3.24495 4.79065C2.11382 5.92608 2.08114 7.45885 2.01576 10.5244C1.99474 11.5101 1.99475 12.4899 2.01577 13.4756Z"></path>
                                    </svg>
                                    <input autocomplete="" placeholder="Current password..." title="Inpit title" name="currentpass" type="password" class="input_field" style="width: 90%" value="">
                                </div>
                                <div class="input_container">
                                    <label class="input_label" for="">New Password</label>
                                    <svg fill="none" viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg" class="icon">
                                    <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#141B34" d="M7 8.5L9.94202 10.2394C11.6572 11.2535 12.3428 11.2535 14.058 10.2394L17 8.5"></path>
                                    <path stroke-linejoin="round" stroke-width="1.5" stroke="#141B34" d="M2.01577 13.4756C2.08114 16.5412 2.11383 18.0739 3.24496 19.2094C4.37608 20.3448 5.95033 20.3843 9.09883 20.4634C11.0393 20.5122 12.9607 20.5122 14.9012 20.4634C18.0497 20.3843 19.6239 20.3448 20.7551 19.2094C21.8862 18.0739 21.9189 16.5412 21.9842 13.4756C22.0053 12.4899 22.0053 11.5101 21.9842 10.5244C21.9189 7.45886 21.8862 5.92609 20.7551 4.79066C19.6239 3.65523 18.0497 3.61568 14.9012 3.53657C12.9607 3.48781 11.0393 3.48781 9.09882 3.53656C5.95033 3.61566 4.37608 3.65521 3.24495 4.79065C2.11382 5.92608 2.08114 7.45885 2.01576 10.5244C1.99474 11.5101 1.99475 12.4899 2.01577 13.4756Z"></path>
                                    </svg>
                                    <input autocomplete="" placeholder="New password" title="Inpit title" name="newpass" type="password" class="input_field" style="width: 90%" value="">
                                </div>
                                <div class="input_container">
                                    <label class="input_label" for="">Confirm new password</label>
                                    <svg fill="none" viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg" class="icon">
                                    <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#141B34" d="M7 8.5L9.94202 10.2394C11.6572 11.2535 12.3428 11.2535 14.058 10.2394L17 8.5"></path>
                                    <path stroke-linejoin="round" stroke-width="1.5" stroke="#141B34" d="M2.01577 13.4756C2.08114 16.5412 2.11383 18.0739 3.24496 19.2094C4.37608 20.3448 5.95033 20.3843 9.09883 20.4634C11.0393 20.5122 12.9607 20.5122 14.9012 20.4634C18.0497 20.3843 19.6239 20.3448 20.7551 19.2094C21.8862 18.0739 21.9189 16.5412 21.9842 13.4756C22.0053 12.4899 22.0053 11.5101 21.9842 10.5244C21.9189 7.45886 21.8862 5.92609 20.7551 4.79066C19.6239 3.65523 18.0497 3.61568 14.9012 3.53657C12.9607 3.48781 11.0393 3.48781 9.09882 3.53656C5.95033 3.61566 4.37608 3.65521 3.24495 4.79065C2.11382 5.92608 2.08114 7.45885 2.01576 10.5244C1.99474 11.5101 1.99475 12.4899 2.01577 13.4756Z"></path>
                                    </svg>
                                    <input autocomplete="" placeholder="Confirm new password" title="Inpit title" name="confirmnewpass" type="password" class="input_field" style="width: 90%" value="">
                                </div>
                                <br>
                                <b class="notice-erorr">${notice}</b>

                            </div>


                        </div>


                        <button title="Sign In" type="submit" class="sign-in_btn">
                            <span class="sign-in-text">Save</span>
                        </button>


                    </form>

                </div>

            </div>

        </div>




        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>
</html>
