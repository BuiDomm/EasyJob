<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Skill Test Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            .radio-input {
                display: none;
            }
            .radio-label {
                display: block;
                border-radius: 15px;
                cursor: pointer;
                background-color: #343a40;
                color: white;
            }
            .radio-input:checked + .radio-label {
                background-color: #FBC540;
                color: white;
            }
            .hidden-content {
                display: none;
            }
        </style>
    </head>
    <c:if test="${not empty checktest}">
        <c:redirect url="jobdetails?id=${cc.jobID}"></c:redirect>
    </c:if>
    <body class="bg-dark">
        <!-- Test tutorial Modal start -->
        <div class="modal fade modal-lg" id="exampleModalturor" tabindex="-1" aria-labelledby="exampleModalLabelturor" aria-hidden="true"data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-4 text-black-50" id="exampleModalLabelturor">Dear Jobseeker,</h1>
                        <a href="jobdetails?id=${cc.jobID}" type="button" class="btn-close" aria-label="Close"></a>
                    </div>
                    <div class="modal-body px-5">
                        <h5>Please read the instructions carefully before proceeding.</h5>
                        <div class="px-5">
                            <p class="text-danger">- You only have one chance to take the test.</p>
                            <p  class="text-danger">- Your score will correspond to the number of correct answers.</p>
                            <p style="font-weight: bolder;font-size: 120%" class="text-danger">- Any intentional attempt to leave the page will result in cancellation of your results.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="jobdetails?id=${cc.jobID}" type="button" class="btn btn-secondary">Close</a>
                        <button type="button" class="btn btn-primary" onclick="confirmTutorial()">Start Test</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Test tutorial Modal end -->

        <div id="main-content">
            <nav class="navbar navbar-dark bg-dark px-5 fixed-top">
                <div class="col">
                    <button href="#" class="btn btn-lg btn-outline-light" onclick="scrollToSubmit()">Submit</button>
                </div>
                <div class="col text-light text-center">
                    <h3>${com.nameCompany}</h3>
                    <p>${cc.category.categoryName}</p>
                </div>
                <div class="col d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="button" class="btn btn-lg btn-outline-light" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        X
                    </button>
                </div>
            </nav>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Warning</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            You only have 1 time to take the test
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Continue Test</button>
                            <a href="skilltestcancel?id=${cc.jobID}" type="button" class="btn btn-danger">Cancel Test</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <div style="border-radius: 15px; margin-top: -46px; background-color: #F9F1E7" class="px-5 py-5 text-center container-fluid">
                <div class="p-5 mt-5">
                    <p style="font-family: 'Poppins', sans-serif; font-size: 96px; color: black" class="font-weight-normal pb-5 mt-5 text-uppercase">Let's do it</p>
                    <div class="row px-5">
                        <div class="col-2"></div>
                        <div class="col"></div>
                    </div>
                </div>
            </div>
            <!-- Header -->

            <!-- Skill test list start -->
            <c:if test="${not empty questions}">
                <form action="dotest" method="POST" onsubmit="handleFormSubmit()">
                    <input type="hidden" name="id" value="${cc.jobID}" varStatus="status">
                    <div style="border-radius: 15px; margin-top: -46px; background-color: black" class="container p-5">
                        <div id="questions-container" class="col">
                            <c:set var="counter" value="0" />
                            <c:forEach var="question" items="${questions}">
                                <c:set var="counter" value="${counter + 1}" />
                                <div style="border-radius: 15px; background-color: white" class="row p-4 mb-4 question-block">
                                    <div class="col">
                                        <h4 class="h3" style="color: black">Question ${counter}: ${question.content}</h4>
                                        <hr>
                                        <div class="row px-3">
                                            <c:forEach var="answer" items="${questionAnswersMap[question]}">
                                                <div class="custom-radio col-5 mt-3 mx-4">
                                                    <input type="radio" id="${answer.answerID}" name="question${counter}" value="${answer.answerText}" class="radio-input">
                                                    <label for="${answer.answerID}" class="radio-label p-4">${answer.answerText}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="mt-5 text-center text-light">
                            <h2>All done! Are you ready to submit your test?</h2>
                        </div>
                        <div id="submit-section" class="px-5 d-grid">
                            <button type="submit" href="#" style="border-radius: 15px" class="btn-light d-block p-3 mt-4">
                                <h3 class="text-black" style="margin: auto; font-weight: 700">Submit Test</h3>
                            </button>
                        </div>
                    </div>
                </form>
            </c:if>
            <!-- Skill test list end -->
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script>
                    var isSubmitting = false;


                    function enableTestFunctions() {
                        document.querySelectorAll('input[type="radio"]').forEach(function (radio) {
                            radio.addEventListener('change', function () {
                                const hiddenInputId = 'hidden_' + this.name;
                                let hiddenInput = document.getElementById(hiddenInputId);
                                if (!hiddenInput) {
                                    hiddenInput = document.createElement('input');
                                    hiddenInput.type = 'hidden';
                                    hiddenInput.id = hiddenInputId;
                                    hiddenInput.name = 'chooseanswer[]';
                                    this.closest('form').appendChild(hiddenInput);
                                }
                                hiddenInput.value = this.id;
                            });
                        });

                        document.addEventListener('visibilitychange', function () {
                            if (document.visibilityState === 'hidden' && !isSubmitting) {
                                console.log('The page is now hidden.');
                                window.location.href = 'skilltestcancel?id=${cc.jobID}';
                            }
                        });

                        window.onbeforeunload = function () {
                            if (!isSubmitting) {
                                return "";
                            }
                        };

                        window.onunload = function () {
                            if (!isSubmitting) {
                                cancelSkillTest();
                            }
                        };

                        history.pushState(null, null, window.location.href);
                        window.addEventListener('popstate', function () {
                            var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
                            modal.show();
                            history.pushState(null, null, window.location.href);
                        });
                    }

                    function handleFormSubmit() {
                        isSubmitting = true;
                    }

                    function cancelSkillTest() {
                        var url = 'skilltestcancel?id=${cc.jobID}';
                        var data = new FormData();
                        data.append('action', 'cancelTest');
                        navigator.sendBeacon(url, data);
                    }

                    function confirmTutorial() {
                        var modalElement = document.getElementById('exampleModalturor');
                        var bootstrapModal = bootstrap.Modal.getInstance(modalElement);
                        bootstrapModal.hide();
                        document.getElementById('main-content').classList.remove('hidden-content');
                        enableTestFunctions();
                    }

                    document.addEventListener('DOMContentLoaded', function () {
                        document.getElementById('main-content').classList.add('hidden-content');
                        var modalElement = document.getElementById('exampleModalturor');
                        var bootstrapModal = new bootstrap.Modal(modalElement);
                        bootstrapModal.show();

                    });
                    function scrollToSubmit() {
                        document.getElementById('submit-section').scrollIntoView({behavior: 'smooth'});
                    }
        </script>
    </body>
</html>
