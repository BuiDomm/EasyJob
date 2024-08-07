<%-- 
    Document   : listcvapplied
    Created on : May 27, 2024, 4:59:51 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="assets/images/android-chrome-192x192.png">
        <title>EasyJob | Free Job For Everyone</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="assets/css/icontop.css">

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/cvapplied.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    </head>
    <jsp:include page="header.jsp"/>


    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <body>

        <%
  Boolean isVerifiedd = (Boolean) request.getAttribute("successfully");
  if (isVerifiedd == null) {
      isVerifiedd = false;
  }
            
        %>
        <script>
            var isVerifiedParam = <%= isVerifiedd %>;
            console.log(isVerifiedParam);
            if (isVerifiedParam) {
                toastr.success("Successfully withdraw your CV and apply for a job!", "Easyjob Notice", {
                    timeOut: 2000,
                });

            }

        </script>


        <div class="container">
            <div style="height: 150px;width: 100%;"></div>

            <h3>Job Apllied</h3>
            <hr>
            <div class="jobs-list-container">
                <h2 style="margin-bottom: 25px">You have applied to ${fn:length(list)} jobs</h2>

                <form method="get" action="searchjobapplied">
                    <input class="job-search" type="text" name="keyword" placeholder="Search here..." />
                </form>


                <div class="jobs">


                    <c:forEach items="${list}" var="i">

                        <div class="job">
                            <!--<img src="images/software-engineer.svg">de anh o day -->
                            <svg width="66" height="66" viewBox="0 0 66 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect width="66" height="66" rx="16" fill="#083D77"/>
                            <path d="M49 21C49 16.664 41.674 13 33 13C24.326 13 17 16.664 17 21V25C17 29.336 24.326 33 33 33C41.674 33 49 29.336 49 25V21ZM33 47C24.326 47 17 43.336 17 39V45C17 49.336 24.326 53 33 53C41.674 53 49 49.336 49 45V39C49 43.336 41.674 47 33 47Z" fill="#A2E3FF"/>
                            <path d="M49 29C49 33.336 41.674 37 33 37C24.326 37 17 33.336 17 29V35C17 39.336 24.326 43 33 43C41.674 43 49 39.336 49 35V29Z" fill="#A2E3FF"/>
                            </svg>


                            <h3 class="job-title ">${i.job.category.categoryName}</h3>
                            <div class="details">${i.job.title}</div>
                            <div class="details">Company: ${i.job.company.nameCompany}</div>
                            <div class="">Date Apply: ${i.applicationDate}</div>
                            <a href="jobdetails?id=${i.job.jobID}" class="details-btn">More Details</a>
                            <span class="open-positions" 
                                  style="color:
                                  <c:choose>
                                      <c:when test="${i.status == 'Accept'}">green</c:when>
                                      <c:when test="${i.status == 'Reject'}">red</c:when>
                                      <c:otherwise>#ddd</c:otherwise>
                                  </c:choose>;">
                                Status: ${i.status}
                            </span>
                        </div>


                    </c:forEach>


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
