<%-- 
    Document   : form
    Created on : 21 thg 5, 2024, 15:15:13
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
<!--        <link rel="stylesheet" href="../css/spur.css">-->
        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="js/chart-js-config.js"></script>
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
                        <h1 class="dash-title">Forms</h1>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card spur-card">
                                    <div class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Simple Form </div>
                                    </div>
                                    <div class="card-body ">
                                        <form>
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Email address</label>
                                                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Example select</label>
                                                <select class="form-control" id="exampleFormControlSelect1">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect2">Example multiple select</label>
                                                <select multiple class="form-control" id="exampleFormControlSelect2">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Example textarea</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card spur-card">
                                    <div class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Inline Form </div>
                                    </div>
                                    <div class="card-body ">
                                        <form class="form-inline">
                                            <div class="form-group mb-2">
                                                <label for="staticEmail2" class="sr-only">Email</label>
                                                <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="email@example.com">
                                            </div>
                                            <div class="form-group mx-sm-3 mb-2">
                                                <label for="inputPassword2" class="sr-only">Password</label>
                                                <input type="password" class="form-control" id="inputPassword2" placeholder="Password">
                                            </div>
                                            <button type="submit" class="btn btn-primary mb-2">Confirm identity</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="card spur-card">
                                    <div class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Horizontal Layout </div>
                                    </div>
                                    <div class="card-body ">
                                        <form>
                                            <div class="form-group row">
                                                <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                                                <div class="col-sm-10">
                                                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                                </div>
                                            </div>
                                            <fieldset class="form-group">
                                                <div class="row">
                                                    <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
                                                    <div class="col-sm-10">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                                                            <label class="custom-control-label" for="customRadio1">Toggle this custom radio</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
                                                            <label class="custom-control-label" for="customRadio2">Or toggle this other custom radio</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
                                                            <label class="custom-control-label" for="customRadio3">This choice seems interesting</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
                                                            <label class="custom-control-label" for="customRadio4">This one rather outlandish</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="form-group row">
                                                <div class="col-sm-2">Checkbox</div>
                                                <div class="col-sm-10">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                        <label class="custom-control-label" for="customCheck1">Check this custom checkbox</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-10">
                                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card spur-card">
                                    <div class="card-header">
                                        <div class="spur-card-icon">
                                            <i class="fas fa-chart-bar"></i>
                                        </div>
                                        <div class="spur-card-title"> Complex layout </div>
                                    </div>
                                    <div class="card-body ">
                                        <form>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputEmail4">Email</label>
                                                    <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="inputPassword4">Password</label>
                                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputAddress">Address</label>
                                                <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputAddress2">Address 2</label>
                                                <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputCity">City</label>
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="inputState">State</label>
                                                    <select id="inputState" class="form-control">
                                                        <option selected>Choose...</option>
                                                        <option>...</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <label for="inputZip">Zip</label>
                                                    <input type="text" class="form-control" id="inputZip">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck4">
                                                    <label class="custom-control-label" for="customCheck4">Check this custom checkbox</label>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Sign in</button>
                                        </form>
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