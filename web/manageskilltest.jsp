<%-- 
    Document   : manageskilltest
    Created on : Jun 15, 2024, 3:02:30 AM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Skill Test Manage</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body  >
        <jsp:include page="headeremp.jsp"/>
        <!-- header --> 
        <div  class="p-5 text-center">

            <div class="p-5 ">
                <p style=" font-family: 'Poppins', sans-serif;font-size: 96px;color: black" class=" font-weight-normal pb-5 ">Creating Skill Test Now</p>
                <div class="row px-5">
                    <div class="col-2"></div>
                    <div style="border-radius: 36px;border-color: black;border:solid 2px" class="mt-5 col-8 bg-dark ">
                        <p style="font-size: 24px" class=" font-family-Poppins p-3 text-light">Get Start</p>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div> 
        </div>
        <!-- header -->
        <div style="border-radius: 36px" class="container p-5 bg-dark">
            <div class="card-group">
                <div class="row ">
                    <c:forEach items="${noques}" var="i">

                        <a href="loadskilltest?id=${i.jobID}" style="border-radius: 36px;max-width: 300px" class="btn btn-light col-3 mb-4 mx-3">
                            <div style="border-radius: 36px"  class="card bg-light border-light rounded p-3">
                                <img src="${com.url}" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h6 class="card-title">${i.category.categoryName}</h6>
                                    <p class="card-text">${i.title}</p>
                                </div>
                                <hr>
                                <p class="card-text">Date: ${i.date}</p>
                            </div>
                        </a>

                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="container mt-5">
        <hr>
        <h2>Update Skill Test</h2>
        </div>
        <div style="border-radius: 36px" class="container p-5 bg-secondary mt-5">
            <div class="card-group">
                <div class="row ">
                    <c:forEach items="${havques}" var="c">

                        <a href="loadskilltest?id=${c.jobID}" style="border-radius: 36px" class="btn btn-light col-3 mb-4 mx-3">
                            <div style="border-radius: 36px"  class="card bg-light border-light rounded p-3">
                                <img src="${com.url}" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h6 class="card-title">${c.category.categoryName}</h6>
                                    <p class="card-text">${c.title}</p>
                                </div>
                                <hr>
                                <p class="card-text">Date: ${c.date}</p>
                            </div>
                        </a>

                    </c:forEach>
                </div>
            </div>
        </div>

            <!-- jQuery and Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>
    </body>
</html>
