<%-- 
    Document   : emloyerheader
    Created on : May 28, 2024, 4:25:46 PM
    Author     : ACER
--%>

<header style="display: flex;
        align-items: center;">
    <nav class="navbar navbar-expand-lg all-nav">
        <a class="navbar-brand" href="homeemployeer.jsp">
            <figure style="width: 65px;height: 65px;margin-left: 40px;margin-top: 16px">
                <img style="height: 100%;width: 100%;object-fit: cover;" src="./assets/images/easyjobb.png" alt="alt"/>
            </figure>

        </a>
        <div class="collapse navbar-collapse box-content" style="display: flex;align-items: center;" id="navbarResponsive">
            <ul style="margin-left: -36px" class="navbar-nav ">

                <li class="navbar-item">
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="#!"> <i class="fa fa-floppy-o"></i>Profile
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
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="listjobcreated"> <i class="
                                                                                                                                     fa fa-question
                                                                                                                                     "></i>Created
                    </a>
                </li> 
                <li class="navbar-item">
                    <a style="    width: 140px;display: inline-flex;align-items: center;" class="nav-link" href="#!"> <i class="
                                                                                                                         fa fa-folder-open
                                                                                                                         "></i>Cvs
                    </a>
                </li> 




            </ul>

            <ul class="example-2" style="display: flex;max-height: 45px;margin-left: 56px;margin-bottom: -7px;">
                <li class="icon-content">
                    <a href="#!" aria-label="Discord" >
                        <div class="filled"></div>
                        <img width="24" height="24" src="https://img.icons8.com/material-outlined/24/appointment-reminders--v1.png" alt="appointment-reminders--v1"/>
                    </a>
                    <div class="tooltip">Notification</div>
                </li>
                <li class="icon-content">
                    <a
                        href="#!"


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
                                    <a class="a-new" href="#!">
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
                                    <a class="a-new" href="#!">
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
                        </nav></div>
                    </label>
                    <div class="tooltip">Account</div>
                </li>
            </ul>



        </div>
    </nav> 

</header>