<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Skill Test Marks</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>

    <body class="bg-dark">
        <jsp:include page="headeremp.jsp"/>

        <!-- header --> 
        <div style="border-radius: 15px; margin-top: -46px; background-color: #F9F1E7" class="px-5 py-5 text-center container-fluid">
            <div class="p-5">
                <p style="font-family: 'Poppins', sans-serif; font-size: 96px; color: black" class="font-weight-normal pb-5 mt-5">
                    Skill Test Mark
                </p>
                <div class="row px-5">
                    <div class="col-2"></div>
                    <div style="border-radius: 36px; border-color: black; border: solid 2px" class="mt-5 col-3 p-3 mr-3">
                        <!-- Job info -->
                        <div class="form-group">
                            <h3><i style="color: #666666">${cc.title}</i></h3>
                            <hr>
                            <ul class="h5">
                                <li>Company: <b>${com.nameCompany}</b></li>
                                <li>Job Position: <b>${cc.category.categoryName}</b></li>
                                <li>Year Experience: <b>${cc.yearEx}</b></li>
                                <li>Salary: <b>${cc.salary}</b></li>
                                <li>Location: <b>${cc.location}</b></li>
                            </ul>
                        </div>    

                    </div>
                    <div class="col-1"></div>
                    <div style="border-radius: 36px; border-color: black; border: solid 2px" class="mt-5 ml-5 col-4 p-3">
                        <h3>${u.firstName}${u.lastName}</h3>
                        <h6><i style="color: #666666">${u.email}</h6>
                        <hr>
                        <h1 style="font-size: 100px">${point}|${questions.size()}</h1>
                    </div>
                    <div class="col"></div>
                </div>
            </div> 
        </div>
        <!-- header -->

        <c:if test="${not empty questions}">
            <div style="border-radius: 15px; margin-top: -46px;" class="container p-5 bg-dark">
                <div id="questions-container" class="col">
                    <c:forEach var="question" items="${questions}">
                        <div style="border-radius: 15px; background-color: white" class="row p-4 mb-4 question-block">
                            <div class="col">
                                <h4><b class="h3" style="color: #666666">Question:</b> ${question.content}</h4>
                                <hr>
                                <div class="row px-3">
                                    <c:forEach var="answer" items="${questionAnswersMap[question]}">
                                        <c:set var="chosen" value="false"/>
                                        <c:forEach var="chooseAnswer" items="${questionChooseAnswersMap[question]}">
                                            <c:if test="${chooseAnswer.answer.answerID == answer.answerID}">
                                                <c:set var="chosen" value="true"/>
                                            </c:if>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${answer.isTrue == 1}">
                                                <div style="border-radius: 15px; background-color: <c:if test='${chosen}'>#64BB6A</c:if><c:if test='${not chosen}'>#FFD700</c:if>;" class="col-5 p-4 mt-3 mx-4">${answer.answerText}</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="border-radius: 15px; position: relative;" class="col-5 p-4 mt-3 mx-4 <c:if test='${chosen}'>bg-danger text-light</c:if><c:if test='${not chosen}'>bg-dark text-light</c:if>">
                                                    ${answer.answerText}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div> 
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="col-10"></div>
                    <a href="detailCV?UserId=${u.idUser}&ApplyId=${apply.applicationID}" type="submit" style="border-radius: 15px" class="btn btn-light p-2 col-2">
                        <h5> View CV Applied</h5>  

                    </a>
                </div>
            </div>
        </c:if>
        <!-- skill test list end -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
