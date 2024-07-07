<%-- 
    Document   : listUserPackage
    Created on : Jun 27, 2024, 11:57:30 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/userpackage.css">
        <link rel="icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="assets/css/button.css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/button.css">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <style>
            header{
                position: absolute;
                top: 0;
            }
        </style>

        <body>

            <div id="generic_price_table">   
                <section style="margin-top: 120px">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <!--PRICE HEADING START-->
                                <div class="price-heading clearfix">
                                    <h1>Upgrade service package </h1>
                                </div>
                                <!--//PRICE HEADING END-->
                            </div>
                        </div>
                    </div>
                    <div class="container">

                        <!--BLOCK ROW START-->
                        <div class="row" style="display: flex; justify-content: center">


                        <c:forEach var="p" items="${listP}">



                            <div class="col-md-4">
                                <!--PRICE CONTENT START-->
                                <div class="generic_content clearfix">

                                    <!--HEAD PRICE DETAIL START-->
                                    <div class="generic_head_price clearfix">

                                        <!--HEAD CONTENT START-->
                                        <div class="generic_head_content clearfix">

                                            <!--HEAD START-->
                                            <div class="head_bg"></div>
                                            <div class="head">
                                                <span>${p.packageName}</span>
                                            </div>
                                            <!--//HEAD END-->

                                        </div>
                                        <!--//HEAD CONTENT END-->

                                        <!--PRICE START-->
                                        <div class="generic_price_tag clearfix">	
                                            <span class="price">
                                                <span class="sign">VND</span>
                                                <span class="currency">${p.price}</span>
                                                <span class="cent">.00</span>
                                            </span>
                                        </div>
                                        <!--//PRICE END-->

                                    </div>                            
                                    <!--//HEAD PRICE DETAIL END-->

                                    <!--FEATURE LIST START-->
                                    <div class="generic_feature_list">
                                        <ul>
                                            <li><span>Describe: </span>${p.description}</li>

                                        </ul>
                                    </div>
                                    <!--//FEATURE LIST END-->

                                    <!--BUTTON START-->
                                    <div class="generic_price_btn clearfix">
                                        <c:if test="${pack.packageID == p.packageID}">
                                            <a style="pointer-events:none;background: #FF6D00;border: 1px solid #ccc;color: #fff" class="" href="">Package In Use</a>
                                        </c:if>
                                              <c:if test="${pack.packageID != p.packageID}">
                                            <a class="" href="upgrage?idPackage=${p.packageID}">Upgrade</a>
                                        </c:if>
                                    </div>
                                    <!--//BUTTON END-->

                                </div>
                                <!--//PRICE CONTENT END-->

                            </div>

                        </c:forEach>




                    </div>	
                    <!--//BLOCK ROW END-->

                </div>
            </section>             
            <footer style="padding-bottom: 50px;">

            </footer>
        </div>

    </body>

</html>
