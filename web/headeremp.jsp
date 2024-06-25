

<link rel="stylesheet" type="text/css" href="./assets/css/empui.css">

<link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<link rel="icon" href="assets/images/favicon.ico">
<link rel="stylesheet" href="assets/css/icontop1.css">

<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- Bootstrap core CSS -->
<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/button.css">



<header style="display: flex;
        align-items: center;position: relative">
    <nav class="navbar navbar-expand-lg all-nav">
        <a class="navbar-brand" href="employerhomeservlet">
            <figure style="width: 65px;height: 65px;margin-left: 40px;margin-top: 16px">
                <img style="height: 100%;width: 100%;object-fit: cover;" src="./assets/images/easyjobb.png" alt="alt"/>
            </figure>

        </a>
        <div class="collapse navbar-collapse box-content" style="display: flex;align-items: center;" id="navbarResponsive">
            <ul class="navbar-nav ">

                <li class="navbar-item">
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="profilejb.jsp"> <i class="fa fa-floppy-o"></i>Profile
                    </a>
                </li> 

                <li class="navbar-item">
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="companycontrolservlet"> <i class="fa fa-sitemap"></i>Company
                    </a>
                </li> 
                <li class="navbar-item">
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="createjob?id=${sessionScope.account.idUser}"> <i class="fa fa-pencil-square"></i>Post
                    </a>
                </li> 
                <li class="navbar-item">
                    <a style=" width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="listjobcreated"> <i class="
                                                                                                                                  fa fa-question
                                                                                                                                  "></i>Created
                    </a>
                </li> 
                <li class="navbar-item">
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="listApplyCv"> <i class="
                                                                                                                                  fa fa-folder-open
                                                                                                                                  "></i>Cvs
                    </a>
                </li> 


            </ul>

            <ul class="example-2" style="display: flex;max-height: 45px;margin-left: 100px;margin-bottom: -7px;">
                <li class="icon-content">
                    <a href="#!" aria-label="Discord" >
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


                                <hr>
                                <li>
                                    <a class="a-new" href="#!">
                                        <img width="30" height="30" src="https://img.icons8.com/material/30/buy-upgrade--v1.png" alt="buy-upgrade--v1"/>
                                        <span>Upgrade Package</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="a-new" href="listApplyCv">
                                        <img width="30" height="30" src="https://img.icons8.com/material-outlined/30/view.png" alt="view"/>
                                        <span>CV Received</span>
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



        </div>
    </nav>
</header>
