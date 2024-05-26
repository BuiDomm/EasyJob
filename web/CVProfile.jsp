

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Easyjob | Free Job For Everyone</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
   
     <script>
       function savePDF() {
            
             var overviewContent = document.querySelector('.row.gy-4');

            
            html2canvas(overviewContent, {
                onrendered: function(canvas) {
                   
                    var imgData = canvas.toDataURL('image/png');
                    var { jsPDF } = window.jspdf;
                    var pdf = new jsPDF();
                    pdf.addImage(imgData, 'PNG', 0, 0, pdf.internal.pageSize.getWidth()+50, pdf.internal.pageSize.getHeight(), null, 'FAST');
                    
                  
                    pdf.save("cv.pdf");
                }
            });
        }
        
    </script>
     
    <style>
        img{
              width: 30%;
               height: 40%;
        }
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
                                    
                                    <h5 class="text-center mb-1"><c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></h5>
                                </div>
                            </div>
                        </div>

                        <!-- lay ra link url phan tach nhau bang ki tu | -->
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
                                            <a href="<c:out value="${socialAccount}" />" class="d-inline-block bg-dark link-light lh-1 p-2 rounded">
                                                <i class="bi <c:out value="${iconClass}" />"></i>
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
                                
                        <!-- phan tach skill bang dau , -->
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
                                <a href="home.jsp" class="btn btn-primary btn-sm">Back Home</a>

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
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Profile</button>
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
                                            <div class="p-2">File PDF</div>
                                        </div>
                                        <div class="col-7 col-md-9 bg-light border-start border-bottom border-white border-3">
                                            <div class="p-2"><c:out value="${cv.linkPdf}" /></div>
                                        </div>                                                       
                                    </div>
                                                 
                                       

                                    
<!--                                    <div class="container mt-3">
                                        <a href="javascript:void(0);" onclick="savePDF()" class="btn btn-primary" download="cv.pdf">Download CV</a>
                                    </div>  -->
                           
                         
                                    <div class="container mt-3">
                                        <a href="./assets/pdf/<c:out value="${cv.linkPdf}" />" download="" class="btn btn-primary">Download CV</a>                                
                                    </div>           
                                </div>
                                         
                                
                                
                                                 
                                                 
                                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                                   <form action="CVSeeker" method="POST" class="row gy-3 gy-xxl-4" onsubmit="return validateForm()">
                                        <div class="col-12">
