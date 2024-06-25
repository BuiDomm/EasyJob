<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="./assets/js/chart-js-config.js"></script>


        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@latest"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

       

        <title>Spur - A Bootstrap Admin Template</title>
    </head>

    <body>
        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <%@include file="header.jsp" %>
            </div>
            <div class="dash-app">
                <header class="dash-toolbar">
                    <a href="#!" class="menu-toggle">
                        <i class="fas fa-bars"></i>
                    </a>
                    <a href="#!" class="searchbox-toggle">
                        <i class="fas fa-search"></i>
                    </a>
                    <!--                                        <form class="searchbox" action="#!">
                                                                <a href="#!" class="searchbox-toggle"> <i class="fas fa-arrow-left"></i> </a>
                                                                <button type="submit" class="searchbox-submit"> <i class="fas fa-search"></i> </button>
                                                                <input type="text" class="searchbox-input" placeholder="type to search">
                                                            </form>-->

                    <div class="tools">
                        <!--                                                <a href="https://github.com/HackerThemes/spur-template" target="_blank" class="tools-item">
                                                                            <i class="fab fa-github"></i>
                                                                        </a>-->
                        <a href="#!" class="tools-item">
                            <i class="fas fa-bell"></i>
                            <i class="tools-item-count">4</i>
                        </a>
                        <div class="dropdown tools-item">
                            <a href="#" class="" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"></i>
                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                                <!--                                <a class="dropdown-item" href="#!">Profile</a>-->

                                <a class="dropdown-item" href="changepass.jsp">Change Password</a>


                                <a class="dropdown-item" href="loginjobseeker">Logout</a>

                            </div>
                        </div>
                    </div>
                </header>
                <main class="dash-content">
                    <div class="container-fluid">
                        <div class="row dash-row" style="padding: 15px;margin-bottom: 0px">
                            <div class="col-xl-4">
                                <div style="border-radius: 15px;" class="stats stats-primary shadow">
                                    <h3 class="stats-title"> Users </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-user"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">${totalAccount}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div style="border-radius: 15px;" class="stats stats-success shadow">
                                    <h3 class="stats-title"> Jobs </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">${totalJobs}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4">
                                <div style="border-radius: 15px;" class="stats stats-danger shadow">
                                    <h3 class="stats-title"> Company </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-hotel"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">${totalCompany}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="card mb-2">
                                <div class="card-header d-flex flex-row">
                                    <h5 class="card-title text-center">Top 5 Job Hot By ${top == "year" ? "Year" : ((top == "month")?"Month":"Week")}</h5>
                                     <div class="spur-card-menu">
                                            <div class="dropdown show">
                                                <a class="spur-card-menu-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                                    <a class="dropdown-item" href="adminDashBoard?top=week">Week</a>
                                                    <a class="dropdown-item" href="adminDashBoard?top=month">Month</a>
                                                    <a class="dropdown-item" href="adminDashBoard?top=year">Year</a>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                                <div class="card-body">
                                    <div class="border rounded-3">
                                        <div class="table-responsive">
                                            <table class="table align-middle custom-table m-0">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">#</th>
                                                        <th class="text-center">Title</th>
                                                        <th class="text-center">Location</th>
                                                        <th class="text-center">Salary</th>
                                                        <th class="text-center ">Number Apply</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach var="entry" items="${topJob}" varStatus="status">
                                                        <tr>
                                                            <td class="text-center">
                                                                <div class="rank-circle ${status.index == 0 ? 'gold' : status.index == 1 ? 'silver' : status.index == 2 ? 'bronze' : status.index == 3 ? 'green' : status.index == 4 ? 'blue' : ''}">
                                                                    ${status.index + 1}
                                                                </div>
                                                            </td>
                                                            <td class="text-center">
                                                                <div class="fw-semibold">${entry.key.getTitle()}</div>
                                                            </td>
                                                            <td class="text-center">
                                                                <div class="fw-semibold">${entry.key.getLocation()}</div>
                                                            </td>
                                                            <td class="text-center">
                                                                <div class="fw-semibold">${entry.key.getSalary()}</div>
                                                            </td>
                                                            <td class="text-center">
                                                                <span class="badge bg-primary rounded-circle fs-4 text-white">${entry.value}</span>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>



                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="padding: 15px;">
                            <div class="col-xl-6">
                                <div style="border-radius: 15px" class="card spur-card bg-light shadow h-120 ">
                                    <div style="border-radius: 15px 15px 0 0" class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Total Job </div>
