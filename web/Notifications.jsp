<%-- 
    Document   : Notifications
    Created on : Jun 19, 2024, 1:23:29 PM
    Author     : DELL
--%>


<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="assets/css/button.css">


        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>PHPJabbers.com | Free Job Agency Website Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <jsp:include page="header.jsp"/>
        <div class="banner header-text"></div>
        <div class="app-body" style="height: 100vh;display: flex; align-items: start;">

            <!-- Container starts -->
            <div class="container">

                <!-- Row start -->
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-2">
                            <div class="card-body">

                                <!-- Contacts Container Start -->
                                <div class="notification-container mt-3">
                                    <div class="notification-list">
                                        <c:forEach var="n" items="${listN}">
                                          
                                            <div class="px-3 border-bottom py-2 d-flex align-items-center gap-3 notify-block " style="${n.readStatus == 1 ? '':'opacity:0.5;' }">

                                                <div class="flex-1 flex flex-col w-100">
                                                    <p class="mb-1">

                                                        <span style="font-weight: bold; ">${fn:substring(n.time, 0, 10)}</span>

                                                        <span class="${n.readStatus == 0 ? ' bg-primary badge rounded-pill':'' }"> </span>

                                                    </p>
                                                    <p class="mb-1" style="font-weight: 600; ">

                                                        ${n.message}
                                                    </p>
                                                    <p class="small mb-1">

                                                        <span class="opacity-50">${fn:substring(n.time, 11, 19)}</span>
                                                    </p>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                                <!-- Contacts Container End -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row end -->
                <nav aria-label="Page navigation example ">
                    <ul class="pagination justify-content-end ">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li class="page-item"><a class="page-link" href="notifications?index=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- Container ends -->

        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>

</html>
