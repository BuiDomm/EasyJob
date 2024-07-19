<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>

<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/images/android-chrome-192x192.png">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <title>Easyjob | Free Job For Everyone</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
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
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="home">
                        <figure style="width: 55px;height: 55px;">
                            <img style="height: 100%;width: 100%;object-fit: cover;" src="./assets/images/easyjobb.png" alt="alt"/>
                        </figure>
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="home">Home
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li> 
                            <li class="nav-item"><a class="nav-link" href="paging?id=1">Jobs</a></li>

                            <li class="nav-item"><a class="nav-link" href="about-us.jsp">About us</a></li>

                            <li class="nav-item"><a class="nav-link" href="blogs">Blog</a></li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">More</a>

                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="team.jsp">Team</a>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/companyList">Enterprise</a>
                                    <a class="dropdown-item" href="terms.jsp">Terms</a>
                                </div>
                            </li>

                            <li class="nav-item"><a class="nav-link" href="managerblog">Manager Blog</a></li>



                        </ul>
                        <div style="display: flex;align-items: center;margin-left: 75px;">
                            <div style="display: flex;max-height: 45px;margin-bottom: 15px;">
                                <a style="--clr:#ff6600" class="button" href="login.jsp">
                                    <span class="button__icon-wrapper">
                                        <svg width="10" class="button__icon-svg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 15">
                                        <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                        </svg>

                                        <svg class="button__icon-svg  button__icon-svg--copy" xmlns="http://www.w3.org/2000/svg" width="10" fill="none" viewBox="0 0 14 15">
                                        <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                        </svg>
                                    </span>
                                    Find A Job
                                </a>

                            </div>
                            <div style="display: flex;max-height: 45px;margin-bottom: 15px; margin-left: 20px">
                                <a style="--clr:#7808d0 " class="button" href="loginemployeer.jsp">
                                    <span class="button__icon-wrapper">
                                        <svg width="10" class="button__icon-svg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 15">
                                        <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                        </svg>

                                        <svg class="button__icon-svg  button__icon-svg--copy" xmlns="http://www.w3.org/2000/svg" width="10" fill="none" viewBox="0 0 14 15">
                                        <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                        </svg>
                                    </span>
                                    Post A Job
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <!-- Banner Starts Here -->
        <div class="banner header-text">
            <div class="owl-banner owl-carousel">
                <div class="banner-item-01">
                    <div class="text-content">
                        <h4>Find your job today!</h4>
                        <h2>Good jobs are here</h2>
                    </div>
                </div>
                <div class="banner-item-02">
                    <div class="text-content">
                        <h4>Jobs of your choice</h4>
                        <h2>Good job with good salary</h2>
                    </div>
                </div>
                <div class="banner-item-03">
                    <div class="text-content">
                        <h4>Everything is free</h4>
                        <h2>Easy to find a job without losing money</h2>
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
                                <a href="jobdetails?id=${item.jobID}"><img style="width: 350px;height: 270px;object-fit: cover" src="${comItem.top3.get(counter).url}" alt=""></a>
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

                            <a href="blogs">View All<i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>

                    <jsp:useBean id="blogItem" class="dao.BlogDAO" /> 
                     <c:forEach  items="${blogItem.top3Blogs}" var="blogs">
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item">
                            <a href="blogDetails?bid=${blogs.blogId}" class="services-item-image"><img src="assets/blog/${blogs.image}" style="width: 350px; height: 293px; object-fit: cover" class="img-fluid" alt=""></a>

                            <div class="down-content">
                                <h4><a href="#">${blogs.title}</a></h4>

                                <p style="margin: 0;"><i class="zmdi zmdi-favorite"></i> ${blogs.nLike} Likes &nbsp;&nbsp;|&nbsp;&nbsp;<i class="zmdi zmdi-border-color"></i> ${blogs.nCmt} Comments &nbsp;&nbsp;|&nbsp;&nbsp;</p>
                                <p style="margin: 0;"><i class="zmdi zmdi-calendar-alt"></i> ${blogs.date} Publish Date</p>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                    
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
    </body>
</html>