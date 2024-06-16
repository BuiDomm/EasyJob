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
            <!-- banner start -->
            <c:if test="${not empty errormess}">
                <script type="text/javascript">
                    alert("${errormess}");
                </script>

            </c:if>
            <div class=" container-fluid ">



                <div class=" spaces ">
                </div>
                <div class=" banners text-center ">      
                    <h1>Edit Company </h1>
                    <p>Company</p>

                </div> 


            </div> 
            <h2 style="margin-left: 300px">${processedUrl}</h2>
            <!-- banner end -->
            <!-- Form start -->


            <form class="user-form container" action="editcompanyservlet" method="post" enctype="multipart/form-data">
                <h6 style="color: red">${errorMessage}</h6>
                <h5>Your company profile</h5>
                <label class="form-label">Company Name</label>
                <div class="input-group mb-3">
                    <input value="${com.nameCompany}" name="name" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                </div>

                <div class="mt-3 mb-3">
                    <label class="form-label">Your Company Description</label>
                    <textarea class="form-control" name="aboutus" rows="5">${com.aboutUS}</textarea>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Address</label>
                    <input value="${com.add}" type="text" class="form-control" name="address">
                </div>

                <div class="mt-3 input-group mb-3">

                    <div class="container">
                        <img src="${com.url}" id="oldimg" class="img-thumbnail row" alt="...">    
                        <div class="row">
                            <span class="mt-2 input-group-text col-sm-3 " id="inputGroup-sizing-default">Change Company Image</span>
                            <input value="${com.url}"  type="file" class="form-control mt-2 col-9" name="image" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
                        </div>
                    </div>

                </div>

                <div class="col-md-4">
                    <label class="form-label">Company Status</label>
                    <select class="form-control" name="status" id="companyStatus">
                        <option value="Active" ${com.status eq 'Active' ? 'selected' : ''}>Active</option>
                        <option value="Disabled" ${com.status eq 'Disabled' ? 'selected' : ''}>Disabled</option>
                    </select>
                </div>
                <%--modal start --%>
                <div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-warning" id="statusModalLabel">Warning</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                This action will delete all your comapny's Job Post
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="confirmDisable">Disable</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%--modal end --%>

                <div class="mt-2 d-grid gap-2">
                    <button type="submit" class="btn btn-warning btn-block">Update</button>
                </div>

            </form>
            <script>
                document.getElementById('companyStatus').addEventListener('change', function () {
                    if (this.value === 'Disabled') {
                        var myModal = new bootstrap.Modal(document.getElementById('statusModal'));
                        myModal.show();
                        this.value = 'Active';
                        document.getElementById('confirmDisable').addEventListener('click', () => {
                            this.value = 'Disabled';
                            myModal.hide();
                        }, {once: true});
                    }
                });
            </script>

            <!-- Form end -->
            <jsp:include page="employermenu.jsp"/> 





            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


            <!-- Additional Scripts -->
            <script src="assets/js/custom.js"></script>
            <script src="assets/js/owl.js"></script>
        </body>
    </html>
