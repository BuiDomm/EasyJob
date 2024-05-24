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

        <title>PHPJabbers.com | Free Job Agency Website Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/icontop.css">




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
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h2>Jobs</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="products">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="contact-form">
                            <form action="#">
                                <h5 style="margin-bottom: 15px">Type</h5>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Contract (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Full time (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Internship (5)</small>
                                    </label>
                                </div>

                                <br>

                                <h5 style="margin-bottom: 15px">Category</h5>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Accounting / Finance / Insurance Jobs (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Accounting / Finance / Insurance Jobs (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Accounting / Finance / Insurance Jobs (5)</small>
                                    </label>
                                </div>

                                <br>

                                <h5 style="margin-bottom: 15px">Career levels</h5>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Entry Level (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Entry Level (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Entry Level (5)</small>
                                    </label>
                                </div>

                                <br>

                                <h5 style="margin-bottom: 15px">Education levels</h5>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Associate Degree (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Associate Degree (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>Associate Degree (5)</small>
                                    </label>
                                </div>

                                <br>


                                <h5 style="margin-bottom: 15px">Years of experience</h5>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>&lt; 1 (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>&lt; 1 (5)</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="checkbox">

                                        <small>&lt; 1 (5)</small>
                                    </label>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="row">
                            <c:forEach var="item" items="${listjob}" >
                                <div class="col-md-6">
                                    <div class="product-item">
                                        <a href="jobdetails?id=${item.jobID}"><img src="assets/images/product-1-370x270.jpg" alt=""></a>
                                        <div class="down-content">
                                            <a href="jobdetails?id=${item.jobID}"><h4>${item.title}</h4></a>

                                            <h6>Salary: ${item.salary}</h6>

                                            <h4><small><i class="fa fa-briefcase"></i> ${item.category.categoryName}<br> <strong><i class="fa fa-building"></i> Ten Cong Ty</strong></small></h4>

                                            <small>
                                                <strong title="Posted on">Years of Experience: ${item.yearEx}</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                                <!--<strong title="Type"><i class="fa fa-file"></i> Contract</strong> &nbsp;&nbsp;&nbsp;&nbsp;-->
                                                <br>
                                                <strong title="Location"> <i class="fa fa-map-marker"></i>&nbsp; ${item.location}</strong>
                                            </small>
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>

                            <div class="col-md-12">
                                <ul class="pages">

                                    <jsp:useBean id="pagenum" class="dao.JobDAO" /> 

                                    <c:forEach begin="1" end="${pagenum.pageNumber}" var="i"> 
                                        <li class="active">
                                            <a href="paging?id=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li><a href="#!"><i class="fa fa-angle-double-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
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

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Book Now</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="contact-form">
                            <form action="#" id="contact">
                                <div class="row">
                                    <div class="col-md-6">
                                        <fieldset>
                                            <input type="text" class="form-control" placeholder="Pick-up location" required="">
                                        </fieldset>
                                    </div>

                                    <div class="col-md-6">
                                        <fieldset>
                                            <input type="text" class="form-control" placeholder="Return location" required="">
                                        </fieldset>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <fieldset>
                                            <input type="text" class="form-control" placeholder="Pick-up date/time" required="">
                                        </fieldset>
                                    </div>

                                    <div class="col-md-6">
                                        <fieldset>
                                            <input type="text" class="form-control" placeholder="Return date/time" required="">
                                        </fieldset>
                                    </div>
                                </div>
                                <input type="text" class="form-control" placeholder="Enter full name" required="">

                                <div class="row">
                                    <div class="col-md-6">
                                        <fieldset>
                                            <input type="text" class="form-control" placeholder="Enter email address" required="">
                                        </fieldset>
                                    </div>

                                    <div class="col-md-6">
                                        <fieldset>
                                            <input type="text" class="form-control" placeholder="Enter phone" required="">
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary">Book Now</button>
                    </div>
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
