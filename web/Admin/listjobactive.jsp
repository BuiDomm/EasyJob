<%-- 
    Document   : listjobactive
    Created on : 5 thg 6, 2024, 15:25:45
    Author     : ducanh2192003
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


        <title>Spur - A Bootstrap Admin Template</title>
    </head>

    <body>
        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <%@include file="header.jsp" %>
            </div>
            <div class="dash-app">
                <header class="dash-toolbar">
                    <a href="#!" class="menu-toggle">
                        <i class="fas fa-bars"></i>
                    </a>
                    <a href="#!" class="searchbox-toggle">
                        <i class="fas fa-search"></i>
                    </a>
                    <!--                    <form class="searchbox" action="#!">
                                            <a href="#!" class="searchbox-toggle"> <i class="fas fa-arrow-left"></i> </a>
                                            <button type="submit" class="searchbox-submit"> <i class="fas fa-search"></i> </button>
                                            <input type="text" class="searchbox-input" placeholder="type to search">
                                        </form>-->
                    <div class="tools">
                        <!--                        <a href="https://github.com/HackerThemes/spur-template" target="_blank" class="tools-item">
                                                    <i class="fab fa-github"></i>
                                                </a>-->
                        <a href="#!" class="tools-item">
                            <i class="fas fa-bell"></i>
                            <i class="tools-item-count">4</i>
                        </a>
                        <div class="dropdown tools-item">
                            <a href="#" class="" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                                <!--                                <a class="dropdown-item" href="#!">Profile</a>-->
                                <a class="dropdown-item" href="changepass.jsp">Change Password</a>
                                <a class="dropdown-item" href="login.jsp">Logout</a>
                            </div>
                        </div>
                    </div>
                </header>
                <main class="dash-content">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card spur-card">
                                <div class="card-header bg-success" style="color: white">
                                    <div class="spur-card-icon">
                                        <i class="fas fa-table"></i>
                                    </div>
                                    <div class="spur-card-title">List Job Active</div>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-in-card ">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">Location</th>
                                                <th scope="col">Salary</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Edit</th>
                                                <th scope="col">Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="j" items="${listJ}">
                                                <tr>
                                                    <th scope="row">${j.jobID}</th>
                                                    <td>${j.title}</td>
                                                    <td>${j.location}</td>
                                                    <td>${j.salary}</td>
                                                    <td>${j.date}</td>                                                 
                                                    <td>
                                                        <div class="d-flex align-items-center">                                           
                                                            <span class="badge stats-success p-2 ">${j.status}</span>

                                                        </div>
                                                    </td>

                                                    <td>
                                                        <a href="#" onclick="showMess(${j.jobID}, 'Delete ', 'adminRejectJob?jobId=')" >
                                                            <button class="btn btn-outline-danger btn-sm" data-bs-toggle="tooltip"
                                                                    data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary"
                                                                    >
                                                                <i class="fas fa-trash" ></i>
                                                            </button>
                                                        </a>


                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center">                                           
                                                            <a class="bg-primary" style="color: white ; padding:  5px 10px" href="adminJobDetail?id=${j.jobID}&&hidenButton=activeButton">Detail</a>

                                                        </div>
                                                    </td>
                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                    </table>
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
                                <li class="page-item"><a class="page-link" href="listJobAccept?index=${i}">${i}</a></li>
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
        <script>
            function showMess(id, text, url) {
                var option = confirm('Are you sure to ' + text + ' Job ID = ' + id);
                if (option === true) {
                    console.log(url + id + "&&returnP=listActive");
                    window.location.href = url + id + "&&returnP=listActive";
                }
            }


        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>

    </body>

</html>
