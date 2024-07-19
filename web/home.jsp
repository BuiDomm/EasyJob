<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <link rel="icon" href="assets/images/android-chrome-192x192.png">
        <title>EasyJob | Free Job For Everyone</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">

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

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Page Content -->
            <!-- Banner Starts Here -->
            <div class="banner header-text">
                <div class="owl-banner owl-carousel">
                    <div class="banner-item-01">
                        <div class="text-content">
                            <h4>Find your car today!</h4>
                            <h2>Lorem ipsum dolor sit amet</h2>
                        </div>
                    </div>
                    <div class="banner-item-02">
                        <div class="text-content">
                            <h4>Fugiat Aspernatur</h4>
                            <h2>Laboriosam reprehenderit ducimus</h2>
                        </div>
                    </div>
                    <div class="banner-item-03">
                        <div class="text-content">
                            <h4>Saepe Omnis</h4>
                            <h2>Quaerat suscipit unde minus dicta</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Banner Ends Here -->

            <div class="latest-products">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-heading">
                                <h2>Featured Jobs</h2>
                                <a href="paging?id=1">view more <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>


                    <jsp:useBean id="jobItem" class="dao.JobDAO" /> 
                    <jsp:useBean id="comItem" class="dao.CompanyDAO" /> 
                    <c:set var="counter" value="0" />
                    <c:forEach  items="${jobItem.top3Succes}" var="item">

                        <div class="col-md-4">
                            <div class="product-item">
                                <a href="jobdetails?id=${item.jobID}"><img  style="width: 370px;height: 270px;object-fit: cover" src="${comItem.top3.get(counter).url}" alt=""></a>
                                <div class="down-content">
                                    <a href="job-details.jsp"><h4>${item.title}</h4></a>

                                    <i>Salary: </i> <h6 style="display: inline">${item.salary}</h6>

                                    <h4><small><i class="fa fa-briefcase"></i>  ${item.category.categoryName} <br> <strong><i class="fa fa-building"></i>${item.company.nameCompany}</strong></small></h4>

                                    <small>
                                        <strong title="Posted on"><i class="fa fa-calendar"></i> ${item.date}</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                        <strong title="Location"><i class="fa fa-map-marker"></i> ${item.location}</strong>
                                    </small>
                                </div>
                            </div>
                        </div>
                        <c:set var="counter" value="${counter + 1}" />
                    </c:forEach>  

                </div>
            </div>
        </div>

        <div class="best-features">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>About Us</h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-content">
                            <p>Lorem ipsum dolor sit amet, <a href="#">consectetur</a> adipisicing elit. Explicabo, esse consequatur alias repellat in excepturi inventore ad <a href="#">asperiores</a> tempora ipsa. Accusantium tenetur voluptate labore aperiam molestiae rerum excepturi minus in pariatur praesentium, corporis, aliquid dicta.</p>
                            <ul class="featured-list">
                                <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                                <li><a href="#">Consectetur an adipisicing elit</a></li>
                                <li><a href="#">It aquecorporis nulla aspernatur</a></li>
                                <li><a href="#">Corporis, omnis doloremque</a></li>
                            </ul>
                            <a href="about-us.jsp" class="filled-button">Read More</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-image">
                            <img src="assets/images/about-1-570x350.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="services" style="background-image: url(assets/images/other-image-fullscren-1-1920x900.jpg);" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Latest blog posts</h2>

                            <a href="blog.jsp">read more <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <a href="#" class="services-item-image"><img src="assets/images/blog-1-370x270.jpg" class="img-fluid" alt=""></a>

                            <div class="down-content">
                                <h4><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit hic</a></h4>

                                <p style="margin: 0;"> John Doe &nbsp;&nbsp;|&nbsp;&nbsp; 12/06/2020 10:30 &nbsp;&nbsp;|&nbsp;&nbsp; 114</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <a href="#" class="services-item-image"><img src="assets/images/blog-2-370x270.jpg" class="img-fluid" alt=""></a>

                            <div class="down-content">
                                <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit</a></h4>

                                <p style="margin: 0;"> John Doe &nbsp;&nbsp;|&nbsp;&nbsp; 12/06/2020 10:30 &nbsp;&nbsp;|&nbsp;&nbsp; 114</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <a href="#" class="services-item-image"><img src="assets/images/blog-3-370x270.jpg" class="img-fluid" alt=""></a>

                            <div class="down-content">
                                <h4><a href="#">Aperiam modi voluptatum fuga officiis cumque</a></h4>

                                <p style="margin: 0;"> John Doe &nbsp;&nbsp;|&nbsp;&nbsp; 12/06/2020 10:30 &nbsp;&nbsp;|&nbsp;&nbsp; 114</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="services" style="background-image: url(assets/images/company1.jpg);" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2 style="color: #000">Company</h2>

                            <a href="${pageContext.request.contextPath}/companyList">read more <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <c:forEach  items="${comItem.threeFirstCompany}" var="item"> 
                        <div class="col-lg-4 col-md-6">
                            <div class="service-item">
                                <c:set var="cid" value="${item.companyID}" />
                                <a href="#" class="services-item-image"><img style="width: 350px; height: 293px; object-fit: cover" src="${item.url}" class="img-fluid" alt=""></a>

                                <div class="down-content" style="height: 219px">


                                    <h4><i class="fa fa-briefcase"></i> <a href="${pageContext.request.contextPath}/companyList" style="color: #B22222">${item.nameCompany}</a></h4>
                                    <h4><i class="fa fa-map-marker"></i> <a href="${pageContext.request.contextPath}/companyList" style="color: #8B7765">${item.add}</a></h4>

                                    <a href="${pageContext.request.contextPath}/jobCompany?cid=${cid}" class="btn btn-primary" style="background-color: #00AA00;">${comItem.getTotalJobCompany(cid)} New Jobs</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </div>


        <div class="call-to-action">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <div class="row">
                                <div class="col-md-8">
                                    <h4>Lorem ipsum dolor sit amet, consectetur adipisicing.</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque corporis amet elite author nulla.</p>
                                </div>
                                <div class="col-lg-4 col-md-6 text-right">
                                    <a href="contact.jsp" class="filled-button">Contact Us</a>
                                </div>
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
                            <p>Copyright © 2024 - Summer 2024 FPTU SWP </a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script>

            handleDisplayBox = () => {
                var element = document.getElementById("boxNotification");
                element.classList.toggle("d-block");
            };


        </script>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>
</html>