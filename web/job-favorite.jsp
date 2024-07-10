<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="assets/css/button.css">

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
              integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />

        <title>PHPJabbers.com | Free Job Agency Website Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/style_1.css">

        <!-- Toastr Notification Styles -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
        <jsp:include page="header.jsp"/>

        <!-- Page Content -->
        <div class="page-heading about-heading header-text" style="background-image: url(assets/images/heading-6-1920x500.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">

                            <h2>Favorite Jobs</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="products">
            <div class="container">
                <div class="row">   

                    <c:forEach var="item" items="${jobsFavorite}" >
                        <div class="filter-result">

                            <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                <div class="job-left my-4 d-md-flex align-items-center flex-wrap">

                                    <div class="job-content">
                                        <h5 class="text-center text-md-start">${item.title}</h5>
                                        <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                            <li class="me-md-4">
                                                <i class="zmdi zmdi-pin me-2"></i> ${item.location}
                                            </li>
                                            <li class="me-md-4">
                                                <i class="zmdi zmdi-money me-2"></i> ${item.salary} Salary   
                                            </li>
                                            <li class="me-md-4">
                                                <i class="zmdi zmdi-time me-2"></i> ${item.yearEx} Experience
                                            </li>
                                            <li class="me-md-4">
                                                <i class="zmdi zmdi-city-alt"></i> ${item.companyName} Company
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- ... -->
                                <div class="job-right my-4 flex-shrink-0">
                                    <c:choose>
                                        <c:when test="${item.status ne 'Expire'}">
                                            <a href="jobdetails?id=${item.id}" class="btn d-block w-100 d-sm-inline-block btn-light">Detail now</a>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="btn d-block w-100 d-sm-inline-block btn-light disabled">Detail now</span>
                                            <div class="text-danger">This job has expired.</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <!-- ... -->
                                <div class="job-right my-4 flex-shrink-0">
                                    <button class="btn d-block w-100 d-sm-inline-block btn-light delete-favorite-btn" data-uid="${sessionScope.account.idUser}" data-jid="${item.id}">Delete</button>
                                </div>
                            </div>

                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <p>Copyright © 2020 Company Name - Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>

        <!-- Toastr Notification Scripts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <script>
            $(document).ready(function () {
                $(".delete-favorite-btn").click(function (event) {
                    event.preventDefault();
                    var userId = $(this).data("uid");
                    var jobId = $(this).data("jid");
                    var jobBox = $(this).closest(".job-box");

                    $.ajax({
                        url: "${pageContext.request.contextPath}/deleteFavoriteJobServlet",
                        type: "POST",
                        data: {uid: userId, jid: jobId},
                        success: function (response) {
                            if (response.success) {
                                toastr.success("Deleted Job Successfully!", "Easyjob Notice", {
                                    timeOut: 2000,
                                });
                                jobBox.remove(); // xoa job 
                            } else {
                                toastr.error("Failed to Delete Job.", "Easyjob Notice", {
                                    timeOut: 2000,
                                });
                            }
                        },
                        error: function () {
                            toastr.error("Failed to Delete Job.", "Easyjob Notice", {
                                timeOut: 2000,
                            });
                        }
                    });
                });
            });
        </script>
    </body>

</html>
