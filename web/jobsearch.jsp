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
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/style.css">

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
                            <form action="searchAndFilter">

                                <h5 style="margin: 15px 0">Title</h5>
                                <div class="search-form">
                                    <label>
                                        <input type="text" name="search" value="${txt}" >
                                    </label>
                                </div>



                                <h5 style="margin: 15px 0">Company</h5>

                                <div class="search-form">
                                    <label>
                                        <input type="text" name="company" value="${company}"  >    
                                    </label>
                                </div>





                                <br>

                                <h5 style="margin-bottom: 15px">Category</h5>

                                <select name="category">
                                    <option  value="0">Select Category</option>
                                    <c:forEach var="c" items="${listCategory}" >
                                        <option  value="${c.categoryID}" ${(c.categoryID == category) ? 'selected' : ''}>${c.categoryName}</option>
                                    </c:forEach>
                                </select>

                                <br>

                                <h5 style="margin-bottom: 15px">Location</h5>

                                <select name="location">
                                    <option value="">Select Location</option>
                                    <c:forEach var="l" items="${listLocation}">
                                        <option value="${l.location}" ${(l.location == location) ? 'selected' : ''}>${l.location}</option>
                                    </c:forEach>
                                </select>


                                <br>


                                <h5 style="margin-bottom: 15px">Salary</h5>


                                <div>
                                    <label>
                                        <input name="salary" value="2000" type="radio" ${(salary == 2000) ? 'checked' : ''} >

                                        <small>< 2000</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input name="salary" value="3000" type="radio" ${(salary == 3000) ? 'checked' : ''}>

                                        <small>2000 - 4000</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input name="salary" value="4000" type="radio" ${(salary == 4000) ? 'checked' : ''}>

                                        <small>> 4000</small>
                                    </label>
                                </div>

                                <br>



                                <h5 style="margin-bottom: 15px">Years of experience</h5>

                                <div>
                                    <label>
                                        <input name="year" value="1" type="radio" ${(year == 1) ? 'checked' : ''}>

                                        <small value="1">< 1 Year</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input  name="year" value="2" type="radio" ${(year == 2) ? 'checked' : ''}>

                                        <small>1 - 2 Year</small>
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input  name="year" value="3" type="radio" ${(year == 3) ? 'checked' : ''}>

                                        <small>> 3 Year</small>
                                    </label>
                                </div>

                                <button type="submit" class="text-white w-100 p-lg-1" style="background-color: #ff6600; border: none">submit</button>
                            </form>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="row">
                            <c:forEach var="item" items="${listjob}" >
                                <div class="col-md-4">
                                    <div class="product-item">
                                        <a href="jobdetails?id=${item.jobID}"><img src="./${dao.companyByJobId(item.jobID).url}" alt=""></a>
                                        <div class="down-content">
                                            <a href="./jobdetails?id=${item.jobID}"><h4>${item.title}</h4></a>

                                            <h6>Salary: ${item.salary}</h6>

                                            <h4><small><i class="fa fa-briefcase"></i> ${item.category.categoryName}<br> <strong><i class="fa fa-building"></i>${item.company.nameCompany}</strong></small></h4>

                                            <small>
                                                <strong title="Posted on">Years of Experience: ${item.yearEx}</strong> 
                                                <!--<strong title="Type"><i class="fa fa-file"></i> Contract</strong> &nbsp;&nbsp;&nbsp;&nbsp;-->
                                                <br>
                                                <strong title="Location"> <i class="fa fa-map-marker"></i>&nbsp; ${item.location}</strong>
                                            </small>
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>

                            <div class="col-md-12">
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

        <script>

                                                pagingIndex = (id) => {
                                                    let url = window.location.href;
                                                    if (url.includes("&index=")) {
                                                        url = url.split("&index=")[0];
                                                    }
                                                    window.location.href = url + "&index=" + id;
                                                };
        </script>
        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>

</html>
