<%-- 
    Document   : allnotification
    Created on : Jul 6, 2024, 11:21:18 AM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">
        <!--        <link rel="stylesheet" href="../css/spur.css">-->
        <!--        <link rel="stylesheet" href="./assets/css/main.min.css" />-->
        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="./assets/js/chart-js-config.js"></script>


        
    </head>

    <body>
        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <%@include file="sidebar.jsp" %>
            </div>
            <div class="dash-app">
                <%@include file="header.jsp" %>
                <main class="dash-content">
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

                    <nav aria-label="Page navigation example ">
                        <ul class="pagination justify-content-end ">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li class="page-item"><a class="page-link" href="adminViewNotification?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>

    </body>

</html>
