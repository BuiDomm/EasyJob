<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html class="menu">
    <html>

        <head>

            <meta charset="utf-8"/>
            <meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
            <meta name="google" value="notranslate"/>
            <link rel="icon" href="assets/images/android-chrome-192x192.png">
            <title>EasyJob | Details Job </title>

            <link rel="stylesheet" type="text/css" href="./assets/css/empui.css">

            <link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

            <link rel="icon" href="assets/images/favicon.ico">
            <link rel="stylesheet" href="assets/css/icontop1.css">

            <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
            <title>Easyjob | Free Job For Everyone</title>
            <!-- Bootstrap core CSS -->
            <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <!-- Additional CSS Files -->
            <link rel="stylesheet" href="assets/css/fontawesome.css">
            <link rel="stylesheet" href="assets/css/owl.css">
            <link rel="stylesheet" href="assets/css/button.css">
            <link rel="stylesheet" href="assets/css/styles.css">
            <link rel="stylesheet" href="assets/css/style.css">
            <link rel="stylesheet" href="assets/css/icontop.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">





        </head>

        <body>

            <jsp:include page="employerheader.jsp"/>
            <!-- Page Content -->
            <div class="page-heading about-heading header-text" style="background-image: url(assets/images/heading-6-1920x500.jpg);">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="text-content">
                                <h4>We are hiring for now ! </h4>

                                <h2>Security Officer - Luxury Retail</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-9 col-sm-8">
                        <div class="row">
                            <i style="font-size: 36px" class="fa fa-map-marker"></i> 
                            <i style="font-size: 16px;margin-top: 24px;">${job.location}</i>

                        </div>
                        <br/>
                        <p></p>
                        <div class="form-group">
                            <h3> <i > ${job.title}</i></h3>
                        </div>

                        <hr>

                        <ul>
                            <li>Company Name:   <b style="color: #ff6600">   ${com.nameCompany}</b></li>
                            <li>Job Position: <b>${job.category.categoryName}</b></li>
                            <li>Year Experience: <b>${job.yearEx}</b></li>
                            <li>Salary <b>${job.salary}</b></li>


                        </ul>
                    </div>



                    <div class="col-md-3 col-sm-4">
                        <div class="contact-form">
                            <div class="form-group">

                                <a style="text-align: center;" href="loadjobservlet" class="filled-button btn-block">Edit Job Information</a>
                            </div>
                        </div>

                        <div>

                            <img src="${com.url}" alt="" class="img-fluid wc-image">
                        </div>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>


            <div class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="section-heading">
                                <h2>About Job Description </h2>
                            </div>
                            <p class="col">${job.descrip}</p> 
                        </div>

                        <div class="col-md-3">
                            <div class="section-heading">
                                <h2>Contact Details</h2>
                            </div>

                            <div class="left-content">
                                <p>
                                    <span>Name</span>

                                    <br>


                                    <strong>hieu</strong>
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
                            <div class="contact-form">
                                <div class="form-group">
                                    <a style="text-align: center" href="companycontrolservlet" class="filled-button btn-block">Company Profile</a>
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
                                <p>Copyright © 2020 Company Name </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>




            <jsp:include page="employermenu.jsp"/> 





            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


            <!-- Additional Scripts -->
            <script src="assets/js/custom.js"></script>
            <script src="assets/js/owl.js"></script>
        </body>
    </html>