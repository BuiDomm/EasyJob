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
        <!-- Additional CSS Files style_4 -->
        <link rel="stylesheet" href="assets/css/style_4.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/icontop.css">

        <style>
            .search-input-placeholder-black {
                width: calc(100% - 30px); /* Adjust based on icon width and padding */
                box-sizing: border-box;
                padding: 8px; /* Adjust padding as needed */
            }

            .search-1, .search-2 {
                display: flex;
                align-items: center;
            }

            .search-1 i, .search-2 i {
                margin-right: 10px; /* Adjust as needed */
            }

            .search-2-container {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .search-2 {
                flex-grow: 1;
            }

            .search-button {
                margin-left: 10px;
                padding: 8px 16px; /* Adjust padding as needed */
                background-color: #00AA00;
                color: white;
                border: none;
                cursor: pointer;
                box-sizing: border-box;
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
        <div class="page-heading about-heading header-text" style="background-image: url(assets/images/heading-3-1920x500.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <h4>Dolore doloribus sint</h4>
                            <h2>Enterprise</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="services section-background">
            <div class="container">
                <form action="searchCompany" method="POST">
                    <div class="search"> 
                        <div class="row"> 
                            <div class="col-md-6"> 
                                <div class="search-1"> 
                                    <i class='bx bx-search-alt'></i> 
                                    <input value="${cname}" name="cname" type="text" placeholder="Name Company" class="search-input-placeholder-black search-input"> 
                                </div> 
                            </div> 
                            <div class="col-md-6"> 
                                <div class="search-2-container"> 
                                    <div class="search-2"> 
                                        <i class='bx bxs-map' ></i> 
                                        <input value="${addr}" name="addr" type="text" placeholder="Location" class="search-input-placeholder-black search-input"> 
                                    </div> 
                                    <button class="search-button">Search</button> 
                                </div> 
                            </div> 
                        </div>
                    </div>
                </form>

                <!-- fix -->
                <div class="row">
                    <jsp:useBean id="comItem" class="dao.CompanyDAO" /> 
                    <c:forEach var="c" items="${companies}">
                        <c:set var="cid" value="${c.companyID}" />
                        <div class="col-md-4">
                            <div class="service-item">
                                <a href="${pageContext.request.contextPath}/jobCompany?cid=${cid}" class="services-item-image"><img style="width: 350px; height: 350px;object-fit: cover" src="${c.url}" class="img-fluid rounded" alt=""></a>


                                <div class="down-content" style="height: 219px;">
                                    <h4><i class="fa fa-briefcase"></i> <a href="${pageContext.request.contextPath}/jobCompany?cid=${cid}" style="color: #B22222">${c.nameCompany}</a></h4>
                                    <h4><i class="fa fa-map-marker"></i> <a href="${pageContext.request.contextPath}/jobCompany?cid=${cid}" style="color: #8B7765">${c.add}</a></h4>

                                    <a href="${pageContext.request.contextPath}/jobCompany?cid=${cid}" class="btn btn-primary" style="background-color: #00AA00;">${comItem.getTotalJobCompany(cid)} New Jobs</a>

                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${noOfPages > 1}">
                        <div class="col-md-12">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/companyList?page=${i}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${currentPage < noOfPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="${pageContext.request.contextPath}/companyList?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </c:if>

                </div>
            </div>
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