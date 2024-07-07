<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<header class="dash-toolbar">
    <a href="#!" class="menu-toggle">
        <i class="fas fa-bars"></i>
    </a>
    <a href="#!" class="searchbox-toggle">
        <i class="fas fa-search"></i>
    </a>
    <div class="tools">
        <div class="dropdown tools-item">
            <a href="#" class="" id="dropdownMenuBell" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="handleDisplayBox()">
                <i class="fas fa-bell"></i>
                <i class="tools-item-count">${notidao.getNumberNewNotificationses(sessionScope.account.getIdUser())}</i>
            </a>
            <div class="shadow-lg d-none" id="boxNotification" style="position: absolute; background: white; top: 80%; right: 0; width: 400px;">
                <h5 class="fw-semibold px-3 py-2 m-0 d-flex justify-content-between">Notifications
                    <a href="readAll" class="btn btn-primary float-end text-white">Read All</a>
                </h5>
                <c:set var="newNotification" value="${notidao.getNewNotificationsesByAccount(sessionScope.account.getIdUser())}" />
                <c:forEach var="n" items="${newNotification}">
                    <a href="javascript:void(0)" class="dropdown-item">
                        <div class="d-flex align-items-start py-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ${n.readStatus == 1 ? '' : 'opacity:0.5;'}">
                            <div class="m-0 d-flex justify-content-between">
                                <span class="${n.readStatus == 1 ? 'bg-primary badge rounded-pill h-100' : ''}"></span>
                                <h6 class="mb-1 fw-semibold">${fn:substring(n.time, 0, 10)}    </h6>
                                <p class="mb-1">${n.message}</p>
                            </div>
                        </div>
                    </a>
                </c:forEach>
                <div class="d-grid p-3 border-top w-100">
                    <a href="adminViewNotification" class="btn btn-outline-primary w-100">View all</a>
                </div>
            </div>
        </div>
        <div class="dropdown tools-item">
            <a href="#" class="" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                <a class="dropdown-item" href="changepass.jsp">Change Password</a>
                <a class="dropdown-item" href="loginjobseeker">Logout</a>
            </div>
        </div>
    </div>
</header>


<script>
    function handleDisplayBox() {
        var box = document.getElementById('boxNotification');
        box.classList.toggle('d-none');
    }
</script>