<!--                                        <div class="spur-card-menu">
                                            <div class="dropdown show">
                                                <a class="spur-card-menu-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>-->
                                    </div>
                                    <div class="card-body spur-card-body-chart">
                                        <canvas id="spurChartjsBar"></canvas>
                                        <script>
                                            var ctx = document.getElementById("spurChartjsBar").getContext('2d');
                                            var myChart = new Chart(ctx, {
                                                type: 'bar',
                                                data: {
                                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                                    datasets: [{
                                                            label: 'Blue',
                                                            data: [<c:forEach items="${statistic}" var="a">${a.countJob},</c:forEach>],
                                                            backgroundColor: window.chartColors.primary,
                                                            borderColor: 'transparent'
                                                        }]
                                                },
                                                options: {
                                                    legend: {
                                                        display: false
                                                    },
                                                    scales: {
                                                        yAxes: [{
                                                                ticks: {
                                                                    beginAtZero: true
                                                                }
                                                            }]
                                                    }
                                                }
                                            });
                                            </script>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6">
                                    <div style="border-radius: 15px" class="card shadow border-0 p-4">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h6 class="align-items-center mb-0">Account Status</h6>

                                        </div>
                                        <div id="department" class="apex-chart"></div>
                                        <script>
                                            var options2 = {
                                                series: [${accountActive}, ${accountLock}],
                                                chart: {
                                                    width: 450,
                                                    type: 'pie',
                                                },
                                                labels: ['Active Account', 'Lock Account'],
                                                colors: ['#33FF57', '#FF5733'],
                                                responsive: [{
                                                        breakpoint: 600,
                                                        options: {
                                                            chart: {
                                                                width: 500
                                                            },
                                                            legend: {
                                                                position: 'bottom'
                                                            },
                                                        }
                                                    }]
                                            };

                                            var chart2 = new ApexCharts(document.querySelector("#department"), options2);
                                            chart2.render();

                                    </script>
                                </div>
                            </div>



                        </div>
                        <!--                        <div class="row">
                                                    <div class="col-xl-6">
                                                        <div class="card spur-card">
                                                            <div class="card-header">
                                                                <div class="spur-card-icon">
                                                                    <i class="fas fa-chart-bar"></i>
                                                                </div>
                                                                <div class="spur-card-title"> Two bars </div>
                                                                <div class="spur-card-menu">
                                                                    <div class="dropdown show">
                                                                        <a class="spur-card-menu-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                                                            <a class="dropdown-item" href="#">Action</a>
                                                                            <a class="dropdown-item" href="#">Another action</a>
                                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-body spur-card-body-chart">
                                                                <canvas id="spurChartjsTwoBars"></canvas>
                                                                <script>
                                                                    var ctx = document.getElementById("spurChartjsTwoBars").getContext('2d');
                                                                    var myChart = new Chart(ctx, {
                                                                        type: 'bar',
                                                                        data: {
                                                                            labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
                                                                            datasets: [{
                                                                                    label: 'Blue',
                                                                                    data: [12, 19, 3, 5, 2],
                                                                                    backgroundColor: window.chartColors.primary,
                                                                                    borderColor: 'transparent'
                                                                                }, {
                                                                                    label: 'Red',
                                                                                    data: [4, 12, 11, 2, 14],
                                                                                    backgroundColor: window.chartColors.danger,
                                                                                    borderColor: 'transparent'
                                                                                }]
                                                                        },
                                                                        options: {
                                                                            legend: {
                                                                                display: false
                                                                            },
                                                                            scales: {
                                                                                yAxes: [{
                                                                                        ticks: {
                                                                                            beginAtZero: true
                                                                                        }
                                                                                    }]
                                                                            }
                                                                        }
                                                                    });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <div class="card spur-card">
                                                            <div class="card-header">
                                                                <div class="spur-card-icon">
                                                                    <i class="fas fa-chart-bar"></i>
                                                                </div>
                                                                <div class="spur-card-title"> Line </div>
                                                                <div class="spur-card-menu">
                                                                    <div class="dropdown show">
                                                                        <a class="spur-card-menu-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                                                            <a class="dropdown-item" href="#">Action</a>
                                                                            <a class="dropdown-item" href="#">Another action</a>
                                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-body spur-card-body-chart">
                                                                <canvas id="spurChartjsLine"></canvas>
                                                                <script>
                                                                    var ctx = document.getElementById("spurChartjsLine").getContext('2d');
                                                                    var myChart = new Chart(ctx, {
                                                                        type: 'line',
                                                                        data: {
                                                                            labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
                                                                            datasets: [{
                                                                                    label: 'Blue',
                                                                                    data: [12, 19, 3, 5, 2],
                                                                                    backgroundColor: window.chartColors.primary,
                                                                                    borderColor: window.chartColors.primary,
                                                                                    fill: false
                                                                                }, {
                                                                                    label: 'Red',
                                                                                    data: [4, 12, 11, 2, 14],
                                                                                    backgroundColor: window.chartColors.danger,
                                                                                    borderColor: window.chartColors.danger,
                                                                                    fill: false
                                                                                }]
                                                                        },
                                                                        options: {
                                                                            legend: {
                                                                                display: false
                                                                            }
                                                                        }
                                                                    });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>
    </body>

</html>