<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="icon" href="assets/images/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
        <title>PHPJabbers.com | Free Job Agency Website Template</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/popupcv.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css" integrity="sha512-3PN6gfRNZEX4YFyz+sIyTF6pGlQiryJu9NlGhu9LrLMQ7eDjNgudQoFDK3WSNAayeIKc6B8WXXpo4a7HqxjKwg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .toast-top-right {
                background-color: #60F382;
            }
            .toast .toast-success {
                background-color: #7dce8f;
            }
            .toast .toast-message ,.toast-title{
                color:#000;
            }


        </style>
    </head>
    <%
Boolean isVerified = (Boolean) request.getAttribute("successfully");
if (isVerified == null) {
isVerified = false;
}
            
    %>
    <script>

        var isVerifiedParam = <%= isVerified %>;
        console.log(isVerifiedParam);
        if (isVerifiedParam) {
            toastr.success("Your profile has been applied to the recruitment application!!!", "Easyjob Notice", {
                timeOut: 2000,
            });
        }

    </script>

    <%
        Boolean check = false;
String upgrade = (String) request.getAttribute("upgrade");
if (upgrade == "upgrade") {
    check = true;
}
    %>
    <script>

        var isVerifiedParam = <%= check %>;
        console.log(isVerifiedParam);
        if (isVerifiedParam) {
            if (confirm("${noticeUpgrade}")) {
                window.location.href = "listUserPackage";
            } 
        }

    </script>

    <body>

        <section>

            <span class="overlay"></span>
            <div class="modal-box container" style="margin-top: 50px; overflow-y: auto; height: 700px">


                <!DOCTYPE html>


                <html lang="en">

                    <head>
                        <meta charset="utf-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                        <meta name="description" content="">
                        <meta name="author" content="">
                        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

                        <script>
        function savePDF() {

            var overviewContent = document.querySelector('.row.gy-4');
            html2canvas(overviewContent, {
                onrendered: function (canvas) {

                    var imgData = canvas.toDataURL('image/png');
                    var {jsPDF} = window.jspdf;
                    var pdf = new jsPDF();
                    pdf.addImage(imgData, 'PNG', 0, 0, pdf.internal.pageSize.getWidth(), pdf.internal.pageSize.getHeight(), null, 'FAST');
                    pdf.save("cv.pdf");
                }
            });
        }

                        </script>

                        <style>
                            /*            img{
                                            width: 30%;
                                            height: 40%;
                                        }*/
                            .cv-image-wrapper {
                                width: 30%;

                                position: relative;
                                overflow: hidden;
                            }

                            .cv-image-wrapper img {
                                width: 100%;
                                height: 50%;
                                display: block;
                            }
                            #yellow-border{
                                border: 2px solid yellow;
                                border-radius: 5px;
                            }


                        </style>
                    </head>

                    <body>
                        <!-- Profile 1 - Bootstrap Brain Component -->
                        <section class="bg-light py-3 py-md-5 py-xl-8">


                            <div class="container">
                                <div class="row gy-4 gy-lg-0">
                                    <div class="col-12 col-lg-4 col-xl-3">
                                        <div class="row gy-4">
                                            <div class="col-12">
                                                <div class="card widget-card border-light shadow-sm">
                                                    <div class="card-header text-bg-primary">Welcome, <c:out value="${user.email}" /> </div>
                                                    <div class="card-body">

                                                        <!-- fix image -->    
                                                        <div class="d-flex flex-column align-items-center text-center">
                                                            <img src="assets/avatars/<c:out value="${cv.avatar}" />" alt="Admin" class="card-image p-1 bg-primary" style="width:130px; height:130px; object-fit: cover; border-radius: 50%">
                                                            <div class="mt-3">
                                                                <h4><c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></h4>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- lay ra link phan cach nhau bang ki tu | -->
                                            <div class="col-12">
                                                <div class="card widget-card border-light shadow-sm">
                                                    <div class="card-header text-bg-primary">Social Accounts</div>
                                                    <div class="card-body">
                                                        <c:if test="${not empty cv.linkUrl}">
                                                            <c:set var="socialAccounts" value="${fn:split(cv.linkUrl, '|')}" />
                                                            <c:forEach var="socialAccount" items="${socialAccounts}" varStatus="loop">
                                                                <c:set var="iconClass">
                                                                    <c:choose>
                                                                        <c:when test="${loop.index == 0}">bi-youtube</c:when>
                                                                        <c:when test="${loop.index == 2}">bi-twitter-x</c:when>
                                                                        <c:when test="${loop.index == 1}">bi-facebook</c:when>
                                                                        <c:when test="${loop.index == 3}">bi-linkedin</c:when>
                                                                        <c:otherwise>bi-link</c:otherwise> 
                                                                    </c:choose>
                                                                </c:set>
                                                                <a  href="<c:out value="${socialAccount}" />" class="d-inline-block bg-dark link-light lh-1 p-2 rounded">
                                                                    <i style="font-size: 16px" class="bi <c:out value="${iconClass}" />"></i>
                                                                </a>
                                                            </c:forEach>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="col-12">
                                                <div class="card widget-card border-light shadow-sm">
                                                    <div class="card-header text-bg-primary">About Me</div>
                                                    <div class="card-body">
                                                        <ul class="list-group list-group-flush mb-0">
                                                            <li class="list-group-item">
                                                                <h6 class="mb-1">
                                                                    <span class="bii bi-mortarboard-fill me-2"></span>
                                                                    Education
                                                                </h6>
                                                                <span><c:out value="${cv.education}" /></span>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <h6 class="mb-1">
                                                                    <span class="bii bi-geo-alt-fill me-2"></span>
                                                                    Location
                                                                </h6>
                                                                <span><c:out value="${user.cityName}" /></span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- phan tach skill bang dau  , -->
                                            <div class="col-12">
                                                <div class="card widget-card border-light shadow-sm">
                                                    <div class="card-header text-bg-primary">Skills</div>
                                                    <div class="card-body">
                                                        <c:if test="${not empty cv.skills}">
                                                            <c:set var="skillList" value="${fn:split(cv.skills, ',')}" />
                                                            <c:forEach var="skill" items="${skillList}">
                                                                <span class="badge text-bg-primary"><c:out value="${skill}" /></span>
                                                            </c:forEach>
                                                        </c:if>
                                                    </div>
                                                    <a href="CVSeeker" class="btn btn-primary btn-sm">Edit CV Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-12 col-lg-8 col-xl-9">
                                        <div class="card widget-card border-light shadow-sm">
                                            <div class="card-body p-4">
                                                <ul class="nav nav-tabs" id="profileTab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="overview-tab" data-bs-toggle="tab" data-bs-target="#overview-tab-pane" type="button" role="tab" aria-controls="overview-tab-pane" aria-selected="true">Overview</button>
                                                    </li>

                                                </ul>
                                                <div class="tab-content pt-4" id="profileTabContent">
                                                    <div class="tab-pane fade show active" id="overview-tab-pane" role="tabpanel" aria-labelledby="overview-tab" tabindex="0">
                                                        <h5 class="mb-3">Description</h5>
                                                        <p class="lead mb-3"><c:out value="${cv.description}" /></p>
                                                        <h5 class="mb-3">Profile</h5>
                                                        <div class="row g-0">
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Experience</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${cv.experience}" /></div>
                                                            </div>
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Education</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${cv.education}" /></div>
                                                            </div>
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Address</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${user.cityName}" /></div>
                                                            </div>
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Phone</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2">(+84)<c:out value="${user.phoneNumber}" /></div>
                                                            </div>
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Email</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${user.email}" /></div>
                                                            </div>
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Date of Birth</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${user.date}" /></div>
                                                            </div>
                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Certification</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${cv.certification}" /></div>
                                                            </div>
                                                            <!--                                        <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                                                        <div class="p-2">CV Image</div>
                                                                                                    </div>
                                                                                                    <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                                                        <div class="p-2">
                                                                                                             <div class="cv-image-wrapper">
                                                                                                                <img src="assets/images/<c:out value="${cv.avatar}" />" class="img-fluid" alt="CV Image">  
                                                                                                             </div>
                                                                                                        </div>
                                                                                                    </div>-->

                                                            <div class="col-5 col-md-3 bg-light border-bottom border-white border-3">
                                                                <div class="p-2">Link pdf</div>
                                                            </div>
                                                            <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                                                <div class="p-2"><c:out value="${cv.linkPdf}" /></div>
                                                            </div>
                                                        </div>



                                                        <!--                                    <div class="container mt-3">
                                                                                                <a href="javascript:void(0);" onclick="savePDF()" class="btn btn-primary" download="cv.pdf">Download CV</a>
                                                                                             </div>  -->


                                                        <div class="container mt-3 d-flex flex-row justify-content-between">
                                                            <a href="./assets/pdf/<c:out value="${cv.linkPdf}" />" download="" class="btn btn-primary">Download CV</a>     
                                                        </div>   

                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <footer style="margin-bottom: 150px;width: 100%;">
                                <div class="">
                                    <div class="">
                                        <div class="">
                                            <div class="inner-content" style="text-align: center" >
                                                <p style="margin-left: 50%;
                                                   transform: translateX(-30%);
                                                   width: 560px;">Are you sure you will <b style="font-weight: 700">submit this your CV Profile</b> to the Employer ?</p>

                                                <div class="buttons" style="margin-left: 50%;
                                                     transform: translateX(-30%); margin-top: 25px;">
                                                    <button style="background-color: red; border-radius: 6px" class="close-btn">No, Close</button>
                                                    <button style="background-color: green; border-radius: 6px" class="yes-btn">Yes, Do it</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </footer>
                        </section>





                        <!-- Bootstrap core JavaScript -->
                        <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                        <script>

        function showMess(id, url, name, key) {
            if (key === "reject") {
                var option = confirm('Are you sure you want to ' + key + ' CV of \n' +
                        'Account name: ' + name + ' ?');
                if (option === true) {
                    window.location.href = url + id;
                }
            } else if (key === "accept") {
                var option = confirm('Are you sure you want to ' + key + ' CV of \n' +
                        'Account name: ' + name + ' ?');
                if (option === true) {
                    window.location.href = url + id;
                }
            }
        }

                        </script>
                    </body>

                </html>


            </div>
        </section>

        <!-- ***** Preloader Start ***** -->
        <!--        <div id="preloader">
                    <div class="jumper">
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>  -->
        <!-- ***** Preloader End ***** -->

        <!-- Header -->
        <jsp:include page="header.jsp"/>

        <!-- Page Content -->
        <div class="page-heading about-heading header-text" style="background-image: url(assets/images/heading-6-1920x500.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">
                            <h4>Security / Protective Services Jobs</h4>

                            <h2>Security Officer - Luxury Retail</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="products">
            <div class="container">



                <div class="row">
                    <div class="col-md-9 col-sm-8">
                        <p class="lead">
                            <i class="fa fa-map-marker"></i> <i>${cc.location}</i> &nbsp;&nbsp;
                            <i class="fa fa-calendar"></i> ${cc.date} &nbsp;&nbsp;
                            <i class="fa fa-file"></i> Contract
                        </p>
                        <br/>
                        <p>${cc.descrip}</p>
                        <br/>
                        <div class="form-group">
                            <h5><i>${cc.title}</i></h5>
                        </div>

                        <hr>
                        <h5 style="margin-bottom: 5px">*Conditions met</h5>
                        <ul>
                            <li>Company Name: <b>${com.nameCompany}</b></li>
                            <li>Job Position: <b>${cc.category.categoryName}</b></li>
                            <li>Year Experience: <b>${cc.yearEx}</b></li>
                            <li>Salary <b>${cc.salary}</b></li>
                            <li>Location: <b>${cc.location}</b></li>

                        </ul>
                    </div>



                    <div class="col-md-3 col-sm-4">


                        <div class="contact-form">
                            <div class="form-group">
                                <c:choose>
                                    <c:when test="${apply.status ==null}">
                                        <a style="text-align: center; background-color: #ff6600" onclick="handlerStatuss('${profile.CVId}', '${cc.jobID}')"  href="#!" class="filled-button btn-block show-modal">Applied to this job.</a>
                                    </c:when>
                                    <c:when test="${apply.status == 'Pending'}">
                                        <c:if test="${(not empty questions) && (empty checktest)}">
                                        <a class="filled-button btn-block hover" style="text-align: center; background-color: black" href="dotest?id=${cc.jobID}" >
                                            Do Skill Test
                                        </a>
                                        </c:if>
                                        <c:if test="${not empty checktest}">
                                        <div style="border-radius: 15px;" class="bg-secondary p-2 text-center m-2" >
                                            <h6 class="text-light">You Have Finished Test</h6>
                                        </div>
                                        </c:if>
                                        <a class="filled-button btn-block hover" style="text-align: center; background-color: #ff4444" onclick="withdrawJob('${cc.category.categoryName}', '${cc.jobID}')" href="#!" class="filled-button btn-block">
                                            Withdraw job application.
                                        </a> 
                                    </c:when>
                                    <c:when test="${apply.status == 'Reject'}">
                                        <a style="text-align: center;background-color: red;pointer-events:none" href="#!" class="filled-button btn-block"><i class="fas fa-times"></i> &nbsp; Your CV has been reject.</a>
                                    </c:when>
                                    <c:when test="${apply.status == 'Accept'}">
                                        <a style="text-align: center;pointer-events:none; background-color: green" href="#!" class="filled-button btn-block"> <i class="fas fa-check"></i> &nbsp;Your CV has been approve.</a>
                                    </c:when>
                                </c:choose>



                            </div>
                            <div class="contact-form">
                                <div class="form-group">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.account}">
                                            <a style="text-align: center" href="login.jsp" class="filled-button btn-block">Save favorite job</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a id="saveJobFavoriteBtn" style="text-align: center" href="#" class="filled-button btn-block">Save favorite job</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex; align-items: center; flex-direction: column;gap: 2px">
                            <p>Company: <i>${com.nameCompany}</i></p>
                        </div>

                        <div>
                            <img src="${com.url}" alt="" class="img-fluid wc-image">
                        </div>
                        <div style="display: flex; align-items: center; flex-direction: column;gap: 2px">
                            <p>Address: <i>${com.add}</i></p>

                        </div>


                        <br>

                        <ul class="social-icons text-center">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>

                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="section-heading">
                            <h2>About Cannon Guards Security ltd</h2>
                        </div>

                        <p class="lead">
                            <i class="fa fa-map-marker">&nbsp;${cc.location}</i> 
                        </p>

                        <p>Looking to improve the security at your place of business? If so, we will provide you with the trained security officers and professionally licensed personnel needed for any business. From a security guard for construction site security to private event security, you can be sure to get the very best from our staff. Alternatively we provide tailor-made security guard training for your existing security staff.</p>
                        <br>
                        <p>Looking to improve the security at your place of business? If so, we will provide you with the trained security officers and professionally licensed personnel needed for any business. From a security guard for construction site security to private event security, you can be sure to get the very best from our staff. Alternatively we provide tailor-made security guard training for your existing security staff.</p>
                    </div>

                    <div class="col-md-3">
                        <div class="section-heading">
                            <h2>Contact Details</h2>
                        </div>

                        <div class="left-content">
                            <p>
                                <span>Name</span>

                                <br>


                                <strong>${u.firstName} ${u.lastName}</strong>
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
                                <a style="text-align: center" href="messageWith?friendId=${dao.getEmployIdByJobId(cc.jobID)}" class="filled-button btn-block">Message with Employer</a>
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


        <script>
            $(document).ready(function () {
                $("#saveJobFavoriteBtn").click(function (event) {
                    event.preventDefault();
                    var userId = "${sessionScope.account.idUser}";
                    var jobId = ${cc.jobID}

                    $.ajax({
                        url: "${pageContext.request.contextPath}/favoriteJobs",
                        type: "GET",
                        data: {uid: userId, jid: jobId},
                        success: function (response) {
                            toastr.success("Save Job Successfully!", "Easyjob Notice", {
                                timeOut: 2000,
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Job fail");
                        }
                    })
                })
            });
//            $(document).ready(function () {
//                $(".show-modal").click(function (event) {
//                    event.preventDefault();
//                    var userId = "${sessionScope.account.idUser}";
//                    var jobId = ${cc.jobID}
//
//                    $.ajax({
//                        url: "${pageContext.request.contextPath}/detailCV",
//                        type: "GET",
//                        success: function (response) {
//
//                        },
//                        error: function (jqXHR, textStatus, errorThrown) {
//                            console.log("Job fail");
//                        }
//                    })
//                })
//            });


            function handlerStatuss(idpro, idjob) {
                if (!idpro) {
                    if (confirm("You need to create your CV profile first before apply for job!!")) {
                        window.location.href = "CVSeeker";
                    }
                } else {
                    const section = document.querySelector("section"),
                            overlay = document.querySelector(".overlay"),
                            showBtn = document.querySelector(".show-modal"),
                            closeBtn = document.querySelector(".close-btn"),
                            yesBtn = document.querySelector(".yes-btn");

                    if (showBtn && closeBtn && yesBtn && overlay && section) {
                        showBtn.addEventListener("click", () => section.classList.add("active"));
                        overlay.addEventListener("click", () => section.classList.remove("active"));
                        closeBtn.addEventListener("click", () => section.classList.remove("active"));
                        yesBtn.addEventListener("click", () => {
                            window.location.href = "cvapply?idprofile=" + idpro + "&idjob=" + idjob;
                        });

                        document.onkeyup = function (e) {
                            if (e.keyCode === 27) {
                                section.classList.remove("active");
                            }
                        };
                    }
                }
            }

            function withdrawJob(name, idJob) {
                console.log(name);
                if (confirm("Do you really want to withdraw your CV from : " + name + " job ?")) {
                    window.location.href = "withdraw?idjob=" + idJob;
                }
            }



        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    





        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>

</html>
