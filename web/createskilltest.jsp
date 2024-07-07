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
                            <!-- Job info -->
                            <div class="form-group">
                                    <h3><i style="color: #666666">Job title: </i><i>${cc.title}</i></h3>
                            <hr>
                            <ul class="h5">
                                <li>Company: <b>${com.nameCompany}</b></li>
                                <li>Job Position: <b>${cc.category.categoryName}</b></li>
                                <li>Year Experience: <b>${cc.yearEx}</b></li>
                                <li>Salary: <b>${cc.salary}</b></li>
                                <li>Location: <b>${cc.location}</b></li>
                            </ul>
                        </div>    
                        <!-- Job info -->
                    </div>

                    <div style="border-radius: 36px; border-color: black; border: solid 2px" class="mt-5 ml-5 col-5 p-3">
                        <!-- Additional content can go here -->
                    </div>
                    <div class="col"></div>
                </div>
            </div> 
        </div>
        <!-- header -->

        <!-- form -->
        <c:if test="${empty questions}">
            <form action="createskilltest" method="post">
                <input type="hidden" name="id" value="${cc.jobID}">
                <div style="border-radius: 15px; margin-top: -46px; background-color: black" class="container p-5">
                    <div id="questions-container" class="col">
                        <div style="border-radius: 15px; background-color: white" class="row p-3 mb-4 question-block">
                            <div class="col">
                                
                                <div class="row mt-5 px-3">
                                    <div class="input-group col mt-3">
                                        <textarea style="border-radius: 24px; border-color: black; border: solid 1px; background-color: white; width: 100%; height: 150px" class="form-control p-4 h3" name="questionTitle[]" placeholder="Question title" wrap="soft" required=""></textarea>
                                    </div>
                                    <div class="input-group col">
                                        <div class="col">
                                            <textarea class="form-control p-4 mt-3 mx-4" style="border-radius: 15px; background-color: #FBC540;" name="answer[]" placeholder="Answer" wrap="soft" required=""></textarea>
                                            <div class="position-relative">
                                                <textarea class="form-control p-4 mt-3 mx-4 bg-dark text-light" style="border-radius: 15px; background-color: #FFF;" name="incorrectanswer[]" placeholder="Incorrect answer" wrap="soft" required=""></textarea>
                                                
                                            </div>
                                            <div class="incorrect-answers-container" data-incorrect-count="1"></div>
                                            <input type="hidden" name="incorrectAnswersCount[]" value="1">

                                            <a href="#" style="border-radius: 15px; background-color: #FBC540" class="btn col mt-3 mx-4" onclick="addIncorrectAnswer(this); return false;">
                                                <p style="margin: auto; color: black">Add incorrect Answer</p>  
                                            </a>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                    <div class="addquestion-container"></div>
                    <a href="#" style="border-radius: 15px; background-color: white" class="btn d-block p-3 mt-4" onclick="addQuestion(); return false;">
                        <h5 style="margin: auto; color: black">Add Question</h5>  
                    </a>   
                    <button type="submit" style="border-radius: 15px; background-color: #FBC540" class="btn d-block p-2 mt-4">
                        <h5 style="margin: auto; color: black">Create Skill Test</h5>  
                    </button>
                </div>
            </form>
        </c:if>
        <!-- form end -->

        <!-- skill test list start -->
        <c:if test="${not empty questions}">
            <div style="border-radius: 15px; margin-top: -46px; background-color: black" class="container p-5">
                <div id="questions-container" class="col">
                    <c:forEach var="question" items="${questions}">
                        <div style="border-radius: 15px; background-color: white" class="row p-4 mb-4 question-block">
                            <div class="col">
                                <h4><b class="h3" style="color: #666666">Question:</b> ${question.content}</h4>
                                <hr>
                                <div class="row px-3">
                                    <c:forEach var="answer" items="${questionAnswersMap[question]}">
                                        <c:if test="${answer.isTrue eq 1}">
                                            <div style="border-radius: 15px; background-color: #FBC540" class="col-5 p-4 mt-3 mx-4">${answer.answerText}</div>
                                        </c:if>
                                        <c:if test="${answer.isTrue eq 0}">
                                            <div style="border-radius: 15px; position: relative;" class="col-5 p-4 mt-3 mx-4 bg-dark text-light">
                                                ${answer.answerText}
                                                
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div> 
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <a href="updateskilltest?id=${cc.jobID}" style="border-radius: 15px; background-color: #FBC540" class="btn d-block p-3 mt-4">
                    <h5 style="margin: auto; color: black">Update Skill Test</h5>  
                </a>   
            </div>
        </c:if>
        <!-- skill test list end -->

        <!-- jQuery and Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>
        <script>
                                                    function addIncorrectAnswer(button) {
                                                        const container = button.parentElement.querySelector('.incorrect-answers-container');
                                                        let incorrectAnswerCount = parseInt(container.getAttribute('data-incorrect-count'));
                                                        if (incorrectAnswerCount >= 3) {
                                                            alert('Maximum 3 incorrect answers');
                                                            return;
                                                        }

                                                        incorrectAnswerCount++;
                                                        const wrapper = document.createElement('div');
                                                        wrapper.className = 'position-relative mt-3';
                                                        wrapper.innerHTML = `
            <textarea class="form-control p-4 mx-4 bg-dark text-light" style="border-radius: 15px; background-color: #FFF; height: 100px;" name="incorrectanswer[]" placeholder="Incorrect Answer" wrap="soft" required></textarea>
            <a onclick="this.parentElement.remove();" style="color: white; position: absolute; top: 5px; right: -20px; z-index: 10" class="close btn">&times;</a>
        `;

                                                        container.appendChild(wrapper);

                                                        container.setAttribute('data-incorrect-count', incorrectAnswerCount);

                                                        const incorrectCountInput = container.parentElement.querySelector('input[name="incorrectAnswersCount[]"]');
                                                        incorrectCountInput.value = incorrectAnswerCount;
                                                    }


                                                    function addQuestion() {
                                                        const questionContainer = document.getElementById('questions-container');
                                                        const questionBlock = document.createElement('div');
                                                        questionBlock.className = 'question-block row p-3 mb-4';
                                                        questionBlock.style.borderRadius = '15px';
                                                        questionBlock.style.backgroundColor = 'white';

                                                        questionBlock.innerHTML = `
                    <div class="col">
                        <a onclick="this.parentElement.parentElement.remove();" style="color: red; z-index: 10; font-size: 46px; margin-right: -30px; margin-top: -20px" class="close closeq btn">&times;</a>
                        <div class="row mt-5 px-3">
                            <div class="input-group col">
                                <textarea style="border-radius: 24px; border-color: black; border: solid 1px; background-color: white; width: 100%; height: 150px" class="form-control p-4 h3" name="questionTitle[]" placeholder="Question title" wrap="soft" required=""></textarea>
                            </div>
                            <div class="input-group col">
                                <div class="col">
                                    <textarea class="form-control p-4 mt-3 mx-4" style="border-radius: 15px; background-color: #FBC540;" name="answer[]" placeholder="Answer" wrap="soft" required=""></textarea>
                                    <div class="position-relative">
                                        <textarea class="form-control p-4 mt-3 mx-4 bg-dark text-light" style="border-radius: 15px; background-color: #FFF;" name="incorrectanswer[]" placeholder="Incorrect answer" wrap="soft" required=""></textarea>
                                        
                                    </div>
                                    <div class="incorrect-answers-container" data-incorrect-count="1"></div>
                                    <input type="hidden" name="incorrectAnswersCount[]" value="1">
                                    <a href="#" style="border-radius: 15px; background-color: #FBC540" class="btn col mt-3 mx-4" onclick="addIncorrectAnswer(this); return false;">
                                        <p style="margin: auto; color: black">Add incorrect Answer</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                                                        questionContainer.appendChild(questionBlock);
                                                    }
        </script>
    </body>
</html>
