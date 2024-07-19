<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" href="assets/images/android-chrome-192x192.png">
        <title>EasyJob | Free Job For Everyone</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="assets/css/createjob.css">


    </head>
    <body>   


        <div class="main">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-img">
                        <img src="./assets/images/signup-img.jpg" alt="">
                    </div> 
                    <div class="signup-form">
                        <form method="post" class="register-form" id="register-form" method="createjob">

                            <h2 style="">Create an article post a job! </h2>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="name">Name company:</label>
                                    <input style="background: #ccc"  type="text" name="namecompany" id="name" value="${com.nameCompany}" readonly="" required/>
                                </div>
                                <div class="form-group">
                                    <label for="father_name">Title work :</label>
                                    <input type="text" name="namework" id="father_name" required/>
                                </div>
                            </div>

                            <!--                            <div class="form-radio">
                                                            <label for="gender" class="radio-label">Gender :</label>
                                                            <div class="form-radio-item">
                                                                <input type="radio" name="gender" id="male" checked>
                                                                <label for="male">Male</label>
                                                                <span class="check"></span>
                                                            </div>
                                                            <div class="form-radio-item">
                                                                <input type="radio" name="gender" id="female">
                                                                <label for="female">Female</label>
                                                                <span class="check"></span>
                                                            </div>
                                                        </div>-->

                            <div class="form-group">
                                <label for="category">Category Job </label>
                                <select name="cateID" class="form-control" id="category">
                                    <option selected disabled="true">Categories</option>
                                    <jsp:useBean id="cate" class="dao.CategoryDAO" /> 
                                    <c:forEach var="c" items="${cate.all}"> 
                                        <option ${c.categoryName eq oldObject.publisher.name ? 'selected' :''} value="${c.categoryID}">${c.categoryName}</option>
                                    </c:forEach>
                                </select>

                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="experiences">Year Experiences: </label>
                                    <input type="number" name="experiences" id="experiences" required/>
                                </div>
                                <div class="form-group">
                                    <label for="salary">Salary: ($) </label>
                                    <input placeholder="1000$" type="number" name="salary" id="salary" required/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="location">Location :</label>
                                <input type="text" name="location" id="location" />
                            </div>

                            <div class="form-group">
                                <label for="description">Description :</label>
                                <textarea id="description" name="description" rows="6" cols="70">
                                </textarea>
                            </div>
                            <h3 style="color: red">${notice}</h3>

                            <div class="form-submit">
                                <a href="homeemployeer.jsp">  <input type="" value="Back Home" class="submit" name="reset" id="reset" /></a>
                                <input type="submit" value="Submit Form" class="submit" name="submit" id="submit" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>