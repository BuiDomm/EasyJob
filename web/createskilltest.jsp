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
            <p style="font-family: 'Poppins', sans-serif; font-size: 96px; color: black" class="font-weight-normal pb-5 mt-5">Creating Skill Test Page</p>
            <div class="row px-5">
                <div class="col-2"></div>
                <div style="border-radius: 36px; border-color: black; border: solid 2px" class="mt-5 col-3 p-3 mr-3">
                    <%-- Job info--%>
                    <div class="form-group">
                        <h3><i style="color: #666666">Job title: </i><i>${cc.title}</i></h3>
                        <hr>
                        <ul class="h5">
                            <li>Company: <b>ABC</b></li>
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
    <form action="createskilltest" method="post">
         <input type="hidden" name="id" value="${cc.jobID}">
        <div style="border-radius: 15px; margin-top: -46px; background-color: black" class="container p-5">
            <div id="questions-container" class="col">

                <div style="border-radius: 15px; background-color: white" class="row p-3 mb-4">
                    <div class="col">

                        <hr>
                        <div class="row px-3">
                            <div class="input-group col">
                                <input type="text" class="form-control" name="questionTitle[]" placeholder="Question title">
                            </div>
                            <div class="input-group col">
                                <div class="col">
                                    <input type="text" class="form-control" name="answer[]" placeholder="Answer">
                                    <div class="incorrect-answers-container"></div>
                                    <a href="#" style="border-radius: 15px; background-color: #FBC540" class="btn col mt-3" onclick="addIncorrectAnswer(this); return false;">
                                        <p style="margin: auto; color: black">Add incorrect Answer</p>  
                                    </a>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="addquestion-container"></div>
            </div> 

            <a href="#" style="border-radius: 15px; background-color: white" class="btn d-block p-3 mt-4" onclick="addQuestion(); return false;">
                <h5 style="margin: auto; color: black">Add Question</h5>  
            </a>   
            <button type="submit" style="border-radius: 15px; background-color: #FBC540" class="btn d-block p-2 mt-4">
                <h5 style="margin: auto; color: black">Create Skill Test</h5>  
            </button>
        </div>
    </form>
    <!-- form end -->

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>
    <script>
        let incorrectAnswerCount = 0;

        function addIncorrectAnswer(button) {
            const container = button.parentElement.querySelector('.incorrect-answers-container');
            if (incorrectAnswerCount >= 3) {
                alert('Maximum 3 incorrect answers');
                return;
            }

            const input = document.createElement('input');
            input.type = 'text';
            input.className = 'form-control mt-3';
            input.placeholder = 'Incorrect Answer';
            input.name = 'incorrectAnswer[]';
            container.appendChild(input);

            incorrectAnswerCount++;
        }

        function addQuestion() {
            const questionsContainer = document.querySelector('.addquestion-container');

            const newQuestion = document.createElement('div');
            newQuestion.className = 'row p-3 mb-4 question-item';
            newQuestion.style.backgroundColor = 'white';
            newQuestion.style.borderRadius = '15px';

            newQuestion.innerHTML = `
                <div class="col">
                    <hr>
                    <div class="row px-3">
                        <div class="input-group col">
                            <input type="text" class="form-control" name="questionTitle[]" placeholder="Question title">
                        </div>
                        <div class="input-group col">
                            <div class="col">
                                <input type="text" class="form-control" name="answer[]" placeholder="Answer">
                                <div class="incorrect-answers-container"></div>
                                <a href="#" style="border-radius: 15px; background-color: #FBC540" class="btn col mt-3" onclick="addIncorrectAnswer(this); return false;">
                                    <p style="margin: auto; color: black">Add incorrect Answer</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            `;

            questionsContainer.appendChild(newQuestion);

            incorrectAnswerCount = 0;
        }
    </script>
</body>
</html>
