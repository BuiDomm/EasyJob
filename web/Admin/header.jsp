
<link href="../assets/css/spur.css" rel="stylesheet" type="text/css"/>
<link href="../assets/css/demo.css" rel="stylesheet" type="text/css"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header>
    <a href="#!" class="menu-toggle">
        <i class="fas fa-bars"></i>
    </a>
    <a href="adminDashBoard" style="display: inline-block; text-decoration: none;">
        <img src="./assets/images/easyjobb.png" alt="alt" style="width: 50px; height: 50px; vertical-align: middle;">
        <span style="vertical-align: middle; color: #ff6d00; font-size: 28px">Admin</span>
    </a>
</header>
<nav class="dash-nav-list">
    <a href="adminDashBoard" class="dash-nav-item"  >
        <i class="fas fa-home" ></i> Dashboard </a>
    <!--                    <div class="dash-nav-dropdown">-->
    <div class="dash-nav-dropdown ">
        <a href="#!" class="dash-nav-item dash-nav-dropdown-toggle" >
            <i class="fas fa-chart-bar"></i> Jobs
        </a>

        <div class="dash-nav-dropdown-menu">
            <a href="listJobAccept" class="dash-nav-dropdown-item">Job Accepted</a>
            <a href="listJobReject" class="dash-nav-dropdown-item">Job Rejected</a>
        </div>
    </div>
    <div class="dash-nav-dropdown ">
        <a href="#!" class="dash-nav-item dash-nav-dropdown-toggle" >
            <i class="fas fa-bullhorn"></i> Moderation
        </a>

        <div class="dash-nav-dropdown-menu">
            <a href="requestList" class="dash-nav-dropdown-item">Job Recruitment</a>
            <a href="adminListBlog" class="dash-nav-dropdown-item">Blog</a>
        </div>
    </div>
    <div class="dash-nav-dropdown">
        <a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">
            <i class="fas fa-clipboard-check"></i> Handle Report </a>
        <div class="dash-nav-dropdown-menu">
            <a href="reportjob.jsp" class="dash-nav-dropdown-item">Job Recruitment</a>
            <a href="reportblog.jsp" class="dash-nav-dropdown-item">Blog</a>

        </div>
    </div>
    <!--                    <div class="dash-nav-dropdown">-->
    <!--    <a href="listaccountpackage.jsp" class="dash-nav-item">
            <i class="fas fa-chevron-up"></i> Account Package </a>-->
    <!--                        <div class="dash-nav-dropdown-menu">
                                <a href="https://github.com/HackerThemes/spur-template" target="_blank" class="dash-nav-dropdown-item">GitHub</a>
                                <a href="http://hackerthemes.com" target="_blank" class="dash-nav-dropdown-item">HackerThemes</a>
                            </div>-->
    <!--                    </div>-->
    <a href="listaccount?roll=2" class="dash-nav-item">
        <i class="far fa-address-card"></i> Acounts </a>
</nav>