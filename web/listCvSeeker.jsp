<%-- 
    Document   : listCvSeeker
    Created on : May 31, 2024, 11:21:03 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
        <meta name="google" value="notranslate"/>
        <title>Side Menu</title>

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
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
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


        <div class="content">
            <div class="container">
                <h2 class="mb-5">List Cv Apply</h2>
                <div class="table-responsive">
                    <table style="margin-bottom: 150px; margin-top: 20px; overflow-y:scroll" class="table table-striped custom-table">
                        <thead>
                            <tr>                           
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone Number</th>
                                <th scope="col">Job Apply</th>
                                <th scope="col">Apply Date</th>
                                <th scope="col">Status</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listApply}" var="i">
                            <tr scope="row">

                                <td class="pl-0">
                                    <div class="d-flex align-items-center">
                                        
                                        <a href="#">${dao.getUserByCVid(i.cvProfile.CVId).firstName}</a>
                                    </div>
                                </td>
                                <td>${dao.getUserByCVid(i.cvProfile.CVId).email}</td>
                                <td>${dao.getUserByCVid(i.cvProfile.CVId).phoneNumber}</td>                            
                                <td>${i.job.title}</td>
                                <td>${i.applicationDate}</td>
                                <td>${i.status}</td>
                                <td><a href="detailCV?UserId=${dao.getUserByCVid(i.cvProfile.CVId).idUser}&ApplyId=${i.applicationID}" class="more">Details</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

  <!-- Popup Start -->
    <div class="modal" tabindex="-1" role="dialog" id="rejectModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Reject Reason</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="rejectForm">
                        <div class="form-group">
                            <label for="rejectReason">Reason:</label>
                            <textarea class="form-control" id="rejectReason" rows="3" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="saveBtn">Save changes</button>
                    <button type="button" class="btn btn-secondary close" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Popup End -->


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>

</html>
