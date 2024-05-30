<!DOCTYPE html><html class="menu">
    <html>

        <head>

            <meta charset="utf-8"/>
            <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
            <meta name="google" value="notranslate"/>
            <title>Easyjob | Free Job For Everyone</title>

            <link rel="stylesheet" type="text/css" href="./assets/css/empui.css">
            <link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

            <link rel="icon" href="assets/images/favicon.ico">
            <link rel="stylesheet" href="assets/css/icontop1.css">

            <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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
<!-- Banner Starts Here -->
<div style="padding: 0" class=" banner header-text">
        <div class="owl-banner owl-carousel">
           
            <div class="banner-item-02">
                <div class="text-content">
                    
                    <h2><a class="btn btn-outline-light" style="color: white;font-size: 72px" href="createjob?id=${sessionScope.account.idUser}">Upload Your Jobs</a></h2>
                </div>
            </div>
           
        </div>
    </div>
    <!-- Banner Ends Here -->
   <jsp:include page="employermenu.jsp"/> 





 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    </body>
</html>