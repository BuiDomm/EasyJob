
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">x
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">

        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <link rel="stylesheet" href="./assets/css/admincss.css">

    </head>

    <style>
        .card {
            width: 100%;
            height: 100%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            border-radius: 5px; /* Rounded corners */
            padding: 16px;
            background-color: #f1f1f1; /* Light grey background */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .card h5 {
            font-size: 18px;
            color: grey;
            margin-bottom: 20px;
        }

        .card img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            object-fit: cover;
        }

        .card p {
            font-size: 14px;
            color: #333;
        }

    </style>

    <body>

        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <%@include file="sidebar.jsp" %>
            </div>
            <div class="dash-app">
                <%@include file="header.jsp" %>
                <main class="dash-content" style="padding-top: 0 !important;">
                    <div class="container-fluid" >
                        <div class="row">
                            <div class="card">
                                <h1 style="font-weight: bolder">${b.title}</h1>
                                <p>Posted on <span style="font-style: italic">${b.date}</span> create by <span style="font-weight: 600">${dao.getUserByBlogId(b.blogId).getFirstName()}</span> </p>
                                <div>
                                    <img style="object-fit: cover;height:600px" src=" ${b.image}" alt="" >
                                </div>

                                <p>${b.content}</p>

                                <div class="card-body" style="border-top: 1px solid gainsboro">
                                    <div class="d-flex mb-4">
                                        <!-- Parent comment-->
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                                        <div class="ms-3">
                                            <div class="fw-bold" style="font-weight: bolder">${dao.getUserByCommentId(c.commentId).getFirstName()} ${dao.getUserByCommentId(c.commentId).getLastName()}</div>
                                            ${c.content}
                                        </div>
                                    </div>

                                </div>
                                <div class="row justify-content-end">
                                    <div class="col-2">
                                        <a onclick="showMess('${c.commentId}',
                                                        'adminDeleteComment?cid=', '${c.content}', '${dao.getUserByCommentId(c.commentId).getFirstName()} ${dao.getUserByCommentId(c.commentId).getLastName()}')"  
                                           class="btn btn-block btn-danger btn-md text-white">Delete Comment</a>
                                    </div>
                                    <div class="col-2">
                                        <a   href="adminBanAndDelete?cid=${c.commentId}" class="btn btn-block btn-info btn-md text-white">Ban Account</a>
                                    </div>
                                </div>
                            </div>
                        </div>             
                    </div>
                </main>
            </div>


            <!-- Popup Start -->
            <div class="modal" tabindex="-1" role="dialog" id="rejectModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header d-flex justify-content-between">
                            <h5 class="modal-title">Delete Reason</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">x</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="rejectForm">
                                <div class="form-group">
                                    <label for="rejectReason">Reason:</label>
                                    <textarea class="form-control" id="rejectReason" rows="3" required></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="saveBtn">Save changes</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Popup End -->
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                                            function showMess(id, url, title, name, key) {
                                                                var option = confirm('Are you sure you want to delete this comment?\n' +
                                                                        'Title: ' + title + '\n' +
                                                                        'Account name: ' + name);
                                                                if (option === true) {
                                                                    // Show the modal
                                                                    $('#rejectModal').modal('show');
                                                                    $('.close').click(function () {
                                                                        $('#rejectModal').modal('hide');
                                                                    });
                                                                    // When the save button is clicked
                                                                    $('#saveBtn').click(function () {
                                                                        var reason = $('#rejectReason').val();
                                                                        if (reason.trim() === "") {
                                                                            alert("Must input reason to continue");
                                                                            return;
                                                                        }
                                                                        $.ajax({
                                                                            url: url + id,
                                                                            type: 'GET',
                                                                            data: {
                                                                                'reason': reason
                                                                            }, contentType: 'application/x-www-form-urlencoded',
                                                                            success: function () {
                                                                                // Close the modal
                                                                                console.log("ok");
                                                                                $('#rejectModal').modal('hide');
                                                                                window.location.href = 'adminListComment';

                                                                            }
                                                                        });
                                                                    });
                                                                }

                                                            }</script>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>
    </body>

</html>
