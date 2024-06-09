<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="experiences">Year Experiences: </label>
                                    <input type="number" name="experiences" id="experiences" required/>
                                </div>
                                <div class="form-group">
                                    <label for="salary">Salary: </label>
                                    <input placeholder="1000$" type="text" name="salary" id="salary" required/>
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

                            <div class="form-submit">
                                <a href="homeemployeer.jsp">  <input type="" value="Back Home" class="submit" name="reset" id="reset" /></a>
                                <input type="submit" value="Submit Form" class="submit" name="submit" id="submit" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
