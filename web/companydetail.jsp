<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html class="menu">
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
            
            <link rel="stylesheet" href="assets/css/icontop.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">





        </head>

        <body>

           <jsp:include page="headeremp.jsp"/>
           <!--<div style="height: 200px;"></div>-->
            <!-- banner start -->
            <c:if test="${com == null}">
            <div class=" container-fluid ">
                    <div class=" spaces ">
                    </div>
                    <div class=" banners text-center ">      
                        <h1>Create Company </h1>
                        <p>Company</p>

                    </div> 

                </c:if>
            </div> 
           
            <!-- banner end -->
            <!-- Form start -->
            <c:if test="${com == null}">

                <form class="user-form container " action="insertcompanyservlet" method="post" enctype="multipart/form-data">
                    <h6 style="color: red">${errorMessage}</h6>
                    <h5>Your company profile here !</h5>
                    
                    <label  class="form-label">Company Name</label>
                    <div class="input-group mb-3"> 
                        <input value="${company.nameCompany}" name="name" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="mt-3 mb-3">
                        <label  class="form-label">Your Company Description</label>
                        <textarea class="form-control" name="aboutus" rows="5">${company.aboutUS}</textarea>
                    </div>

                    <div class="col-md-4">                       
                        <label  class="form-label">Address</label>
                        <input value="${company.add}" type="text" class="form-control" name="address">

                    </div>
                    <div class="mt-3 input-group mb-3">
                        <span class="input-group-text" id="inputGroup-sizing-default">Upload Company Image</span>
                        <input type="file" value="" class="form-control" name="image" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
                    </div>
                    <div class="mt-2 d-grid gap-2">
                        <button type="submit" class=" btn btn-warning btn-block">Create Company</button>
                    </div>

                </form> >
            </c:if>
            <!-- Form end -->
            <c:if test="${com != null}">
            <div class="page-heading about-heading header-text" style="background-image: url(assets/images/heading-6-1920x500.jpg);">
                
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="text-content">
                                
                                <div class="row">
                                    
                                    
                                    <img src="${com.url}" class="ratio ratio-1x1 card mb-3 col-md-4" style="max-width: 320px; object-fit: contain;" alt="...">
                                   
                                    <div class=" col-md-8">
                                        <i style="color: #ff6600;font-size: 36px" class="fa fa-map-marker"></i><p style="color: #cccccc;font-size: 24px" class=" mt-3 mb-3">${com.add}</p>
                                        <div class="col-lg-25 ">
                                            <c:if test="${com.status eq 'Active'}">

                                                <div style="max-height: 26px" class=" badge bg-success"><p style="color: white">${com.status}</p></div>
                                                </c:if>
                                                <c:if test="${com.status eq 'Disabled'}">
                                                <div style="max-height: 26px" class=" badge bg-danger "><p style="color: white">${com.status}</p></div>
                                            </c:if>
                                 </div>       
                                        <h2 style="color: #ff6600">${com.nameCompany}</h2>
                                        <p style="color:  #cccccc;font-size: 16px">${com.aboutUS}</p>
                                        
                                        
                                    </div>
                                    
                                    <div class="col-lg-3">
                                        <div class="ml-5 contact-form">
                                            <div class="form-group">
                                                <a style="text-align: center;" href="loadcompanyservlet" class="filled-button btn-block">Edit Company Profile</a>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                     
      </c:if>
      <%--<jsp:include page="employermenu.jsp"/>--%> 





<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    </body>
</html>
