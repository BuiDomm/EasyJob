<%-- 
    Document   : content
    Created on : 21 thg 5, 2024, 15:11:59
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="js/chart-js-config.js"></script>
        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>
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
                                <a class="dropdown-item" href="login.jsp">Logout</a>
                            </div>
                        </div>
                    </div>
                </header>
                <main class="dash-content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-10">
                                <h1 class="dash-title">A simple content page</h1>
                                <h3 id="my-section-1" class="content-anchor">My first content section <a href="#my-section-1" class="content-anchor-link"><i class="fas fa-link"></i></a></h3>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <h3 id="my-section-2" class="content-anchor">My second content section <a href="#my-section-2" class="content-anchor-link"><i class="fas fa-link"></i></a></h3>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
                                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi architecto aut cupiditate debitis delectus dicta dolor et fugit neque nesciunt, nihil nulla, quisquam reiciendis rerum, sapiente sit. Aliquid, ex? </p>
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
