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
            <link rel="icon" href="assets/images/android-chrome-192x192.png">
            <title>EasyJob | Free Job For Everyone</title>
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

            <form action="updatejobservlet?id=${job.jobID}" method="post">

                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-9 col-sm-8">
                            <div class="row">

                                <div class="input-group mb-3">
                                    <span style="padding:0" class="input-group-text" id="inputGroup-sizing-default">
                                        <i style="font-size: 32px; margin-bottom:16px" class="fa fa-map-marker"></i>
                                    </span>
                                    <input required="" name="location" value="${job.location}" style="height: 53px" type="text" class="form-control col-md-3" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>

                            </div>
                            <br/>
                            <div class="form-group">
                                <h3><i>Job Title :</i></h3>
                            </div>
                            <div class="input-group input-group-lg">
                                <input required="" name="title" value="${job.title}" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                            </div>

                            <hr>

                            <ul>
                                <h4><li>Company Name: <b style="color: #ff6600">${com.nameCompany}</b></li></h4>
                                <br>
                                <li>Job Position: 
                                    <b style="color: #ff6600">
                                        <div class="input-group input-group-sm mb-3">
                                            <select class="form-control" name="category">
                                                <option value="${job.category.categoryID}" selected>${job.category.categoryName}</option>
                                                <c:forEach items="${requestScope.categories}" var="c">
                                                    <option value="${c.categoryID}">${c.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </b>
                                </li>
                                <li>Year Experience: 
                                    <b style="color: #ff6600">
                                        <div class="input-group input-group-sm mb-3">
                                            <input required="" name="exp" value="${job.yearEx}" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                        </div>
                                    </b>
                                </li>
                                <li>Salary 
                                    <b style="color: #ff6600">
                                        <div class="input-group input-group-sm mb-3">
                                            <input required="" name="salary" value="${job.salary}" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                        </div>
                                    </b>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-3 col-sm-4">
                            <div class="contact-form">
                                <div class="form-group">
                                    <!-- Additional fields or content can be added here if needed -->
                                </div>
                            </div>

                            <div>
                                <img src="${com.url}" alt="" class="img-fluid wc-image">
                            </div>
                            <br><br><br>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="section-heading">
                                    <h2>About Job Description</h2>
                                </div>
                                <textarea class="form-control" name="description" rows="5" required="">${job.descrip}</textarea>
                                <button style="background-color: #ff6600; color: white" type="submit" class="mt-5 btn btn-block">Update Job Post</button>
                            </div>

                            <div class="col-md-3">
                                <div class="section-heading">
                                    <h2>Contact Details</h2>
                                </div>
                                <div class="left-content">
                                    <p>
                                        <span>Name</span><br>
                                        <strong>${u.firstName} ${u.lastName}</strong>
                                    </p>
                                    <p>
                                        <span>Phone</span><br>
                                        <strong><a href="tel:${not empty u.phoneNumber ? u.phoneNumber : ''}">${not empty u.phoneNumber ? u.phoneNumber : 'Unknown'}</a></strong>
                                    </p>
                                    <p>
                                        <span>Mobile phone</span><br>
                                        <strong><a href="tel:${not empty u.phoneNumber ? u.phoneNumber : ''}">${not empty u.phoneNumber ? u.phoneNumber : 'Unknown'}</a></strong>
                                    </p>
                                    <p>
                                        <span>Email</span><br>
                                        <strong><a href="mailto:${u.email}">${u.email}</a></strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <jsp:include page="footeremp.jsp"/>










            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


            <!-- Additional Scripts -->
            <script src="assets/js/custom.js"></script>
            <script src="assets/js/owl.js"></script>
        </body>
    </html>