<%-- 
    Document   : addpackage
    Created on : Jun 26, 2024, 8:54:56 AM
    Author     : DELL
--%>


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
        <!--        <link rel="stylesheet" href="../css/spur.css">-->
        <!--        <link rel="stylesheet" href="./assets/css/main.min.css" />-->
        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="./assets/js/chart-js-config.js"></script>


        
    </head>

    <body>

        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <%@include file="sidebar.jsp" %>
            </div>
            <div class="dash-app">
                <%@include file="header.jsp" %>
                <main class="dash-content">


                    <div class="col-lg-12">
                        <div class="card">

                            <div class="card-header text-center">
                                <strong>Add Package</strong> 
                            </div>
                            <div class="card-body card-block">
                                <c:if test="${empty mv }">
                                    <form action="addPackage" method="post"  class="form-horizontal">
                                    </c:if>
                                    <c:if test="${not empty mv }">
                                        <form action="updatePackage?pidtxt=${mv.packageID}" method="post" class="form-horizontal">


                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="text-input"
                                                                                 class=" form-control-label">ID</label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="text-input"
                                                                                    name="idtxt" class="form-control" value="${mv.packageID}" readonly></div>
                                            </div>
                                        </c:if>
                                        <c:if test="${mv.packageID != 1 }">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="text-input"
                                                                                 class=" form-control-label">Name</label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="text-input"
                                                                                    name="nametxt" placeholder="Title" class="form-control" value="${mv.packageName}" required></div>
                                            </div>
                                        </c:if>
                                        <c:if test="${mv.packageID == 1 }">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="text-input"
                                                                                 class=" form-control-label">Name</label></div>
                                                <div class="col-12 col-md-9"><input type="text" id="text-input"
                                                                                    name="nametxt" placeholder="Title" class="form-control" value="${mv.packageName}" readonly></div>
                                            </div>
                                        </c:if>



                                        <div class="row form-group">
                                            <div class="col col-md-3"><label for="textarea-input"
                                                                             class=" form-control-label">Description</label></div>
                                            <div class="col-12 col-md-9"><textarea name="descriptiontxt" id="textarea-input"
                                                                                   rows="9" placeholder="Content..." class="form-control" required>${mv.description}</textarea></div>
                                        </div>

                                        <c:if test="${mv.packageID != 1 }">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="text-input"
                                                                                 class=" form-control-label">Price</label></div>
                                                <div class="col-12 col-md-9"><input type="number" id="text-input"
                                                                                    name="pricetxt" placeholder="Price" class="form-control" value="${mv.price}" required></div>
                                            </div>
                                        </c:if>
                                        <c:if test="${mv.packageID == 1 }">
                                            <div class="row form-group">
                                                <div class="col col-md-3"><label for="text-input"
                                                                                 class=" form-control-label">Price</label></div>
                                                <div class="col-12 col-md-9"><input type="number" id="text-input"
                                                                                    name="pricetxt" placeholder="Price" class="form-control" value="${mv.price}" readonly></div>
                                            </div>
                                        </c:if>




                                        <div class="card-footer">
                                            <c:if test="${empty mv }">
                                                <button type="submit" class="btn btn-primary btn-sm">
                                                    <i class="fa fa-dot-circle-o"></i> Submit
                                                </button>

                                                <button type="reset" class="btn btn-danger btn-sm">
                                                    <i class="fa fa-ban"></i> Reset
                                                </button>
                                            </c:if>
                                            <c:if test="${not empty mv }">
                                                <button type="submit" class="btn btn-primary btn-sm">
                                                    <i class="fa fa-dot-circle-o"></i> Update
                                                </button>
                                            </c:if>


                                        </div>
                                    </form>
                            </div>

                        </div>
                        <c:if test="${ empty mv }">

                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th class="serial text-center">ID</th>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Description</th>
                                            <th class="text-center">Price</th>
                                            <th class="text-center">Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="o" items="${listP}" varStatus="status">
                                            <tr>
                                                <td class="serial text-center">${status.index + 1}</td>
                                                <td class="text-center">${o.packageName}</td>
                                                <td class="text-center">
                                                    <span class="text-muted small" style="display: block;min-width: 200px; max-height: 70px; overflow-y: auto;">${o.description}</span>
                                                </td>
                                                <td class="align-items-center text-center"><span class="badge badge-warning">${o.price}</span></td>
                                                <td class="text-center">
                                                    <div class=" d-flex flex-row align-items-center justify-content-center">
                                                        <a href="updatePackage?pid=${o.packageID}">
                                                            <button type="submit" class="btn btn-primary btn-sm mb-2 mr-2">
                                                                <i class="fa fa-dot-circle-o"></i> Update
                                                            </button>
                                                        </a>
                                                        <c:if test="${o.packageID != 1}"> 
                                                            <a href="#" onclick="showMess(${o.packageID})">
                                                                <button type="reset" class="btn btn-danger btn-sm mb-2">
                                                                    <i class="fa fa-ban"></i> Delete
                                                                </button>
                                                            </a>
                                                        </c:if>
                                                    </div>

                                                </td>


                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </c:if>



                    </div>

                </main>
            </div>
        </div>
        <script>
            function showMess(id) {
                var option = confirm('Are you sure to delete movie id = ' + id);
                if (option === true) {
                    window.location.href = 'deletePackage?pid=' + id;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>

    </body>

</html>
