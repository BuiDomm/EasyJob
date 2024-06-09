<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>





    </head>

    <body>
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
                toastr.error("Your profile has been applied to the recruitment application!!!", "Easyjob Notice", {
                    timeOut: 2000,
                });

            }

        </script>  
        <%
Boolean isVerified1 = (Boolean) request.getAttribute("successfully1");
if (isVerified1 == null) {
isVerified1 = false;
}
            
        %>
        <script>

            var isVerifiedParam1 = <%= isVerified1 %>;
            console.log(isVerifiedParam1);
            if (isVerifiedParam1) {
                toastr.success("Update Status Job Is Successfully!!", "Easyjob Notice", {
                    timeOut: 2000,
                });

                if (!isVerifiedParam1) {
                    toastr.success("Update Status Job Is Error", "Easyjob Notice", {
                        timeOut: 2000,
                    });

                }

        </script>

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
        <jsp:include page="headeremp.jsp"/>



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
                <div style="border-radius: 15px; background-color:#f3f3f4;box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);" class="row p-4">
                    <div class="col-md-9 col-sm-8">
                        <p class="lead" style="display: flex; align-items: center">
                            <i style="font-size: 28px;margin-top: -12px;"  class="fa fa-map-marker"></i> <i>${cc.location}</i> &nbsp;&nbsp;
                            <i style="font-size: 28px;margin-top: -12px;" class="fa fa-calendar"></i> ${cc.date} &nbsp;&nbsp;
                            Status: &nbsp; <c:if test="${cc.status == 'Accept'}"> <i style="color: green">${cc.status}</i> </c:if> <c:if test="${cc.status == 'Pending'}"> <i style="color: #bbb">${cc.status}</i> </c:if> <c:if test="${cc.status == 'Reject'}"> <i style="color: red">${cc.status}</i> </c:if><c:if test="${cc.status == 'Expire'}"> <i style="color: orange">${cc.status}</i> </c:if>
                            </p>
                            <br/>
                                        <p>${cc.descrip}</p>
                        <br/>
                        <div class="form-group">
                            <h5><i style="color: white">Job title: &nbsp;&nbsp;   </i><i>${cc.title}</i></h5>
                        </div>

                        <hr>
                        <h5 style="margin-bottom: 5px">*Conditions met</h5>
                        <ul>
                            <li>Company: <b>ABC</b></li>
                            <li>Job Position: <b>${cc.category.categoryName}</b></li>
                            <li>Year Experience: <b>${cc.yearEx}</b></li>
                            <li>Salary <b>${cc.salary}</b></li>
                            <li>Location: <b>${cc.location}</b></li>

                        </ul>
                    </div>



                    <div class="col-md-3 col-sm-4">

                        <div>                         
                            <c:if test="${cc.status == 'Expire'}">
                                <a style="pointer-events: none;" href="statuschange?id=${cc.jobID}">
                                    <div style="display: flex; align-items: center;justify-content: center"> <label for="exipre">Mark to Expire Job! &nbsp;</label> 
                                        <input style="display: inline-block;margin-bottom: 5px" type="checkbox" id="exipre" name="expire" ${cc.status == 'Expire' ? "checked":""}/>

                                    </div>
                                </a>
                            </c:if>
                            <c:if test="${cc.status == 'Accept'}">
                                <a href="#!" onclick="handlerStatus('${cc.title}', '${cc.jobID}', 'expire-checkbox-${cc.jobID}'); return false;">
                                    <div style="display: flex; align-items: center;justify-content: center">
                                        <label for="expire-checkbox-${cc.jobID}">Mark to Expire Job! &nbsp;</label>
                                        <input style="display: inline-block; margin-bottom: 5px" type="checkbox" id="expire-checkbox-${cc.jobID}" name="expire" ${checkExpire == 'Yes' ? "checked" : ""}/>
                                    </div>
                                </a>
                            </c:if>

                        </div>
                        <div class="col-md-3 col-lg-12">
                            <c:if test="${cc.status == 'Pending'}">
                                <div class="contact-form">
                                    <div class="form-group">

                                        <a style="text-align: center;" href="#!" data-toggle="modal" data-target="#confirmModal" class="filled-button btn-block shadow">Edit Job Information</a>
                                        <!-- Modal -->
                                        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h6 class="modal-title" id="confirmModalLabel">Are you sure you want to edit this job information?</h6>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body text-center">

                                                        <p style="color: red">This action will revert your post to a new pending status </p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                                                        <a href="loadjobservlet?id=${cc.jobID}" class="btn btn-primary">Yes</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>

                            <div>

                                <img src="${com.url}" alt="" class="img-fluid wc-image">
                            </div>
                            <br>
                            <br>
                            <br>
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
                        <c:if test="${cc.status == 'Accept'}">
                            <div class="contact-form">
                                <div class="form-group">
                                    <a style="text-align: center;background:#7808d0; " href="#!" class="filled-button btn-block shadow"  onclick="scrollToTable();">Jobseeker was applied</a>
                                </div>
                            </div>

                        </c:if>
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
                            <i style="width:255px;" class="fa fa-map-marker">&nbsp;${cc.location}</i> 
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

                    </div>
                </div>
            </div>
        </div>
        <!-- table -->
        <c:if test="${cc.status == 'Accept'}">
            <div id="appliedCVTable" style="border-radius: 15px; background-color: #f3f3f4;box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);" class="container mt-5 ">
                <c:if test="${listApply.isEmpty()}">
                    <h3 class="mb-3 p-3">There is no CV has been applied</h3>

                </c:if>
                <c:if test="${!listApply.isEmpty()}">
                    <h3  class="mb-3 p-3">CV Applied</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone Number</th>
                                <th scope="col">Apply Date</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="counter" value="0" />
                            <c:forEach items="${listApply}" var="i">

                                <c:set var="counter" value="${counter + 1}" />
                                <tr onclick="window.location.href = '<c:url value='detailCV?UserId=${dao.getUserByCVid(i.cvProfile.CVId).idUser}&ApplyId=${i.applicationID}'/>'">
                                    <th scope="row">${counter}</th>
                                    <td>${dao.getUserByCVid(i.cvProfile.CVId).firstName}</td>
                                    <td>${dao.getUserByCVid(i.cvProfile.CVId).email}</td>
                                    <td>${dao.getUserByCVid(i.cvProfile.CVId).phoneNumber}</td>
                                    <td>${i.applicationDate}</td>
                                    <c:if test="${i.status == 'Accept'}">
                                        <td style="color: green;" class="open-positions">${i.status}</td>
                                    </c:if>
                                    <c:if test="${i.status == 'Pending'}">
                                        <td style="color: #bbb;" class="open-positions">${i.status}</td>
                                    </c:if>
                                    <c:if test="${i.status == 'Reject'}">
                                        <td style="color: red;" class="open-positions">${i.status}</td>
                                    </c:if>

                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>

                </c:if>
            </div>  
        </c:if>
        <!-- table -->                        
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
        <jsp:include page="footeremp.jsp"/>
        <script>
                function handlerStatus(namebook, id, checkboxId) {
                    var checkbox = document.getElementById(checkboxId);
                    if (confirm("You cann't return your step, this is job will be hire!! \nDo you want to mark job as expired: " + namebook)) {
                        window.location.href = "statuschange?id=" + id;
                    } else {
                        checkbox.checked = false;
                    }
                }

                function scrollToTable() {
                    document.getElementById('appliedCVTable').scrollIntoView({behavior: 'smooth'});
                }




        </script>   


    </body>

</html>
