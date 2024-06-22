<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <body style="background-color: black">
        <jsp:include page="headeremp.jsp"/>

        <!-- header --> 
        <div style="border-radius: 15px; margin-top: -46px; background-color: #F9F1E7" class="px-5 py-5 text-center container-fluid">
            <div class="p-5">
                <p style="font-family: 'Poppins', sans-serif; font-size: 96px; color: black" class="font-weight-normal pb-5 mt-5"><c:if test="${empty questions}">Creating Skill Test Page</c:if><c:if test="${not empty questions}">Job Skill Test Page</c:if></p>
                    <div class="row px-5">
                        <div class="col-2"></div>
                        <div style="border-radius: 36px; border-color: black; border: solid 2px" class="mt-5 col-3 p-3 mr-3">
                        <%-- Job info--%>
                        <div class="form-group">
                            <h3><i style="color: #666666">Job title: </i><i>${cc.title}</i></h3>
                            <hr>
                            <ul class="h5">
                                <li>Company: <b>${com.nameCompany}</b></li>
                                <li>Job Position: <b>${cc.category.categoryName}</b></li>
                                <li>Year Experience: <b>${cc.yearEx}</b></li>
                                <li>Salary <b>${cc.salary}</b></li>
                                <li>Location: <b>${cc.location}</b></li>
                            </ul>
                        </div>    
                        <%-- Job info--%>
                    </div>

                    <div style="border-radius: 36px; border-color: black; border: solid 2px" class="mt-5 ml-5 col-5 p-3">
                    </div>
                    <div class="col"></div>
                </div>
            </div> 
        </div>
        <!-- header -->
        <!-- form -->
        <c:if test="${not empty questions}">
            <form action="updateskilltest" method="post">
                <input type="hidden" name="id" value="${cc.jobID}">
                <div style="border-radius: 15px; margin-top: -46px; background-color: black" class="container p-5">
                    <div id="questions-container" class="col">
                        <c:forEach var="question" items="${questions}">
                            <input type="hidden" name="questionID[]" value="${question.questionID}">
                            <div style="border-radius: 15px; background-color: white" class="row p-4 mb-4 question-block">
                                <div class="col">
                                    <div class="row px-3">
                                        <h3 class="mb-3">Question title:</h3>
                                        <textarea class="form-control h3" name="questionTitle[]" placeholder="Question title" style="width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${question.content}</textarea>

                                        <hr>
                                        <c:set var="incorrectCount" value="0"/>
                                        <c:forEach var="answer" items="${questionAnswersMap[question]}">
                                            <c:choose>
                                                <c:when test="${answer.isTrue == 1}">
                                                    <textarea class="form-control col-5 p-4 mt-3 mx-4" style="border-radius: 15px; background-color: #FBC540; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" name="correctAnswer[]">${answer.answerText}</textarea>
                                                    <input type="hidden" name="answerID[]" value="${answer.answerID}">
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="col-5 p-4 mt-3 mx-4 bg-dark text-light form-control" style="border-radius: 15px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" name="incorrectAnswer[]">${answer.answerText}</textarea>
                                                    <input type="hidden" name="incorrectanswerID[]" value="${answer.answerID}">
                                                    <c:set var="incorrectCount" value="${incorrectCount + 1}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <input type="hidden" name="incorrectAnswersCount[]" value="${incorrectCount}">
                                        <c:if test="${incorrectCount < 3}">
                                            <a href="#" style="border-radius: 15px; background-color: white" class="form-control col-5 p-4 mt-3 mx-4 btn-outline-dark" onclick="addIncorrectAnswer(this); return false;">
                                                <p style="color: black" class="h4">Add incorrect Answer</p>
                                            </a>
                                        </c:if>
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <button type="submit" style="border-radius: 15px; background-color: white" class="btn p-4 mt-4 container">
                        <h5 style="margin: auto; color: #FBC540">Update Skill Test</h5>  
                    </button>
                </div>
            </form>
        </c:if>



        <!-- form end -->

        <!-- jQuery and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>
        <script>

        </script>

    </body>
</html>
