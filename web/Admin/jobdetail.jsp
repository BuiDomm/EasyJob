<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">x
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">

        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
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
                                <a class="dropdown-item" href="changepass.jsp">Change Password</a>
                                 <a class="dropdown-item" href="loginjobseeker">Logout</a>
                            </div>
                        </div>
                    </div>
                </header>
                <main class="dash-content" style="padding-top: 0 !important;">
                    <div class="container-fluid" >
                        <div class="products">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-9 col-sm-8">
                                        <p class="lead">
                                            <i class="fa fa-map-marker"></i> <i>${cc.location}</i> &nbsp;&nbsp;
                                            <i class="fa fa-calendar"></i> ${cc.date} &nbsp;&nbsp;
                                            <i class="fa fa-file"></i> Contract
                                        </p>
                                        <br/>
                                        <p>${cc.descrip}</p>
                                        <br/>
                                        <div class="form-group">
                                            <h5>Job title: <i>${cc.title}</i></h5>
                                        </div>

                                        <hr>
                                        <h5 style="margin-bottom: 5px">*Conditions met</h5>
                                        <ul>
                                            <li>Ten Cong Ty: <b>ABC</b></li>
                                            <li>Job Position: <b>${cc.category.categoryName}</b></li>
                                            <li>Year Experience: <b>${cc.yearEx}</b></li>
                                            <li>Salary <b>${cc.salary}</b></li>
                                            <li>Location: <b>${cc.location}</b></li>

                                        </ul>
                                    </div>



                                    <div class="col-md-3 col-sm-4">

                                        <div>
                                            <img style="width: 255px;height: 186px;object-fit: cover" src="${com.url}" alt="" class="img-fluid wc-image">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="section-heading">
                                            <h2>About Cannon Guards Security ltd</h2>
                                        </div>

                                        <p class="lead">
                                            <i class="fa fa-map-marker">&nbsp;${cc.location}</i> 
                                        </p>

                                        <p>Looking to improve the security at your place of business? If so, we will provide you with the trained security officers and professionally licensed personnel needed for any business. From a security guard for construction site security to private event security, you can be sure to get the very best from our staff. Alternatively we provide tailor-made security guard training for your existing security staff.</p>
                                        <br>
                                        <p>Looking to improve the security at your place of business? If so, we will provide you with the trained security officers and professionally licensed personnel needed for any business. From a security guard for construction site security to private event security, you can be sure to get the very best from our staff. Alternatively we provide tailor-made security guard training for your existing security staff.</p>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="section-heading">
                                            <h2>Contact Details</h2>
                                        </div>

                                        <div class="left-content">
                                            <p>
                                                <span>Name</span>

                                                <br>


                                                <strong>${u.firstName} ${u.lastName}</strong>
                                            </p>

                                            <p>
                                                <span>Phone</span>

                                                <br>

                                                <strong>

                                                    <a href="tel:${not empty u.phoneNumber ? u.phoneNumber : ""}">${not empty u.phoneNumber ? u.phoneNumber : "Unknow"}</a>

                                                </strong>
                                            </p>

                                            <p>
                                                <span>Mobile phone</span>

                                                <br>


                                                <strong>

                                                    <a href="tel:${not empty u.phoneNumber ? u.phoneNumber : ""}">${not empty u.phoneNumber ? u.phoneNumber : "Unknow"}</a>
                                                </strong>
                                            </p>
                                            <p>
                                                <span>Email</span>
                                                <br>
                                                <strong>
                                                    <a href="mailto:${u.email}">${u.email}</a>
                                                </strong>
                                            </p>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-end">

                            <c:if test="${hidenButton != 'rejectButton'}">
                                <div class="col-2">
                                    <a onclick="showMess('${jobid}',
                                                    'adminRejectJob?jobId=', '${cc.title}', '${u.firstName} ${u.lastName}', 'reject')"  
                                       class="btn btn-block btn-danger btn-md">Reject Jobs</a>
                                </div>
                            </c:if>


                            <c:if test="${hidenButton != 'activeButton'}">
                                <div class="col-2">

                                    <a onclick="showMess('${jobid}',
                                                    'adminAcceptJob?jobId=', '${cc.title}', '${u.firstName} ${u.lastName}', 'accept')"  
                                       class="btn btn-block btn-success btn-md">Accept Jobs</a>
                                </div>

                            </c:if>



                        </div>

                    </div>
                </main>
            </div>
        </div>
        <script> function showMess(id, url, title, name, key) {
                if (key === "reject") {
                    var option = confirm('Are you sure you want to ' + key + ' this Job?\n' +
                            'Title: ' + title + '\n' +
                            'Account name: ' + name);
                    if (option === true) {
                        window.location.href = url + id;
                    }
                } else if (key === "accept") {
                    var option = confirm('Are you sure you want to ' + key + ' this Job?\n' +
                            'Title: ' + title + '\n' +
                            'Account name: ' + name);
                    if (option === true) {
                        window.location.href = url + id;
                    }
                }
            }</script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>
    </body>

</html>
