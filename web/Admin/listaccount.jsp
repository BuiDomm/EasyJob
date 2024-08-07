<%-- 
    Document   : tables
    Created on : 21 thg 5, 2024, 15:25:45
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
                        <div class="col-lg-12">
                            <div class="card spur-card ">
                                <div class="card-header justify-content-between">
                                    <div class="d-flex flex-row">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-table"></i>
                                        </div>
                                        <div class="spur-card-title">${roll == 2 ? "List Account Jobseeker" : "List Account Employee"}</div>
                                    </div>
                                    <div class="d-flex flex-row">
                                        <a style="border-radius: 15px" class="nav-link active  btn-secondary  mr-2 " href="listaccount?roll=2" role="tab">Jobseeker</a>
                                        <a style="border-radius: 15px" class="nav-link active btn-warning"  href="listaccount?roll=3" role="tab">Employee</a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-in-card ">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">First</th>
                                                <th scope="col">Last Name</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">City Name</th>
                                                <th scope="col">Phone Number</th>
                                                <th scope="col">Date Of Birth</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="u" items="${user}">
                                                <c:if test="${u.roleId != 1}">
                                                    <tr>
                                                        <th >${u.idUser}</th>
                                                        <td>${u.firstName}</td>
                                                        <td>${u.lastName}</td>
                                                        <td>${u.email}</td>
                                                        <td>${u.cityName}</td>
                                                        <td>${u.phoneNumber}</td>
                                                        <td>${u.date}</td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <c:if test="${u.status == 'Active'}">
                                                                    <span class="badge stats-success "> ${u.status}</span>
                                                                </c:if>
                                                                <c:if test="${u.status == 'Lock'}">
                                                                    <span class="badge stats-danger"> ${u.status}</span>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <c:if test="${u.roleId != 1 && u.roleId != 3}">
                                                                <a href="#" onclick="showMess(${u.idUser}, 'Unlock', 'unlockaccount?aid=')">
                                                                    <button class="btn btn-outline-primary btn-sm" data-bs-toggle="tooltip"
                                                                            data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary"
                                                                            data-bs-title="Unlock">
                                                                        <i class="fas fa-lock-open"></i>
                                                                    </button>
                                                                </a>
                                                                <a href="#" onclick="showMess(${u.idUser}, 'Lock', 'lockaccount?aid=')">
                                                                    <button class="btn btn-outline-danger btn-sm" data-bs-toggle="tooltip"
                                                                            data-bs-placement="top" data-bs-custom-class="custom-tooltip-danger"
                                                                            data-bs-title="Lock">
                                                                        <i class="fas fa-lock"></i>
                                                                    </button>
                                                                </a>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:if>
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
                                <li class="page-item"><a class="page-link" onclick="pagingIndex(${i})">${i}</a></li>
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
                var option = confirm('Are you sure to ' + text + ' Account ID = ' + id);
                if (option === true) {
                    window.location.href = url + id;
                }
            }



            pagingIndex = (id) => {
                let url = window.location.href;
                if (url.includes("&index=")) {
                    url = url.split("&index=")[0];
                }
                window.location.href = url + "&index=" + id;
            };



        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>

    </body>

</html>