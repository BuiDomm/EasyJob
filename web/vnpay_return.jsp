<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="Vnpay.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.UserPackages"%>
<%@page import="model.Packages"%>
<%@page import="dao.AdminDAO"%>
<%@page import="model.User"%>
<%@page import="dao.CVDAO"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/images/android-chrome-192x192.png">
        <title>EasyJob | Payment Status</title>
        <!-- Bootstrap core CSS -->
        <link href="./assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="./assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="./assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->

        <!DOCTYPE html>





    <%
          User account = (User) session.getAttribute("account");
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
//                                out.print("Thành công");
                AdminDAO dao = new AdminDAO();
                CVDAO cd = new CVDAO();
             Packages p = dao.findpackageByIdUser(account.getIdUser());
             Integer idPackage = (Integer) session.getAttribute("idPackage");
             dao.UpdatePackageByIdUser(idPackage,account.getIdUser());
             cd.updateNumber(account.getIdUser(),999999);
                                
    %>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <link
                rel="icon"
                href="images/dollar.png"
                type="image/png"
                sizes="16x16"
                />
            <title>Payment Success</title>
            <link
                href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
                rel="stylesheet"
                />
        </head>
        <style>
            body {
                background: #dcf0fa;
            }

            .container {
                max-width: 380px;
                margin: 50px auto;
                overflow: hidden;
            }

            .printer-top {
                z-index: 1;
                border: 6px solid #666666;
                height: 6px;
                border-bottom: 0;
                border-radius: 6px 6px 0 0;
                background: #333333;
            }

            .printer-bottom {
                z-index: 0;
                border: 6px solid #666666;
                height: 6px;
                border-top: 0;
                border-radius: 0 0 6px 6px;
                background: #333333;
            }

            .paper-container {
                position: relative;
                overflow: hidden;
                height: 467px;
            }

            .paper {
                background: #ffffff;
                font-family: "Poppins", sans-serif;
                height: 447px;
                position: absolute;
                z-index: 2;
                margin: 0 12px;
                margin-top: -12px;
                animation: print 7000ms cubic-bezier(0.68, -0.55, 0.265, 0.9);
                -moz-animation: print 7000ms cubic-bezier(0.68, -0.55, 0.265, 0.9);
            }

            .main-contents {
                margin: 0 12px;
                padding: 24px;
            }

            .jagged-edge {
                position: relative;
                height: 20px;
                width: 100%;
                margin-top: -1px;
            }

            .jagged-edge:after {
                content: "";
                display: block;
                position: absolute;

                left: 0;
                right: 0;
                height: 20px;
                background: linear-gradient(
                    45deg,
                    transparent 33.333%,
                    #ffffff 33.333%,
                    #ffffff 66.667%,
                    transparent 66.667%
                    ),
                    linear-gradient(
                    -45deg,
                    transparent 33.333%,
                    #ffffff 33.333%,
                    #ffffff 66.667%,
                    transparent 66.667%
                    );

                background-size: 16px 40px;
                background-position: 0 -20px;
            }

            .success-icon {
                text-align: center;
                font-size: 48px;
                height: 72px;
                background: #359d00;
                border-radius: 50%;
                width: 72px;
                height: 72px;
                margin: 16px auto;
                color: #fff;
            }

            .success-title {
                font-size: 22px;
                font-family: "Poppins", sans-serif;
                text-align: center;
                color: #666;
                font-weight: bold;
                margin-bottom: 16px;
            }

            .success-description {
                font-size: 15px;
                font-family: "Poppins", sans-serif;
                line-height: 21px;
                color: #999;
                text-align: center;
                margin-bottom: 24px;
            }

            .order-details {
                text-align: center;
                color: #333;
                font-weight: bold;
            }

            .order-number-label {
                font-size: 18px;
                margin-bottom: 8px;
            }

            .order-number {
                border-top: 1px solid #ccc;
                border-bottom: 1px solid #ccc;
                line-height: 48px;
                font-size: 48px;
                padding: 8px 0;
                margin-bottom: 24px;
            }

            .complement {
                font-size: 18px;
                margin-bottom: 8px;
                color: #32a852;
            }

            @keyframes print {
                0% {
                    transform: translateY(-90%);
                }

                100% {
                    transform: translateY(0%);
                }
            }
        </style>

        <body>



            <div class="container">
                <div class="printer-top"></div>

                <div class="paper-container">
                    <div class="printer-bottom"></div>

                    <div class="paper">
                        <div class="main-contents">
                            <div class="success-icon">&#10004;</div>
                            <div class="success-title">Payment Complete</div>
                            <div class="success-description">
                                Thank you for completing the payment! You will
                                shortly receive an email of your payment.
                            </div>
                            <div class="order-details">
                                <div class="order-number-label">Transaction ID</div>
                                <div class="order-number"><%=request.getParameter("vnp_TxnRef")%></div>
                                <div class="complement">Thank You!</div>
                            </div>
                        </div>
                        <div class="jagged-edge"></div>
                    </div>

                </div>
                <a href="home" style="margin-left: 50%;text-align: center;border-radius: 9px;background: #34b634;padding: 7px 15px;display: inline-block;color: white;transform: translateX(-50%); transition: ease-out 3s "> Back Home</a>
        </body>

    </div>
</body>
<script></script>
</html>
<%
} else {
out.print("Không thành công");
}

} else {
out.print("invalid signature");
}
%>
<!--
                  </label>
           </div> 
       </div>
       <p>
           &nbsp;
       </p>-->

<footer class="footer">
    <p>&copy; VNPAY 2020</p>
</footer>

</body>
</html>
