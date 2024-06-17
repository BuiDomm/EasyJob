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
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  
    </head>
    <style>
        .responsive-nav {
            width: 50%;
        }
        @media (max-width: 1440px) {
            .responsive-nav {
                width: 50%;
            }
        }
        @media(max-width: 1920px) {
            .responsive-nav {
                width: 35%;
            }
        }
    </style>
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
        <c:set var="hasNonExpiredJob" value="false" />
        <c:forEach items="${list}" var="job">
            <c:if test="${job.status != 'Expire'}">
                <c:set var="hasNonExpiredJob" value="true" />
            </c:if>
        </c:forEach>
        <jsp:include page="headeremp.jsp"/>
        <c:if test="${empty list}">
            <div class="container-fluid mt-5">

                <div class="jumbotron text-center">
                    <h1 class="mb-3">No Job has been created!</h1>
                    <p><a class="mt-2 filled-button btn-block col-lg-5" href="createjob?id=${sessionScope.account.idUser}" role="button">Create your First Job !</a></p>
                </div>

            </div>
        </c:if>
        <div class="container">
            <div class="jobs-list-container">
                <c:if test="${job !=null}">
                    <h3 class="mb-3 text-warning">A new job has been created!</h3>
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
                        <div class="details text-primary font-italic">Date: ${job.date}</div>
                        <a href="jobdetailemployeer?id=${job.jobID}" class="details-btn">More Details</a>
                        <c:if test=" ${job.status == 'Accept'}">
                            <span style="color: green;" class="open-positions">Status: ${job.status}</span> 
                        </c:if>
                        <c:if test=" ${job.status != 'Accept'}">

                            <a onclick="handlerDeleteJob(${job.jobID})" href="#!"><i style="color: red; font-size: 20px;position: absolute;top: 10px;right: 10px" class="fas fa-window-close"></i></a>

                            </c:if>
                    </div>
                </c:if>
            </div>
        </div>



        <c:if test="${not empty list && hasNonExpiredJob}">
            <div style="padding-left: 120px;padding-right: 120px" class="container mt-3">
                <div  class="container p-5">
                    
                    <a href="manageskilltest">  
                        
                        <div style="border-radius: 24px" class="bg-dark text-center mx-5 py-3">
                            <h2 class="text-light text-uppercase">Skill Test Manage</h2>
                           
                            <p class="text-light">For Employer here</p>
                        </div>
                    </a> 
                </div>
                <hr> 
                <!-- Filter list start -->        

                <div style="border-radius: 15px; background-color:#f3f3f4;box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);" class="container mt-5 p-4 ">

                    <h3 class="mb-3">Job Post Tabs</h3>
                    <!-- Nav tabs -->


                    <ul style="border-radius: 15px;background-color: white;z-index: 10;margin: auto" class="row nav position-absolute responsive-nav" id="myTab" role="tablist">


                        <li  class="nav-item col p-3 text-center">
                            <a style="border-radius: 15px" class="nav-link active btn-success "data-toggle="tab" href="#accept" role="tab" >Job Accept</a>
                        </li>

                        <li class="nav-item col p-3 text-center">
                            <a style="border-radius: 15px" class="nav-link btn-danger"data-toggle="tab" href="#reject" role="tab">Job Reject</a>
                        </li>

                        <li  class="nav-item col p-3 text-center">
                            <a style="border-radius: 15px" class="nav-link btn-secondary"data-toggle="tab" href="#pending" role="tab">Job Pending</a>
                        </li>

                    </ul>


                    <!-- Tab panes -->
                    <div style="border-radius: 15px;background-color: white" class="tab-content p-3 position-relative mt-5" id="myTabContent">
                        <div class=" tab-pane fade show active mt-5 " id="accept" role="tabpanel" aria-labelledby="home-tab">

                            <div  style="overflow-x: auto;white-space: nowrap"class="jobs-list-container ">
                                <div  class="jobs d-flex flex-nowrap">
                                    <c:forEach items="${acceptlist}" var="i">
                                        <c:if test="${i.status != 'Expire'}">
                                            <div style="min-width: 250px;max-width: 300px;margin-right: 20px;" class="job bg-white position-relative">
                                                <!--<img src="images/software-engineer.svg">de anh cong ty o day -->   
                                                <svg width="66" height="66" viewBox="0 0 66 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <rect width="66" height="66" rx="16" fill="#083D77"/>
                                                <path d="M49 21C49 16.664 41.674 13 33 13C24.326 13 17 16.664 17 21V25C17 29.336 24.326 33 33 33C41.674 33 49 29.336 49 25V21ZM33 47C24.326 47 17 43.336 17 39V45C17 49.336 24.326 53 33 53C41.674 53 49 49.336 49 45V39C49 43.336 41.674 47 33 47Z" fill="#A2E3FF"/>
                                                <path d="M49 29C49 33.336 41.674 37 33 37C24.326 37 17 33.336 17 29V35C17 39.336 24.326 43 33 43C41.674 43 49 39.336 49 35V29Z" fill="#A2E3FF"/>
                                                </svg>
                                                <h3 class="job-title ">${i.category.categoryName}</h3>
                                                <div class="details">Title:&nbsp;${i.title}</div>
                                                <div class="details">Company: ${i.company.nameCompany}</div>
                                                <div class="details text-primary font-italic">Date: ${i.date}</div>
                                                <a href="jobdetailemployeer?id=${i.jobID}" class="details-btn">More Details</a>
                                                <span style="color: green;" class="open-positions">Status: ${i.status}</span> 

                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty acceptlist}">
                                        <h3 class="text-success">There is no Accept JOb</h3>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade mt-5 text-light" id="reject" role="tabpanel" aria-labelledby="profile-tab">
                            <div  style="overflow-x: auto;white-space: nowrap"class="jobs-list-container">
                                <div  class="jobs d-flex flex-nowrap">
                                    <c:forEach items="${rejectlist}" var="i">
                                        <c:if test="${i.status != 'Expire'}">
                                            <div style="min-width: 250px;max-width: 300px;margin-right: 20px;" class="job bg-white position-relative">
                                                <!--<img src="images/software-engineer.svg">de anh cong ty o day -->   
                                                <svg width="66" height="66" viewBox="0 0 66 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <rect width="66" height="66" rx="16" fill="#083D77"/>
                                                <path d="M49 21C49 16.664 41.674 13 33 13C24.326 13 17 16.664 17 21V25C17 29.336 24.326 33 33 33C41.674 33 49 29.336 49 25V21ZM33 47C24.326 47 17 43.336 17 39V45C17 49.336 24.326 53 33 53C41.674 53 49 49.336 49 45V39C49 43.336 41.674 47 33 47Z" fill="#A2E3FF"/>
                                                <path d="M49 29C49 33.336 41.674 37 33 37C24.326 37 17 33.336 17 29V35C17 39.336 24.326 43 33 43C41.674 43 49 39.336 49 35V29Z" fill="#A2E3FF"/>
                                                </svg>
                                                <h3 class="job-title ">${i.category.categoryName}</h3>
                                                <div class="details">Title:&nbsp;${i.title}</div>
                                                <div class="details">Company: ${i.company.nameCompany}</div>
                                                <div class="details text-primary font-italic">Date: ${i.date}</div>
                                                <a href="jobdetailemployeer?id=${i.jobID}" class="details-btn">More Details</a>
                                                <span style="color: red;" class="open-positions">Status: ${i.status}</span> 


                                                <a onclick="handlerDeleteJob(${i.jobID})" href="#!"><i style="color: red; font-size: 20px;position: absolute;top: 10px;right: 10px" class="fas fa-window-close"></i></a>


                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty rejectlist}">
                                        <h3 class="text-danger">There is no Reject JOb</h3>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade mt-5" id="pending" role="tabpanel" aria-labelledby="contact-tab">
                            <div  style="overflow-x: auto;white-space: nowrap"class="jobs-list-container">
                                <div  class="jobs d-flex flex-nowrap">
                                    <c:forEach items="${pendinglist}" var="i">
                                        <c:if test="${i.status != 'Expire'}">
                                            <div style="min-width: 250px;max-width: 300px;margin-right: 20px;" class="job bg-white position-relative">
                                                <!--<img src="images/software-engineer.svg">de anh cong ty o day -->   
                                                <svg width="66" height="66" viewBox="0 0 66 66" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <rect width="66" height="66" rx="16" fill="#083D77"/>
                                                <path d="M49 21C49 16.664 41.674 13 33 13C24.326 13 17 16.664 17 21V25C17 29.336 24.326 33 33 33C41.674 33 49 29.336 49 25V21ZM33 47C24.326 47 17 43.336 17 39V45C17 49.336 24.326 53 33 53C41.674 53 49 49.336 49 45V39C49 43.336 41.674 47 33 47Z" fill="#A2E3FF"/>
                                                <path d="M49 29C49 33.336 41.674 37 33 37C24.326 37 17 33.336 17 29V35C17 39.336 24.326 43 33 43C41.674 43 49 39.336 49 35V29Z" fill="#A2E3FF"/>
                                                </svg>
                                                <h3 class="job-title ">${i.category.categoryName}</h3>
                                                <div class="details">Title:&nbsp;${i.title}</div>
                                                <div class="details">Company: ${i.company.nameCompany}</div>
                                                <div class="details text-primary font-italic">Date: ${i.date}</div>
                                                <a href="jobdetailemployeer?id=${i.jobID}" class="details-btn">More Details</a>
                                                <span style="color: #bbb;" class="open-positions">Status: ${i.status}</span> 

                                                <a onclick="handlerDeleteJob(${i.jobID})" href="#!"><i style="color: red; font-size: 20px;position: absolute;top: 10px;right: 10px" class="fas fa-window-close"></i></a>

                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty pendinglist}">
                                        <h3 class="text-secondary">There is no Pending JOb</h3>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </c:if>
        <!-- Filter list end -->
        <div class="container">
            <div style="height: 150px;width: 100%;"></div>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <hr>
            <div class="jobs-list-container">

                <c:if test="${not empty list}">

                    <c:if test="${hasNonExpiredJob}">
                        <h2 style="margin-bottom: 25px">All job applications you've created:</h2>
                    </c:if>
                    <c:if test="${not hasNonExpiredJob }">
                        <div class="jumbotron text-center">
                            <h1 class="mb-3">No Job has been created!</h1>
                            <p><a class="mt-2 filled-button btn-block col-lg-5" href="createjob?id=${sessionScope.account.idUser}" role="button">Create your First Job !</a></p>
                        </div>
                    </c:if>   
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
                                <div class="details text-primary font-italic">Date: ${i.date}</div>
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
                                    <a onclick="handlerDeleteJob(${i.jobID})" href="#!"><i style="color: red; font-size: 20px;position: absolute;top: 10px;right: 10px" class="fas fa-window-close"></i></a>
                                    </c:if>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <jsp:include page="footeremp.jsp"/>


        <script>
            function handlerDeleteJob(idjob) {

                if (confirm("Do you really want to delete this job?")) {
                    window.location.href = "deletejob?id=" + idjob;
                }
            }


        </script>
        <!-- Bootstrap core JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>
</html>
