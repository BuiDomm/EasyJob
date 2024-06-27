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
                            </ul><h1>${mess}</h1>
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
        <c:if test="${empty questions}">
            <c:redirect url="loadskilltest?id=${cc.jobID}"></c:redirect>
        </c:if>
        <c:if test="${not empty questions}">

            <form action="updateskilltest" method="post">
                <input type="hidden" name="id" value="${cc.jobID}" varStatus="status">
                <div style="border-radius: 15px; margin-top: -46px; background-color: black" class="container p-5">
                    <div id="questions-container" class="col">
                        <c:forEach var="question" items="${questions}">
                            <input type="hidden" name="questionID[]" value="${question.questionID}">
                            <div  id="question-${question.questionID}" style="border-radius: 15px; background-color: white" class="row p-4 mb-4 question-block">

                                <div class="col">
                                    <a onclick="handledeletequestion('${question.questionID}',${cc.jobID})" style="color: red; z-index: 10;font-size: 46px;margin-right: -30px;margin-top: -24px" class="close btn">&times;</a>  
                                    <div class="row mt-3 px-3">
                                        <h3 class="mb-3">Question title:</h3>
                                        <textarea style="border-radius: 24px; border-color: black; border: solid 1px; background-color: white;width: 100%" class="form-control p-4 h3" name="questionTitle[]" placeholder="Question title" wrap="soft" required="">${question.content}</textarea>

                                        <hr>
                                        <c:set var="incorrectCount" value="0"/>
                                        <c:forEach var="answer" items="${questionAnswersMap[question]}">
                                            <c:choose>
                                                <c:when test="${answer.isTrue == 1}">
                                                    <textarea class="form-control col-5 p-4 mt-3 mx-4" style="border-radius: 15px; background-color: #FBC540;" name="correctAnswer[]" wrap="soft" required="">${answer.answerText}</textarea>
                                                    <input type="hidden" name="answerID[]" value="${answer.answerID}">
                                                </c:when>
                                                <c:otherwise>
                                                    <div id="answer-${answer.answerID}" class="textarea-container col-5 p-4 mt-3 mx-4 bg-dark text-light" style="border-radius: 15px; position:relative;">
                                                        <textarea class="form-control" style="height: 100%; padding: 10px; border: none; background-color: transparent; color: #FFF;" name="incorrectAnswer[]" wrap="soft" required="">${answer.answerText}</textarea>
                                                        <c:if test="${incorrectCount >= 1}">
                                                            <a onclick="handledeleteanswer(${answer.answerID},${cc.jobID})" style="color: white; position: absolute; top: 5px; right: 5px; z-index: 10" class="close btn ">&times;</a>
                                                        </c:if>
                                                        <input type="hidden" name="incorrectanswerID[]" value="${answer.answerID}">
                                                    </div>

                                                    <c:set var="incorrectCount" value="${incorrectCount + 1}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <input type="hidden" name="incorrectAnswersCount[]" value="${incorrectCount}">

                                        <c:if test="${incorrectCount < 3}">
                                            <a href="#" style="border-radius: 15px; border-color: black; border: solid 2px; background-color: white;" class="col-5 p-4 mt-3 mx-4 btn-lg text-center text-dark" onclick="addIncorrectAnswer(this); return false;">
                                                Add Incorrect Answer
                                            </a>

                                        </c:if>
                                        <div style="padding: 0" class="add-incorrect-answers-container" data-add-incorrect-count="0" ></div>
                                        <input type="hidden" name="addincorrectAnswersCount[]" value="0" placeholder="Correct Answer">
                                    </div> 
                                </div>

                            </div>
                        </c:forEach>
                    </div> 

                    <div class="container px-5">
                        <div class=" px-5">
                            <a href="#" style="border-radius: 15px; background-color: white" class="btn d-block p-3 mt-4" onclick="addQuestion(); return false;">
                                <h5 style="margin: auto; color: black">Add Question</h5>  
                            </a>
                        </div>
                    </div>
                    <div class="container px-5">
                        <button type="submit" style="border-radius: 15px; background-color: #FBC540" class="btn p-4 mt-4 container">
                            <h5 style="margin: auto; color: white">Update Skill Test</h5>  
                        </button>
                    </div>

                </div>
            </form>
        </c:if>
        <!-- form end -->

        <!-- jQuery and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                function addIncorrectAnswer(button) {
                                    const container = button.parentElement.querySelector('.add-incorrect-answers-container');
                                    let addincorrectcount = parseInt(container.getAttribute('data-add-incorrect-count'));
                                    var elements = document.getElementsByName('incorrectAnswersCount[]');
                                    const allQuestionBlocks = document.querySelectorAll('.question-block');
                                    const currentQuestionBlock = button.closest('.question-block');
                                    var questionIndex = Array.from(allQuestionBlocks).indexOf(currentQuestionBlock);
                                    var oldincorrect = parseInt(elements[questionIndex].value);

                                    if ((oldincorrect + addincorrectcount) >= 3) {
                                        alert('Maximum 3 incorrect answers');
                                        return;
                                    }

                                    addincorrectcount++;
                                    const textareaDiv = document.createElement('div');
                                    textareaDiv.className = 'textarea-container col-5 p-4 mt-3 mx-4 bg-dark text-light';
                                    textareaDiv.style.borderRadius = '15px';
                                    textareaDiv.style.position = 'relative';
                                    textareaDiv.innerHTML = `
            <textarea class="form-control" style="height: 100%; padding: 10px; border: none; background-color: transparent; color: #FFF;" name="addincorrectAnswer[]" wrap="soft" required></textarea>
            <a style="color: white; position: absolute; top: 5px; right: 5px; z-index: 10" class="close btn">&times;</a>
        `;

                                    const closeButton = textareaDiv.querySelector('.close');
                                    closeButton.onclick = function () {
                                        textareaDiv.remove();
                                        updateIncorrectCount(container, -1);
                                    };

                                    button.before(textareaDiv);
                                    updateIncorrectCount(container, 1);
                                }

                                function updateIncorrectCount(container, delta) {
                                    let addincorrectcount = parseInt(container.getAttribute('data-add-incorrect-count'));
                                    addincorrectcount += delta;
                                    container.setAttribute('data-add-incorrect-count', addincorrectcount);

                                    const addincorrectCountInput = container.parentElement.querySelector('input[name="addincorrectAnswersCount[]"]');
                                    addincorrectCountInput.value = addincorrectcount;
                                }

                                function handledeleteanswer(idAns, jobid) {
                                    if (confirm("Do you really want to delete this Answer?")) {
                                        $.ajax({
                                            url: "deleteanswer?ansid=" + idAns + "&id=" + jobid,
                                            type: 'GET',
                                            success: function (response) {
                                                
                                                console.log('Answer deleted successfully');
                                                $('#answer-' + idAns).remove();  
                                                alert('Answer deleted successfully');

                                            },
                                            error: function (jqXHR) {

                                            }

                                        });
                                    }
                                }
                                function handledeletequestion(idQues, jobid) {
                                    if (confirm("Do you really want to delete this Question?")) {

                                        $.ajax({
                                            url: "deletequestion?quesid=" + idQues + "&id=" + jobid,
                                            type: 'GET',
                                            success: function (response) {
                                                console.log('Question deleted successfully');
                                                $('#question-' + idQues).remove();
                                                alert('Question deleted successfully');

                                            },
                                            error: function (jqXHR) {

                                            }

                                        });
                                    }
                                }

                                function addQuestion() {
                                    const questionContainer = document.getElementById('questions-container');
                                    const questionBlock = document.createElement('div');
                                    questionBlock.className = 'question-block row p-3 mb-4';
                                    questionBlock.style.borderRadius = '15px';
                                    questionBlock.style.backgroundColor = 'white';

                                    questionBlock.innerHTML = `
            <div class="col">
                <a style="color: red; z-index: 10;font-size: 46px;margin-right: -30px;margin-top: -24px" class="close closeq btn">&times;</a>
                <div class="row px-3 mt-3">
                    <h3 class="mb-3">Question title:</h3>
                    <textarea style="border-radius: 24px; border-color: black; border: solid 1px; background-color: white;width: 100%" class="form-control p-4 h3" name="addquestionTitle[]" placeholder="Question title" wrap="soft" required=""></textarea>
                    <hr>
                    <textarea class="form-control col-5 p-4 mt-3 mx-4" style="border-radius: 15px; background-color: #FBC540;" name="addcorrectAnswer[]" placeholder="Correct Answer" wrap="soft" required=""></textarea>
                    
                    <div class="textarea-container col-5 p-4 mt-3 mx-4 bg-dark text-light" style="border-radius: 15px; position:relative;">
                        <textarea class="form-control" style="height: 100%; padding: 10px; border: none; background-color: transparent; color: #FFF;" name="addincorrectAnswer[]"placeholder="Incorrect Answer" wrap="soft" required=""></textarea>
                        
                    </div>
                    <input type="hidden" name="incorrectAnswersCount[]" value="0">
                    <a href="#" style="border-radius: 15px; border-color: black; border: solid 2px; background-color: white;" class="col-5 p-4 mt-3 mx-4 btn-lg text-center text-dark" onclick="addIncorrectAnswer(this); return false;">
                                                Add Incorrect Answer
                     </a>
                    <div style="padding: 0" class="add-incorrect-answers-container" data-add-incorrect-count="1" ></div>
                                        <input type="hidden" name="addincorrectAnswersCount[]" value="1">
                </div>
            </div>
        `;

                                    const closebutton = questionBlock.querySelector('.closeq');
                                    closebutton.onclick = function () {
                                        questionBlock.remove();
                                    };
                                    questionContainer.appendChild(questionBlock);

                                }



        </script>


    </body>
</html>