<!--                                            <div class="row gy-2">
                                                <label class="col-12 form-label m-0">CV Image</label>
                                                <div class="col-12">
                                                    <img id="avatarImage" src="assets/images/<c:out value="${cv.avatar}" />" class="img-fluid" alt="Avatar">
                                                </div>
                                                <div class="col-12">
                                                    <input type="file" id="fileInput" style="display: none;" name="avatar" value="<c:out value="${cv.avatar}" />">
                                                    <a href="#!" id="uploadButton" class="d-inline-block bg-primary link-light lh-1 p-2 rounded">
                                                        <i class="bi bi-upload"></i> Upload
                                                    </a>
                                                    
                                                </div>
                                            </div>-->

                                            <div class="row gy-2">
                                               
                                                <p id="avatarImage"><c:out value="${cv.linkPdf}"/></p>
                                                <div class="col-12">
                                                    <input type="file" id="fileInput" style="display: none;" name="linkPdf" value="<c:out value="${cv.avatar}" />">
                                                    <a href="#!" id="uploadButton" class="d-inline-block bg-primary link-light lh-1 p-2 rounded">
                                                        <i class="bi bi-upload"></i> Upload
                                                    </a>
                                                    
                                                </div>
                                            </div>
                                        </div>
    
                                        <div class="col-12 col-md-6">
                                            <label for="inputFirstName" class="form-label">First Name</label>
                                            <input type="text" name="firstName" class="form-control" id="inputFirstName" value="<c:out value="${user.firstName}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputLastName" class="form-label">Last Name</label>
                                            <input type="text" name="lastName" class="form-control" id="inputLastName" value="<c:out value="${user.lastName}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputEducation" class="form-label">Education</label>
                                            <input type="text" name="education" class="form-control" id="inputEducation" value="<c:out value="${cv.education}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputSkills" class="form-label">Skills(Separate by comma)</label>
                                            <input type="text" name="skills" class="form-control" id="inputSkills" value="<c:out value="${cv.skills}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputPhone" class="form-label">Phone</label>
                                            <input type="tel" name="phoneNumber" class="form-control" id="inputPhone" value="<c:out value="${user.phoneNumber}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputEmail" class="form-label">Email</label>
                                            <input type="email" name="email" class="form-control" id="inputEmail" value="<c:out value="${user.email}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputAddress" class="form-label">Address</label>
                                            <input type="text" name="cityName" class="form-control" id="inputAddress" value="<c:out value="${user.cityName}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputExperience" class="form-label">Experience</label>
                                            <input type="text" name="experience" class="form-control" id="inputExperience" value="<c:out value="${cv.experience}" />">
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <label for="inputCertification" class="form-label">Certification</label>
                                            <input type="text" name="certification" class="form-control" id="inputCertification" value="<c:out value="${cv.certification}" />">
                                        </div>
                                        <div class="col-12">
                                            <label for="inputAbout" class="form-label">Description</label>
                                            <textarea name="description" class="form-control" id="inputAbout"><c:out value="${cv.description}" /></textarea>
                                        </div>
                                        
                                        <!-- link phan cach boi | -->
                                       <div id="yellow-border">
                                           <br/>
                                            <div class="col-12 col-md-6 yellow-border">
                                                <label for="inputExperience" class="form-label">Link Youtube</label>
                                                <input type="text" name="linkYoutube" class="form-control" id="inputExperience" value="<c:out value="${fn:split(cv.linkUrl, '|')[0]}" />">
                                            </div>
                                            <div class="col-12 col-md-6 yellow-border">
                                                <label for="inputExperience" class="form-label">Link Twitter</label>
                                                <input type="text" name="linkTwitter" class="form-control" id="inputExperience" value="<c:out value="${fn:split(cv.linkUrl, '|')[2]}" />">
                                            </div>
                                            <div class="col-12 col-md-6 yellow-border">
                                                <label for="inputExperience" class="form-label">Link Facebook</label>
                                                <input type="text" name="linkFacebook" class="form-control" id="inputExperience" value="<c:out value="${fn:split(cv.linkUrl, '|')[1]}" />">
                                            </div>
                                            <div class="col-12 col-md-6 yellow-border">
                                                <label for="inputExperience" class="form-label">Link Linkedin</label>
                                                <input type="text" name="linkLinkedin" class="form-control" id="inputExperience" value="<c:out value="${fn:split(cv.linkUrl, '|')[3]}" />">
                                            </div>
                                            <br/>
                                        </div>
                                        
                                        
                                        <div class="col-12">
                                           <button type="submit" class="btn btn-primary">Save Changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="inner-content">
                        <p>Copyright © 2024 - Summer 2024 FPTU SWP</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

              <script>
                function validateForm() {
                    var phoneNumber = document.getElementById("inputPhone").value;
                    var email = document.getElementById("inputEmail").value;

                    // kiem tra tinh hop le 
                    var phoneRegex = /^(\+?\d{2})?[- ]?(\d{3})[- ]?(\d{3})[- ]?(\d{4})$/;
                    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                    if (!phoneRegex.test(phoneNumber)) {
                        alert("Phone number invalid");
                        return false; 
                    }

                    if (!emailRegex.test(email)) {
                        alert("Email invalid");
                        return false; 
                        
                    
                    return true;
                }
                </script>                              
                                                


 <script>
    document.getElementById('uploadButton').addEventListener('click', function() {
        document.getElementById('fileInput').click();
    });

    document.getElementById('fileInput').addEventListener('change', function() {
        var formData = new FormData();
        formData.append('file', this.files[0]);

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'upload', true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var fileName = response.fileName;
                var avatarImage = document.getElementById('avatarImage');
                avatarImage.innerText =  fileName; // Thay ??i src c?a hình ?nh avatarImage
                console.log(fileName);
            }
        };
        xhr.send(formData);
    });
</script>

    <!-- Bootstrap core JavaScript -->
    <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
