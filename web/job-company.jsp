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
        <link rel="stylesheet" href="assets/css/style_2.css">

        <style>
            .pagination-container {
                margin-top: 40px; /* Adjust the value as needed */
            }
        </style>

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

                            <h2>Jobs List By Company</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-5 pt-4">


            <div class="row">

                <c:forEach var="j" items="${jobComList}">
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card border-0 bg-light rounded shadow">
                            <div class="card-body p-4">

                                <h5>${j.title}</h5>
                                <div class="mt-3">

                                    <span class="text-muted d-block"><i class="fa fa-map-marker" aria-hidden="true"style="margin-right: 5px"></i> ${j.location}</span>
                                    <span class="text-muted d-block"><i class="zmdi zmdi-money me-2" aria-hidden="true"></i> ${j.salary} Salary</span>
                                    <span class="text-muted d-block"><i class="zmdi zmdi-time me-2" aria-hidden="true"></i>${j.yearEx} Experiences</span>


                                </div>

                                <div class="mt-3">
                                    <a href="${pageContext.request.contextPath}/jobdetails?id=${j.jobID}" class="btn btn-primary">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </c:forEach>

                <div class="col-12 mt-4 pt-2 d-block d-md-none text-center">
                    <a href="#" class="btn btn-primary">View more Jobs <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right fea icon-sm"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></a>
                </div><!--end col-->
            </div><!--end row-->

            <c:if test="${noOfPages > 1}">
                <div class="col-md-12 pagination-container">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <li class="page-item active">
                                            <form method="post" action="${pageContext.request.contextPath}/jobCompany" style="display: inline;">
                                                <input type="hidden" name="cid" value="${cid}">
                                                <input type="hidden" name="page" value="${i}">
                                                <button type="submit" class="page-link">${i}</button>
                                            </form>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <form method="post" action="${pageContext.request.contextPath}/jobCompany" style="display: inline;">
                                                <input type="hidden" name="cid" value="${cid}">
                                                <input type="hidden" name="page" value="${i}">
                                                <button type="submit" class="page-link">${i}</button>
                                            </form>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${currentPage < noOfPages}">
                                <li class="page-item">
                                    <form method="post" action="${pageContext.request.contextPath}/jobCompany" style="display: inline;">
                                        <input type="hidden" name="cid" value="${cid}">
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <button type="submit" class="page-link" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </button>
                                    </form>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </c:if>


        </div>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content">
                            <p>Copyright ? 2020 Company Name - Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></p>
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