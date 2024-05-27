<%-- 
    Document   : stats
    Created on : 21 thg 5, 2024, 15:22:20
    Author     : ducanh2192003
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">
        <!--    <link rel="stylesheet" href="../css/spur.css">-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="js/chart-js-config.js"></script>
<!--        <link rel="stylesheet" href="./assets/css/main.min.css" />-->
        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>
        <title>Spur - A Bootstrap Admin Template</title>
    </head>

    <body>

        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <header>
                    <a href="#!" class="menu-toggle">
                        <i class="fas fa-bars"></i>
                    </a>
                    <!--                    <a href="index.jsp" class="spur-logo"><i class="fas fa-bolt"></i> <span>Admin</span></a>-->
                    <a href="homeadmin.jsp" style="display: inline-block; text-decoration: none;">
                        <img src="assets/images/easyjobb.png" alt="alt" style="width: 50px; height: 50px; vertical-align: middle;">
                        <span style="vertical-align: middle; color: #ff6d00; font-size: 28px">Admin</span>
                    </a>
                </header>
                <nav class="dash-nav-list">
                    <a href="homeadmin.jsp" class="dash-nav-item"  >
                        <i class="fas fa-home" ></i> Dashboard </a>
                    <!--                    <div class="dash-nav-dropdown">-->
                    <a href="jobadmin.jsp" class="dash-nav-item" >
                        <i class="fas fa-chart-bar"></i> Jobs </a>
                    <!--                        <div class="dash-nav-dropdown-menu">
                                                <a href="chartjs.jsp" class="dash-nav-dropdown-item">Chart.js</a>
                                            </div>-->
                    <!--                    </div>-->
                    <div class="dash-nav-dropdown ">
                        <a href="#!" class="dash-nav-item dash-nav-dropdown-toggle" >
                            <i class="fas fa-bullhorn"></i> Moderation
                        </a>

                        <div class="dash-nav-dropdown-menu">
                            <a href="modejob.jsp" class="dash-nav-dropdown-item">Job Recruitment</a>
                            <a href="modeblog.jsp" class="dash-nav-dropdown-item">Blog</a>
<!--                            <div class="dash-nav-dropdown ">
                                <a href="#" class="dash-nav-dropdown-item dash-nav-dropdown-toggle">Icons</a>
                                <div class="dash-nav-dropdown-menu">
                                    <a href="icons.jsp" class="dash-nav-dropdown-item">Solid Icons</a>
                                    <a href="icons.jsp#regular-icons" class="dash-nav-dropdown-item">Regular Icons</a>
                                    <a href="icons.jsp#brand-icons" class="dash-nav-dropdown-item">Brand Icons</a>
                                </div>
                            </div>-->
<!--                            <a href="stats.jsp" class="dash-nav-dropdown-item">Stats</a>
                            <a href="tables.jsp" class="dash-nav-dropdown-item">Tables</a>
                            <a href="typography.jsp" class="dash-nav-dropdown-item">Typography</a>
                            <a href="userinterface.jsp" class="dash-nav-dropdown-item">User Interface</a>-->
                        </div>
                    </div>
                    <div class="dash-nav-dropdown">
                        <a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">
                            <i class="fas fa-clipboard-check"></i> Handle Report </a>
                        <div class="dash-nav-dropdown-menu">
                            <a href="reportjob.jsp" class="dash-nav-dropdown-item">Job Recruitment</a>
                            <a href="reportblog.jsp" class="dash-nav-dropdown-item">Blog</a>
                            
                        </div>
                    </div>
<!--                    <div class="dash-nav-dropdown">-->
                        <a href="listaccountpackage.jsp" class="dash-nav-item">
                            <i class="fas fa-chevron-up"></i> Account Package </a>
<!--                        <div class="dash-nav-dropdown-menu">
                            <a href="https://github.com/HackerThemes/spur-template" target="_blank" class="dash-nav-dropdown-item">GitHub</a>
                            <a href="http://hackerthemes.com" target="_blank" class="dash-nav-dropdown-item">HackerThemes</a>
                        </div>-->
<!--                    </div>-->
                    <a href="listaccount.jsp" class="dash-nav-item">
                        <i class="far fa-address-card"></i> Acounts </a>
                </nav>
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
                                <a class="dropdown-item" href="login.jsp">Logout</a>
                            </div>

                        </div>
                    </div>
                </header>
                <main class="dash-content">
                    <div class="container-fluid">
                        <h1 class="dash-title">Stats</h1>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="stats stats-primary">
                                    <h3 class="stats-title"> Primary </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-secondary">
                                    <h3 class="stats-title"> Secondary </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-success">
                                    <h3 class="stats-title"> Success </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-info">
                                    <h3 class="stats-title"> Info </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-warning">
                                    <h3 class="stats-title"> Warning </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-danger">
                                    <h3 class="stats-title"> Danger </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-light">
                                    <h3 class="stats-title"> Light </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="stats stats-dark">
                                    <h3 class="stats-title"> Dark </h3>
                                    <div class="stats-content">
                                        <div class="stats-icon">
                                            <i class="fas fa-cart-arrow-down"></i>
                                        </div>
                                        <div class="stats-data">
                                            <div class="stats-number">$100</div>
                                            <div class="stats-change">
                                                <span class="stats-percentage">+17.5%</span>
                                                <span class="stats-timeframe">from last month</span>
                                            </div>
                                        </div>
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
