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
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css" integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/css/icontop.css">

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/cvapplied.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css" integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>


    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <%
Boolean isVerified = (Boolean) request.getAttribute("successfully");
Boolean isVerified1 = (Boolean) request.getAttribute("successfully1");

if (isVerified == null) {
isVerified = false;
}
if (isVerified1 == null) {
isVerified = false;
}
            
    %>
    <script>

        var isVerifiedParam = <%= isVerified %>;
        console.log(isVerifiedParam);
        if (isVerifiedParam) {
            toastr.success("Created Job Is Successfully!!!", "Easyjob Notice", {
                timeOut: 2000,
            });

        }


        var isVerifiedParam1 = <%= isVerified1 %>;
        console.log(isVerifiedParam1);
        if (isVerifiedParam1) {
            toastr.success("Delete Job Is Successfully!!!", "Easyjob Notice", {
                timeOut: 2000,
            });

        }

    </script>

    <body>
        <jsp:include page="headeremp.jsp"/>

        <div class="container">
            <div style="height: 150px;width: 100%;"></div>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

            <hr>
            <div class="jobs-list-container">
                <h2 style="margin-bottom: 25px">Job applications you've created: </h2>
                <c:if test="${job !=null}">
                    <div style="border-color: green; position: relative" class="job">
                        <!--<img src="images/software-engineer.svg">de anh o day -->
                        <svg width="66" height="66" viewBox="0 0 66 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect width="66" height="66" rx="16" fill="#083D77"/>
                        <path d="M49 21C49 16.664 41.674 13 33 13C24.326 13 17 16.664 17 21V25C17 29.336 24.326 33 33 33C41.674 33 49 29.336 49 25V21ZM33 47C24.326 47 17 43.336 17 39V45C17 49.336 24.326 53 33 53C41.674 53 49 49.336 49 45V39C49 43.336 41.674 47 33 47Z" fill="#A2E3FF"/>
                        <path d="M49 29C49 33.336 41.674 37 33 37C24.326 37 17 33.336 17 29V35C17 39.336 24.326 43 33 43C41.674 43 49 39.336 49 35V29Z" fill="#A2E3FF"/>
                        </svg>

                        <h3 class="job-title ">${job.category.categoryName}</h3>
                        <div class="details">Title: &nbsp; ${job.title}</div>
                        <div class="details">Company: ${job.company.nameCompany}</div>
                        <a href="jobdetailemployeer?id=${job.jobID}" class="details-btn">More Details</a>

                        <c:if test=" ${job.status == 'Accept'}">
                            <span style="color: green;" class="open-positions">Status: ${job.status}</span> 
                        </c:if>

                        <c:if test=" ${job.status != 'Accept'}"> <a href="deletejob?id=${job.jobID}"><i style="color: red; font-size: 20px;position: absolute;top: 10px;right: 10px" class="fas fa-window-close"></i></a>
                            </c:if>
                    </div>
                </c:if>
                <hr>
                <div class="jobs">

                    <c:forEach items="${list}" var="i">
                        <c:if test="${i.status != 'Expire'}">

                            <div class="job" style="position: relative">
                                <!--<img src="images/software-engineer.svg">de anh cong ty o day -->
                                <svg width="66" height="66" viewBox="0 0 66 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect width="66" height="66" rx="16" fill="#083D77"/>
                                <path d="M49 21C49 16.664 41.674 13 33 13C24.326 13 17 16.664 17 21V25C17 29.336 24.326 33 33 33C41.674 33 49 29.336 49 25V21ZM33 47C24.326 47 17 43.336 17 39V45C17 49.336 24.326 53 33 53C41.674 53 49 49.336 49 45V39C49 43.336 41.674 47 33 47Z" fill="#A2E3FF"/>
                                <path d="M49 29C49 33.336 41.674 37 33 37C24.326 37 17 33.336 17 29V35C17 39.336 24.326 43 33 43C41.674 43 49 39.336 49 35V29Z" fill="#A2E3FF"/>
                                </svg>

                                <h3 class="job-title ">${i.category.categoryName}</h3>
                                <div class="details">Title:&nbsp;${i.title}</div>
                                <div class="details">Company: ${i.company.nameCompany}</div>
                                <a href="jobdetailemployeer?id=${i.jobID}" class="details-btn">More Details</a>
                                <c:if test="${i.status == 'Accept'}">
                                    <span style="color: green;" class="open-positions">Status: ${i.status}</span> 
                                </c:if>
                                <c:if test="${i.status == 'Pending'}">
                                    <span style="color: #bbb;" class="open-positions">Status: ${i.status}</span> 
                                </c:if>
                                <c:if test="${i.status == 'Reject'}">
                                    <span style="color: red;" class="open-positions">Status: ${i.status}</span> 
                                </c:if>

                                <c:if test="${i.status != 'Accept' && i.status != 'Expire'}">
                                    <a href="deletejob?id=${i.jobID}"><i style="color: red; font-size: 20px;position: absolute;top: 10px;right: 10px" class="fas fa-window-close"></i></a>
                                </c:if>
                            </div>
                        </c:if>

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
