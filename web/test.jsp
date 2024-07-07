<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Tutorial Modal</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body.modal-open .content {
            filter: blur(5px); /* Optional: to blur the content when the modal is open */
            pointer-events: none; /* Prevents interaction with the content */
        }
    </style>
</head>
<body>


    <div class="content">
        <!-- Page content goes here -->
        <h1>Welcome to the Test Page</h1>
        <p>This is the main content of the page.</p>
    </div>


<!-- Test tutorial Modal start -->
<div class="modal fade" id="exampleModalturor" tabindex="-1" aria-labelledby="exampleModalLabelturor" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelturor">Test Tutorial</h1>
                <a href="jobdetails?id=${cc.jobID}" type="button" class="btn-close" aria-label="Close"></a>
            </div>
            <div class="modal-body px-5">
                <h5>Please read the instructions carefully before proceeding.</h5>
                <div class="px-5">
                    <p class="text-danger">- You only have one chance to take the test.</p>
                    <p class="text-danger">- Your score will correspond to the number of correct answers.</p>
                    <p class="text-danger">- Any intentional attempt to leave the page will result in cancellation of your results.</p>
                    <p class="text-danger">- Good luck to everyone.</p>
                </div>
            </div>
            <div class="modal-footer">
                <a href="jobdetails?id=${cc.jobID}" type="button" class="btn btn-secondary">Close</a>
                <button type="button" class="btn btn-primary" id="confirmTutorial">Start Test</button>
            </div>
        </div>
    </div>
</div>
<!-- Test tutorial Modal end -->

<script>
   window.onbeforeunload = function (e) {
    if (!isSubmitting) {
        var url = 'skilltestcancel?id=${cc.jobID}';
        var data = new FormData();
        data.append('action', 'cancelTest');
        navigator.sendBeacon(url, data);
    }
};

</script>

</body>
</html>



<!--  Test tutorial Modal start 
        <div class="modal fade modal-lg" id="exampleModalturor" tabindex="-1" aria-labelledby="exampleModalLabelturor" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabelturor"> Test Tutorial</h1>
                        <a href="jobdetails?id=${cc.jobID}"type="button" class="btn-close" aria-label="Close"></a>
                    </div>
                    <div class="modal-body px-5">

                        <h5>Please read the instructions carefully before proceeding.</h5>  
                        <div class="px-5">
                            <p class="text-danger">- You only have one chance to take the test.</p>
                            <p class="text-danger">- Your score will correspond to the number of correct answers.</p>
                            <p class="text-danger">- Any intentional attempt to leave the page will result in cancellation of your results.</p>
                            <p class="text-danger">- Good luck to everyone.</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="jobdetails?id=${cc.jobID}" type="button" class="btn btn-secondary" >Close</a>
                        <button type="button" class="btn btn-primary" onclick="confirmTutorial()">Start Test</button>
                    </div>
                </div>
            </div>
        </div>
         Test tutorial Modal end -->