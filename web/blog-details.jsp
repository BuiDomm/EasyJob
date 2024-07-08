<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="codepixer">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Job Listing</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
        <!--
            CSS
            ============================================= -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/images/favicon.ico">
        <link rel="stylesheet" href="assets/css/icontop.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">

        <link rel="stylesheet" href="assets/css/button.css">

        <style>
            .reply-btn {
                position: relative;
                display: inline-block;
            }

            .btn-reply {
                background-color: transparent;
                color: black;
                border: 1px solid black;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 5px; /* Rounded corners for the Edit button */
                transition: background-color 0.3s ease;
                margin-right: 10px; /* Adjust margin between buttons if needed */
            }

            .btn-reply:hover {
                background-color: #f0f0f0; /* Light background on hover */
            }

            .report-options {
                display: none;
                position: absolute;
                background-color: #ffffff;
                border: 1px solid #ccc;
                padding: 5px;
                z-index: 1;
                border-radius: 5px; /* Rounded corners for the report options */
            }

            .reply-btn:hover .report-options {
                display: block; /* Show options on hover */
            }

            .report-options a {
                display: block;
                color: black;
                text-decoration: none;
                padding: 5px;
                border-radius: 5px; /* Rounded corners for the Delete link */
            }

            .report-options a:hover {
                background-color: #f0f0f0; /* Light background on hover */
            }


            .custom-btn {
                background-color: red;
                color: white;
                padding: 8px 16px;
                border: 2px solid red;
                border-radius: 20px;
                text-decoration: none;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .custom-btn:hover {
                background-color: transparent;
                color: red;
            }

            .bottom-meta .list-inline-item a {
                font-size: 16px;
            }

            .bottom-meta .list-inline-item a span {
                font-size: 20px;
                margin-right: 5px;
            }

            .thumb {
                position: relative;
                text-align: center; /* Center align the button under the image */
            }

            .thumb img {
                display: block;
                margin: 0 auto;
            }

            .report-button {
                display: block;
                margin: 10px auto 0 auto; /* 10px margin above the button */
                background-color: grey;
                color: white;
                padding: 2px 5px;
                border: none;
                cursor: pointer;
                width: 60px;
                text-align: center;
                border-radius: 5px; /* Make corners rounded */
            }

            .report-button:hover {
                background-color: darkred;
            }

            .liked {
                color: red;
            }

            .fa-heart {
                cursor: pointer;
            }
            .single-recent-post {
                display: flex;
                margin-bottom: 10px;
            }

            .recent-thumb {
                flex: 0 0 80px;
            }

            .recent-details {
                flex: 1;
                margin-left: 10px;
            }

            .recent-details h4 {
                white-space: wrap;
                overflow: hidden;


            }

            .recent-details p {
                margin-top: 5px;
            }

        </style>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-CjSoe/3R+BlI/YfXEBos+tF5LuUfwWUGsHc9d/jdSvHt1oM8uDbbv5U3u6W7czmT" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                var uid = "${sessionScope.account.idUser}";
                var bid = "${blog.blogId}";

                // Check like status on page load
                $.ajax({
                    url: "${pageContext.request.contextPath}/checkLikeStatus",
                    type: "GET",
                    data: {
                        uid: uid,
                        bid: bid
                    },
                    success: function (response) {
                        if (response) {
                            $("#likeIcon").addClass("fas liked").removeClass("far");
                        } else {
                            $("#likeIcon").addClass("far").removeClass("fas liked");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });

                // Handle like button click
                $(".like-button").on("click", function (e) {
                    e.preventDefault();

                    $.ajax({
                        url: "${pageContext.request.contextPath}/likeBlogs",
                        type: "GET",
                        data: {
                            uid: uid,
                            bid: bid
                        },
                        success: function (response) {
                            // Update the like count in the UI
                            $("#likeCount").text(response);
                            $("#likeIcon").toggleClass("fas liked").toggleClass("far");
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                });

                // Handle edit comment button click
                $(".btn-edit").on("click", function () {
                    var commentId = $(this).data("comment-id");
                    var content = $(this).closest(".single-comment").find(".comment").text();
                    $("#editCommentContent").val(content);
                    $("#editCommentId").val(commentId);
                    $("#editCommentModal").modal("show");
                });

                // Handle save comment button click
                $("#saveCommentBtn").on("click", function () {
                    var commentId = $("#editCommentId").val();
                    var content = $("#editCommentContent").val();

                    $.ajax({
                        url: "${pageContext.request.contextPath}/editComment",
                        type: "POST",
                        data: {
                            commentId: commentId,
                            content: content
                        },
                        success: function (response) {
                            if (response.success) {
                                // Update the comment content in the DOM
                                $("button[data-comment-id='" + commentId + "']").closest(".single-comment").find(".comment").text(content);
                                $("#editCommentModal").modal("hide");
                            } else {
                                alert("Failed to update comment.");
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                });
            });

            document.addEventListener('DOMContentLoaded', function () {
                const titles = document.querySelectorAll('.influence-post-title');
                titles.forEach(title => {
                    const maxLength = 30;
                    if (title.textContent.length > maxLength) {
                        const words = title.textContent.split(' ');
                        if (words.length > 3) {
                            title.textContent = words.slice(0, 3).join(' ') + '...';
                        } else {
                            title.textContent = title.textContent.slice(0, maxLength) + '...';
                        }
                    }
                });
            });

        </script>
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <c:choose>
                        <c:when test="${sessionScope.account == null}">
                            <a style="width: 55px;height: 55px;display: inline-block" class="navbar-brand" href="index.jsp">
                            </c:when>
                            <c:otherwise> 
                                <a style="width: 55px;height: 55px;display: inline-block" class="navbar-brand" href="home">

                                </c:otherwise>

                            </c:choose>
                            <figure style="width: 100%;height: 100%;margin-right: -30px;">
                                <img style="height: 100%;width: 100%;object-fit: cover;" src="./assets/images/easyjobb.png" alt="alt"/>
                            </figure>

                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <c:choose>
                                        <c:when test="${sessionScope.account == null}">
                                            <a class="nav-link" href="index.jsp">Home
                                            </c:when>
                                            <c:otherwise> 
                                                <a class="nav-link" href="home">Home

                                                </c:otherwise>

                                            </c:choose>
                                            <span class="sr-only">(current)</span>
                                        </a>
                                </li> 
                                <li class="nav-item"><a class="nav-link" href="paging?id=1">Jobs</a></li>

                                <li class="nav-item active"><a class="nav-link" href="about-us.jsp">About us</a></li>

                                <li class="nav-item"><a class="nav-link" href="blogs">Blog</a></li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">More</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="team.jsp">Team</a>

                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/companyList">Enterprise</a>

                                        <a class="dropdown-item" href="terms.jsp">Terms</a>
                                        <c:choose>
                                            <c:when test="${sessionScope.account != null}">
                                                <a class="dropdown-item" href="./CVSeeker">CV Profile</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/favoriteJobList">List saved job</a>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </li>

                                <li class="nav-item"><a class="nav-link" href="managerblog">Manager Blog</a></li>
                            </ul>
                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <div style="display: flex;align-items: center;margin-left: 100px;">
                                        <div style="display: flex;max-height: 45px;margin-bottom: 15px;">
                                            <a style="--clr:#ff6600" class="button" href="login.jsp">
                                                <span class="button__icon-wrapper">
                                                    <svg width="10" class="button__icon-svg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>

                                                    <svg class="button__icon-svg  button__icon-svg--copy" xmlns="http://www.w3.org/2000/svg" width="10" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>
                                                </span>
                                                Find A Job
                                            </a>

                                        </div>
                                        <div style="display: flex;max-height: 45px;margin-bottom: 15px; margin-left: 20px">
                                            <a style="--clr:#7808d0 " class="button" href="loginemployeer.jsp">
                                                <span class="button__icon-wrapper">
                                                    <svg width="10" class="button__icon-svg" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>

                                                    <svg class="button__icon-svg  button__icon-svg--copy" xmlns="http://www.w3.org/2000/svg" width="10" fill="none" viewBox="0 0 14 15">
                                                    <path fill="currentColor" d="M13.376 11.552l-.264-10.44-10.44-.24.024 2.28 6.96-.048L.2 12.56l1.488 1.488 9.432-9.432-.048 6.912 2.304.024z"></path>
                                                    </svg>
                                                </span>
                                                Post A Job
                                            </a>

                                        </div>
                                    </div>
                                </c:when >
                                <c:otherwise >
                                    <ul class="example-2" style="display: flex;max-height: 45px;margin-left: 120px;margin-bottom: 15px;">
                                        <div class="shadow-lg d-none" id="boxNotification" style="position: absolute; background: white; top: 80%;width: 400px">
                                            <h5 class="fw-semibold px-3 py-2 m-0 d-flex justify-content-between">Notifications
                                                <a href="readAll" class="btn btn-info float-end ">Read All</a></h5>
                                                <c:set var="newNotification" value="${notidao.getNewNotificationsesByAccount(sessionScope.account.getIdUser())}" />
                                                <c:forEach var="n" items="${newNotification}">
                                                <a href="javascript:void(0)" class="dropdown-item ">
                                                    <div class="d-flex align-items-start py-2 " style=" white-space: nowrap;
                                                         overflow: hidden;
                                                         text-overflow: ellipsis;
                                                         ${n.readStatus == 1 ? '':'opacity:0.5;'} ">

                                                        <div class="m-0 d-flex justify-content-between ">
                                                            <span class="${n.readStatus == 1 ? ' bg-primary badge rounded-pill h-100 ':'' }"> </span>
                                                            <h6 class="mb-1 fw-semibold">${fn:substring(n.time, 0, 10)}  
                                                                &nbsp;&nbsp;&nbsp;&nbsp;</h6>
                                                            <p class="mb-1">${n.message}</p>

                                                        </div>
                                                    </div>
                                                </a>
                                            </c:forEach>
                                            <div class="d-grid p-3 border-top w-100">
                                                <a href="notifications" class="btn btn-outline-primary w-100">View all</a>
                                            </div>
                                        </div>
                                        <li class="icon-content">
                                            <c:set value="${notidao.getNumberNewNotificationses(sessionScope.account.getIdUser())}" var="number"></c:set>
                                            <c:if test="${number != 0}">
                                                <span class="count rounded-circle bg-danger" style="position: absolute; z-index: 10;top: -15px;right: -10px;width: 25px;">${number}</span>
                                            </c:if>

                                            <a href="#!" aria-label="Discord" onclick="handleDisplayBox()" >
                                                <div class="filled"></div>
                                                <img width="24" height="24" src="https://img.icons8.com/material-outlined/24/appointment-reminders--v1.png" alt="appointment-reminders--v1"/>

                                            </a>


                                            <div class="tooltip">Notification</div>
                                        </li>
                                        <li class="icon-content">
                                            <a
                                                href="messageListAccount"


                                                >
                                                <div class="filled"></div>
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100" viewBox="0 0 24 24">
                                                <path d="M 12 2 C 6.486 2 2 6.262 2 11.5 C 2 14.045 3.088 16.487484 5 18.271484 L 5 22.617188 L 9.0800781 20.578125 C 10.039078 20.857125 11.02 21 12 21 C 17.514 21 22 16.738 22 11.5 C 22 6.262 17.514 2 12 2 z M 12 4 C 16.411 4 20 7.365 20 11.5 C 20 15.635 16.411 19 12 19 C 11.211 19 10.415672 18.884203 9.6386719 18.658203 L 8.8867188 18.439453 L 8.1855469 18.789062 L 7 19.382812 L 7 18.271484 L 7 17.402344 L 6.3632812 16.810547 C 4.8612813 15.408547 4 13.472 4 11.5 C 4 7.365 7.589 4 12 4 z M 11 9 L 6 14 L 10.5 12 L 13 14 L 18 9 L 13.5 11 L 11 9 z"></path>
                                                </svg>
                                            </a>
                                            <div class="tooltip">Message</div>
                                        </li>
                                        <li class="icon-content icon-content-1">
                                            <label class="popup" style="display: inline-block; margin-bottom: -8px;">
                                                <input type="checkbox">
                                                <div class="burger" tabindex="0">
                                                    <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </div>
                                                <nav class="popup-window">
                                                    <legend>Actions</legend>
                                                    <ul>
                                                        <li>


                                                            <a class="a-new" href="profilejb.jsp">
                                                                <svg stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="currentColor" fill="none" viewBox="0 0 24 24" height="14" width="14" xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                                                <circle r="4" cy="7" cx="9"></circle>
                                                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                                                </svg>
                                                                <span>Edit Profile</span>
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a class="a-new" href="changepass.jsp">
                                                                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g id="style"> <g id="setting"> <path id="vector" d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="#6495ed" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> <path id="vector_2" d="M2 12.88V11.12C2 10.08 2.85 9.22 3.9 9.22C5.71 9.22 6.45 7.94 5.54 6.37C5.02 5.47 5.33 4.3 6.24 3.78L7.97 2.79C8.76 2.32 9.78 2.6 10.25 3.39L10.36 3.58C11.26 5.15 12.74 5.15 13.65 3.58L13.76 3.39C14.23 2.6 15.25 2.32 16.04 2.79L17.77 3.78C18.68 4.3 18.99 5.47 18.47 6.37C17.56 7.94 18.3 9.22 20.11 9.22C21.15 9.22 22.01 10.07 22.01 11.12V12.88C22.01 13.92 21.16 14.78 20.11 14.78C18.3 14.78 17.56 16.06 18.47 17.63C18.99 18.54 18.68 19.7 17.77 20.22L16.04 21.21C15.25 21.68 14.23 21.4 13.76 20.61L13.65 20.42C12.75 18.85 11.27 18.85 10.36 20.42L10.25 20.61C9.78 21.4 8.76 21.68 7.97 21.21L6.24 20.22C5.33 19.7 5.02 18.53 5.54 17.63C6.45 16.06 5.71 14.78 3.9 14.78C2.85 14.78 2 13.92 2 12.88Z" stroke="#6495ed" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path> </g> </g> </g></svg>
                                                                <span>Change Password</span>
                                                            </a>

                                                        </li>
                                                        <li>
                                                            <a target="_blank" class="a-new" href="CVGenerator.jsp">
                                                                <svg stroke-linejoin="round" stroke-linecap="round" stroke-width="2" stroke="currentColor" fill="none" viewBox="0 0 24 24" height="14" width="14" xmlns="http://www.w3.org/2000/svg">
                                                                <rect ry="2" rx="2" height="13" width="13" y="9" x="9"></rect>
                                                                <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                                                                </svg>
                                                                <span>Create CV</span>
                                                            </a>
                                                        </li>

                                                        <hr>
                                                        <li>
                                                            <a class="a-new" href="#!">
                                                                <img width="30" height="30" src="https://img.icons8.com/material/30/buy-upgrade--v1.png" alt="buy-upgrade--v1"/>
                                                                <span>Upgrade Package</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="a-new" href="cvapplied">
                                                                <img width="30" height="30" src="https://img.icons8.com/material-outlined/30/view.png" alt="view"/>
                                                                <span>CVs submitted</span>
                                                            </a>
                                                        </li>
                                                        <hr>
                                                        <li>
                                                            <a class="a-new" href="loginjobseeker">
                                                                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#FF0000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M8.00171 7C8.01382 4.82497 8.11027 3.64706 8.87865 2.87868C9.75733 2 11.1715 2 14 2H15C17.8284 2 19.2426 2 20.1213 2.87868C21 3.75736 21 5.17157 21 8V16C21 18.8284 21 20.2426 20.1213 21.1213C19.2426 22 17.8284 22 15 22H14C11.1715 22 9.75733 22 8.87865 21.1213C8.11027 20.3529 8.01382 19.175 8.00171 17" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round"></path> <path opacity="0.5" d="M8 19.5C5.64298 19.5 4.46447 19.5 3.73223 18.7678C3 18.0355 3 16.857 3 14.5V9.5C3 7.14298 3 5.96447 3.73223 5.23223C4.46447 4.5 5.64298 4.5 8 4.5" stroke="#FF0000" stroke-width="1.5"></path> <path d="M15 12L6 12M6 12L8 14M6 12L8 10" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                                                                <span>Logout</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </label>
                                            <div class="tooltip">Account</div>
                                        </li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </div>
                </div>
            </nav>
        </header>


        <!-- Page Content -->
        <div class="page-heading about-heading header-text" style="background-image: url(assets/images/heading-6-1920x500.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-content">

                            <h2>Blog ${blog.title}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Start blog-posts Area -->
        <section class="blog-posts-area section-gap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 post-list blog-post-list">
                        <div class="single-post">
                            <img class="img-fluid" src="assets/blog/${blog.image}" alt="" style="width: 690px; height: 294px;">

                            <a>
                                <h1>
                                    ${blog.title}
                                </h1>
                            </a>
                            <div class="content-wrap">
                                <p style="text-align: justify;">
                                    ${blog.content}

                                </p>

                            </div>
                            <div class="bottom-meta">
                                <div class="user-details row align-items-center" style="margin-top: 30px">
                                    <div class="comment-wrap col-lg-12" >
                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <a style="display: inline-block; width: 77px;" href="#" class="like-button" data-uid="${sessionScope.account.idUser}" data-bid="${blog.blogId}">
                                                    <i id="likeIcon" class="far fa-heart"></i>
                                                    <span id="likeCount">${blog.nLike}</span> likes
                                                </a>
                                            </li>
                                            <li class="list-inline-item"><a ><span class="lnr lnr-bubble"></span> ${blog.nCmt}
                                                    Comments</a></li>
                                            <li class="list-inline-item"><a ><span class="lnr lnr-history"></span>
                                                    ${blog.date} 
                                                    Publish Date</a></li>
                                        </ul>
                                    </div>

                                </div>
                            </div>

                            <!-- Start comment-sec Area -->
                            <section class="comment-sec-area pt-80 pb-80">
                                <div class="container">
                                    <div class="row flex-column">
                                        <h5 class="text-uppercase pb-80"><span class="lnr lnr-bubble"></span> ${blog.nCmt} Comments</h5>

                                        <div class="comment-list">
                                            <c:forEach items="${blog.cmt}" var="c">
                                                <div class="single-comment justify-content-between d-flex" style="margin-top:20px">
                                                    <div class="user justify-content-between d-flex">
                                                        <div class="thumb">
                                                            <img src="assets/avatars/${c.avatar}" alt="" style="width: 62px; height: 62px; border-radius: 50%; border: 2px solid #000; ;">
                                                            <a class="report-button" href="reportComment?commentId=${c.commentId}&blogId=${blog.blogId}" onclick="return confirm('Are you sure you want to report this comment?')">Report</a>
                                                        </div>
                                                        <div class="desc">
                                                            <h5><a>${c.uFullName}</a></h5>
                                                            <p class="date"><i class="zmdi zmdi-calendar-alt"></i> ${c.date} </p>
                                                            <p class="comment">${c.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="reply-btn">
                                                        <c:if test="${sessionScope.account.idUser eq c.userId}">
                                                            <button type="button" class="btn-reply text-uppercase btn-edit" data-comment-id="${c.commentId}">Edit</button>
                                                        </c:if>
                                                        <div class="report-options">
                                                            <a href="deleteComment?commentId=${c.commentId}&blogId=${blog.blogId}" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!-- Start commentform Area -->
                            <section class="commentform-area pt-80">
                                <form action="${pageContext.request.contextPath}/commentBlog" method="POST" onsubmit="return validateForm()">
                                    <div class="container">
                                        <h5 class="pb-50">Leave a Reply</h5>
                                        <div class="row flex-row d-flex">
                                            <input type="hidden" name="bid" value="${blog.blogId}" />
                                            <input type="hidden" name="uid" value="${sessionScope.account.idUser}" />
                                            <div class="col-lg-12 col-md-12">
                                                <textarea id="commentContent" name="content" class="form-control mb-10" placeholder="500 characters remaining"
                                                          onfocus="this.placeholder = ''" onblur="this.placeholder = '500 characters remaining'"
                                                          required="" maxlength="500"></textarea>

                                                <input id="submitButton" class="primary-btn mt-20" href="#" value="Comment" type="submit" />
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </section>
                            <!-- End commentform Area -->


                        </div>
                    </div>
                    <div class="col-lg-4 sidebar">


                        <div class="single-widget protfolio-widget">
                            <img src="assets/avatars/${author.avatar}" alt="" style="width: 120px; height: 120px; border-radius: 50%; border: 2px solid #000; ">

                            <a href="#">
                                <h4>${author.firstName} ${author.lastName}</h4>
                            </a>


                            <p><span class="lnr lnr-map-marker"></span>
                                ${author.city}
                            </p>
                            <p><i class="zmdi zmdi-google-plus-box"></i></span>
                                ${author.email}
                            </p>

                        </div>



                        <div class="single-widget recent-posts-widget">
                            <h4 class="title">Influence Posts</h4>
                            <div class="blog-list">
                                <c:forEach var="influencePost" items="${influencePosts}">
                                    <div class="single-recent-post d-flex flex-row" style="margin-bottom: 10px">
                                        <div class="recent-thumb">
                                            <img class="img-fluid" src="assets/blog/${influencePost.image}" alt="" style="width: 80px; height: 80px; border-radius: 5px; border: 1px solid grey;">
                                        </div>
                                        <div class="recent-details">
                                            <a href="${pageContext.request.contextPath}/blogDetails?bid=${influencePost.blogId}">
                                                <h4 class="influence-post-title">${influencePost.title}</h4>
                                            </a>
                                            <p style="margin-top: 20px"><span class="lnr lnr-heart"></span> ${influencePost.nLike} likes</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="inner-content">
                                <p>Copyright © 2020 Company Name - Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

        </section>
        <!-- End blog-posts Area -->

        <!-- Edit Comment Modal -->
        <div class="modal fade" id="editCommentModal" tabindex="-1" role="dialog" aria-labelledby="editCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editCommentModalLabel">Edit Comment</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="editCommentId">
                        <textarea id="editCommentContent" class="form-control" rows="5"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="saveCommentBtn">Save changes</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
        handleDisplayBox = () => {
            var element = document.getElementById("boxNotification");
            element.classList.toggle("d-block");
        };
    </script>

        <!-- Additional Scripts -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/owl.js"></script>
    </body>

</html>
