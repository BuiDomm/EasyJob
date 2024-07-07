<%-- 
    Document   : blank
    Created on : 21 thg 5, 2024, 14:59:46
    Author     : ducanh2192003
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">
        <!--        <link rel="stylesheet" href="../css/spur.css">-->
        <!--        <link rel="stylesheet" href="./assets/css/main.min.css" />-->
        <link href="./assets/css/spur.css" rel="stylesheet" type="text/css"/>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="./assets/js/chart-js-config.js"></script>



    </head>

    <body>
        <div class="dash">
            <div class="dash-nav dash-nav-dark">
                <%@include file="sidebar.jsp" %>
            </div>
            <div class="dash-app">
                <%@include file="header.jsp" %>
                <main class="dash-content">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card spur-card">
                                <div class="card-header bg-success" style="color: white">
                                    <div class="spur-card-icon">
                                        <i class="fas fa-table"></i>
                                    </div>
                                    <div class="spur-card-title">List Job Active</div>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-in-card ">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th class="text-center" scope="col">Title</th>
                                                <th  class="text-center" scope="col">User</th>
                                                <th class="text-center" scope="col">Content</th>
                                                <th class="text-center"  scope="col">Date</th> 
                                                <th class="text-center"  scope="col">Edit</th>
                                                <th class="text-center"  scope="col">Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="j" items="${listc}" varStatus="i">
                                                <tr>
                                                    <th scope="row">${i.index + 1}</th>
                                                    <td class="text-center">${dao.getBlogById(j.blogId).title}</td>
                                                    <td class="text-center"  >${dao.getUserById(j.userId).email}</td>
                                                    <td class="text-center"  >${j.content}</td>
                                                    <td class="text-center" >${j.date}</td>                                                 
                                                    <td class="d-flex flex-row justify-content-center">
                                                        <a href="#" onclick="showMess(${j.commentId}, '${j.content}', '${dao.getUserById(j.userId).email}', 'adminDeleteComment?cid=')" >
                                                            <button class="btn btn-outline-danger btn-sm mr-2" data-bs-toggle="tooltip"
                                                                    data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary"
                                                                    >
                                                                <i class="fas fa-trash" ></i>
                                                            </button>
                                                        </a>


                                                        <a href="adminBanAndDelete?cid=${j.commentId}" >
                                                            <button class="btn btn-outline-info btn-sm mr-2" data-bs-toggle="tooltip"
                                                                    data-bs-placement="top" data-bs-custom-class="custom-tooltip-primary"
                                                                    >
                                                                <i class="fas fa-ban" ></i>
                                                            </button>
                                                        </a>



                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center justify-content-center">                                           
                                                            <a class="bg-primary" style="color: white ; padding:  5px 10px" href="adminBlogAndComment?id=${j.blogId}&&cid=${j.commentId}">Detail</a>
                                                        </div>
                                                    </td>

                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <nav aria-label="Page navigation example ">
                        <ul class="pagination justify-content-end ">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li class="page-item"><a class="page-link" href="adminListComment?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </main>
            </div>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                                            function showMess(id, content, email, url) {
                                                                console.log(url + id);
                                                                var option = confirm('Are you sure you want to delete this comment?\n' +
                                                                        'Content: ' + content + '\n' +
                                                                        'Email name: ' + email);
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

                                                            }


        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="./assets/js/spur.js"></script>

    </body>

</html>
