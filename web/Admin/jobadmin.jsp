<%-- 
    Document   : chartj
    Created on : 21 thg 5, 2024, 15:07:24
    Author     : ducanh2192003
--%>
<!--fake-->
<!--jobs-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">
        <!--        <link rel="stylesheet" href="../css/spur.css">-->
        <link href="../assets/css/spur.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="js/chart-js-config.js"></script>
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
                    <!--                    <form class="searchbox" action="#!">
                                            <a href="#!" class="searchbox-toggle"> <i class="fas fa-arrow-left"></i> </a>
                                            <button type="submit" class="searchbox-submit"> <i class="fas fa-search"></i> </button>
                                            <input type="text" class="searchbox-input" placeholder="type to search">
                                        </form>-->
                    <div class="tools">
                        <!--                        <a href="https://github.com/HackerThemes/spur-template" target="_blank" class="tools-item">
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
                        <h1 class="dash-title">Chart.js</h1>
                        <p class="mb-5"> These charts are made using the Chart.js library. You can find more examples and ways to configure the charts in the <a href="http://chartjs.org" target="_blank">Chart.js Documentation</a>. </p>
                        <div class="row">
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
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card spur-card">
                                    <div class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Doughnut </div>
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
                                        <canvas id="spurChartjsDougnut"></canvas>
                                        <script>
                                            var ctx = document.getElementById("spurChartjsDougnut").getContext('2d');
                                            var myChart = new Chart(ctx, {
                                                type: 'doughnut',
                                                data: {
                                                    labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
                                                    datasets: [{
                                                            label: 'Week',
                                                            data: [12, 19, 3, 5, 2],
                                                            backgroundColor: [
                                                                window.chartColors.primary,
                                                                window.chartColors.secondary,
                                                                window.chartColors.success,
                                                                window.chartColors.superwarning,
                                                                window.chartColors.danger,
                                                            ],
                                                            borderColor: '#fff',
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
                            <div class="col-xl-6">
                                <div class="card spur-card">
                                    <div class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Polar Area </div>
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
                                        <canvas id="spurChartjsPolar"></canvas>
                                        <script>
                                            var ctx = document.getElementById("spurChartjsPolar").getContext('2d');
                                            var myChart = new Chart(ctx, {
                                                type: 'polarArea',
                                                data: {
                                                    labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
                                                    datasets: [{
                                                            label: 'Week',
                                                            data: [12, 19, 3, 5, 2],
                                                            backgroundColor: [
                                                                window.chartColors.primary,
                                                                window.chartColors.secondary,
                                                                window.chartColors.success,
                                                                window.chartColors.superwarning,
                                                                window.chartColors.danger,
                                                            ],
                                                            borderColor: '#fff'
                                                        }]
                                                },
                                                options: {
                                                    legend: {
                                                        display: true
                                                    }
                                                }
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/spur.js"></script>
    </body>

</html>
