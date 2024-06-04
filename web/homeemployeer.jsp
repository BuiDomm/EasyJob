<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html><html class="menu">
    <html>

        <head>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">
            <link rel="icon" href="assets/images/favicon.ico">
            <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
            <title>Easyjob | Free Job For Everyone</title>
            <!-- Bootstrap core CSS -->
            <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <!-- Additional CSS Files -->
            <link rel="stylesheet" href="assets/css/fontawesome.css">

            <link rel="stylesheet" href="assets/css/styles.css">
            <link rel="stylesheet" href="assets/css/owl.css">
            <link rel="stylesheet" href="assets/css/button.css">
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet">






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

            <div class="services" style="background-image:url(assets/images/other-image-fullscren-1-1920x900.jpg);" >
                <div style="border-radius: 15px" class="container mt-3 shadow h-120 py-2 p-5 ">
                    <div style="border-radius: 15px;background-color: white " class=" row shadow h-100 py-2 d-sm-flex mb-5">
                        <h1 style="margin: auto;color: #333333" class="">Your Dashboard</h1>


                    </div>
                    <div class="row md-5"></div>
                    <div style="border-radius: 15px" class="row bg-light shadow h-100 py-2">
                        <!-- start-->
                        <div class="col-xl-3 col-md-6 p-3">
                            <a href="#">
                                <div class="card border-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Job Accept</div>
                                            </div>
                                            <div class="h1 mb-0 font-weight-bold text-success">${accept}</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div> 
                        <!-- end-->
                        <!-- start-->
                        <div class="col-xl-3 col-md-6 p-3">
                            <a href="#">
                                <div class="card border-danger shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                                    Job Reject</div>
                                            </div>
                                            <div class="h1 mb-0 font-weight-bold text-danger">${reject}</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div> 
                        <!-- end-->
                        <!-- start-->
                        <div class="col-xl-3 col-md-6 p-3">
                            <a href="#">
                                <div class="card border-secondary shadow h-100 py-2 btn">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-secondary text-uppercase mb-1">
                                                    Job Pending</div>
                                            </div>
                                            <div class="h1 mb-0 font-weight-bold text-secondary">${pending}</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div> 
                        <!-- end-->
                        <!-- start-->
                        <div class="col-xl-3 col-md-6 p-3">
                            <a href="listApplyCv">
                                <div class="card border-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Cv applied</div>
                                            </div>
                                            <div class="h1 mb-0 font-weight-bold text-warning">${cvapplied}</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div> 
                        <!-- end-->
                    </div>

                    <!-- chart -->
                </div>
                <div style="border-radius: 15px" class="container mt-4 shadow h-120 py-2 ">
                    <div class="row p-4">
                        <div style="border-radius: 15px" class=" col-lg-7 bg-light shadow h-120 py-2 p-5">
                            <h3>Number of Applicants Per Month</h3>
                            <canvas class="mt-3" id="applicantChart"></canvas>
                        </div>
                        <div class=" col">

                        </div>
                        <div style="border-radius: 15px" class="text-center col bg-light shadow h-100 py-2 p-5">

                            <h3 style="margin: auto">JOB CHART</h3>
                            <canvas class="mt-3" id="jobStatusChart"></canvas>

                        </div>

                    </div>
                </div>
                <!-- Table -->
                <div style="border-radius: 15px" class="container bg-light shadow h-120 py-2 mt-5 ">
                    <h3  class="mb-3 p-3">Job List</h3>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Job Title</th>
                                <th scope="col">Position</th>
                                <th scope="col">Salary</th>
                                <th scope="col">Date</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="counter" value="0" />
                            <c:forEach items="${list}" var="i">
                                <c:if test="${i.status != 'Expire'}">
                                    <c:set var="counter" value="${counter + 1}" />
                                    <tr onclick="window.location.href = '<c:url value='/jobdetailemployeer?id=${i.jobID}'/>'">
                                        <th scope="row">${counter}</th>
                                        <td>${i.title}</td>
                                        <td>${i.category.categoryName}</td>
                                        <td>${i.salary}$</td>
                                        <td>${i.date}</td>
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
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
            <!-- Bootstrap JS and dependencies -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
            <script>
                                        var ctx = document.getElementById('applicantChart').getContext('2d');
                                        var applicantChart = new Chart(ctx, {
                                            type: 'bar',
                                            data: {
                                                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                                                datasets: [{
                                                        label: 'Number of Applicants',
                                                        data: ${applicationsByMonth},
                                                        backgroundColor: 'rgba(255, 193, 7, 0.6)',
                                                        borderColor: 'rgba(255, 193, 7, 1)',
                                                        borderWidth: 1
                                                    }]
                                            },
                                            options: {
                                                scales: {
                                                    y: {
                                                        beginAtZero: true
                                                    }
                                                }
                                            }
                                        });

                                        var jobStatusCtx = document.getElementById('jobStatusChart').getContext('2d');
                                        var jobStatusChart = new Chart(jobStatusCtx, {
                                            type: 'pie',
                                            data: {
                                                labels: ['Job Accept', 'Job Reject'],
                                                datasets: [{
                                                        label: 'Job Status',
                                                        data: [${accept}, ${reject}],
                                                        backgroundColor: [
                                                            'rgba(40, 167, 69, 0.8)',
                                                            'rgba(220, 53, 69, 0.8)'
                                                        ],
                                                        borderColor: [
                                                            'rgba(40, 167, 69, 1)',
                                                            'rgba(220, 53, 69, 1)'
                                                        ],
                                                        borderWidth: 1
                                                    }]
                                            },
                                            options: {
                                                plugins: {
                                                    datalabels: {
                                                        formatter: (value, context) => {
                                                            let sum = 0;
                                                            let dataArr = context.chart.data.datasets[0].data;
                                                            dataArr.map(data => {
                                                                sum += data;
                                                            });
                                                            let percentage = (value * 100 / sum).toFixed(2) + "%";
                                                            return percentage;
                                                        },
                                                        color: '#fff',
                                                        font: {
                                                            weight: 'bold',
                                                            size: '16'
                                                        }
                                                    }
                                                }
                                            },
                                            plugins: [ChartDataLabels]
                                        });
            </script>
            <jsp:include page="footeremp.jsp"/>

            <!-- Additional Scripts -->
            <script src="assets/js/custom.js"></script>
            <script src="assets/js/owl.js"></script>
        </body>
    </html>