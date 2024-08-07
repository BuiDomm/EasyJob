<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>EasyJob | Payment</title>
        <!-- Bootstrap core CSS -->
        <!--<link href="./assets/bootstrap.min.css" rel="stylesheet"/>-->
        <!-- Custom styles for this template -->
        <link href="./assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="assets/jquery-1.11.3.min.js"></script>
    </head>
    <style>
        .Btn {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            width: 45px;
            height: 45px;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition-duration: .3s;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.199);
            background-color: rgb(255, 65, 65);
        }

        /* plus sign */
        .sign {
            width: 100%;
            transition-duration: .3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sign svg {
            width: 20px;
            margin-left:-4px;
        }

        .sign svg path {
            fill: white;
        }
        /* text */
        .text {
            position: absolute;
            right: 0%;
            width: 0%;
            opacity: 0;
            color: white;
            font-size: 1.2em;
            font-weight: 600;
            transition-duration: .3s;
        }
        /* hover effect on button width */
        .Btn:hover {
            width: 125px;
            border-radius: 40px;
            transition-duration: .3s;
        }

        .Btn:hover .sign {
            width: 30%;
            transition-duration: .3s;
            padding-left: 20px;
        }
        /* hover effect button's text */
        .Btn:hover .text {
            opacity: 1;
            width: 70%;
            transition-duration: .3s;
            padding-right: 10px;
        }
        /* button click effect*/
        .Btn:active {
            transform: translate(2px ,2px);
        }

    </style>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div style="" class="container">
                <div style="margin-top: 150px;" class="header clearfix">

                    <h3 class="text-muted"> Pay With VNPAY </h3>
                </div>
                <h3>Create new order</h3>
                <div class="table-responsive">
                    <form action="vnpayajax" id="frmCreateOrder" method="post">        
                        <div class="form-group">
                            <label for="amount">The amount you need to pay is:</label>
                            <input style="pointer-events: none" class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="${price}" />
                    </div>
                    <h4>
                        Select a payment method</h4>
                    <div class="form-group">
                        <h5 style="margin-top: 5px">Method 1: Navigate to VNPAY Portal to select payment method</h5>
                        <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                        <label style="margin-top: 5px" for="bankCode">VNPAYQR payment gateway</label><br>

                        <h5>Method 2: Separate the method at the connection unit's site</h5>
                        <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                        <label style="margin-top: 5px" for="bankCode">Pay with applications that support VNPAYQR</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                        <label for="bankCode">Payment via ATM card/Domestic account</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                        <label for="bankCode">
                            Payment via international card</label><br>

                    </div>
                    <div class="form-group">
                        <h5>
                            Select payment interface language:</h5>
                        <input type="radio" id="language" Checked="True" name="language" value="vn">
                        <label style="margin-top: 5px" for="language">Tiếng việt</label><br>
                        <input type="radio" id="language" name="language" value="en">
                        <label for="language">English</label><br>

                    </div>
                    <button type="submit" class="Btn">

                        <div class="btn btn-default sign">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="256" height="256" viewBox="0 0 256 256" xml:space="preserve">

                            <defs>
                            </defs>
                            <g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)" >
                            <rect x="0.6" y="61.17" rx="0" ry="0" width="11.74" height="23.39" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(67,152,209); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
                            <path d="M 76.802 67.762 c -0.546 -1.785 -2.334 -2.882 -4.171 -2.554 c -5.531 0.985 -12.225 3.036 -18.534 4.516 l -0.001 -0.001 h 0.001 c -0.322 -3.581 -3.262 -6.361 -6.856 -6.482 l -1.632 -0.055 c -5.327 0 -11.123 -3.873 -16.055 -3.873 c -4.335 0 -8.521 0.942 -13.128 4.967 c -0.583 0.509 -1.332 0.797 -2.106 0.792 L 12.739 65 v 15.271 h 4.645 c 1.464 0 2.923 0.161 4.352 0.479 l 12.498 2.787 c 1.128 0.252 2.282 0.37 3.438 0.353 l 6.916 -0.101 c 1.938 -0.028 3.852 -0.437 5.633 -1.202 l 24.508 -10.351 C 76.461 71.493 77.354 69.564 76.802 67.762 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(254,201,163); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 53.936 70.879 c -0.512 0 -0.948 -0.391 -0.995 -0.91 c -0.273 -3.035 -2.776 -5.401 -5.822 -5.505 l -1.614 -0.055 c -0.001 0 -0.002 0 -0.002 0 c -2.824 0 -5.731 -1.03 -8.544 -2.028 c -2.615 -0.927 -5.085 -1.803 -7.306 -1.803 c -3.457 0 -7.625 0.555 -12.332 4.669 c -0.762 0.665 -1.728 1.03 -2.723 1.03 c -0.009 0 -0.017 0 -0.026 0 l -2.001 -0.091 c -0.552 -0.025 -0.979 -0.493 -0.953 -1.045 s 0.497 -0.989 1.045 -0.953 l 1.961 0.09 c 0.002 0 0.005 0 0.008 0 c 0.474 0 0.975 -0.19 1.373 -0.537 c 5.206 -4.55 9.82 -5.163 13.648 -5.163 c 2.565 0 5.315 0.976 7.974 1.918 c 2.654 0.941 5.397 1.914 7.912 1.914 l 1.649 0.056 c 4.052 0.137 7.382 3.285 7.746 7.323 c 0.05 0.55 -0.356 1.036 -0.906 1.086 C 53.996 70.878 53.966 70.879 53.936 70.879 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 37.471 84.899 c -1.146 0 -2.291 -0.126 -3.408 -0.376 l -12.366 -2.757 c -1.34 -0.299 -2.716 -0.45 -4.089 -0.45 h -4.993 c -0.552 0 -1 -0.447 -1 -1 s 0.448 -1 1 -1 h 4.993 c 1.519 0 3.041 0.168 4.524 0.499 l 12.366 2.757 c 1.038 0.231 2.11 0.342 3.169 0.325 l 6.844 -0.1 c 1.795 -0.025 3.543 -0.398 5.195 -1.108 l 24.256 -10.244 c 1.24 -0.533 1.881 -1.916 1.483 -3.214 c -0.393 -1.281 -1.684 -2.068 -2.996 -1.836 c -3.342 0.595 -7.073 1.576 -11.024 2.616 c -10.768 2.832 -21.9 5.76 -26.938 1.142 c -0.407 -0.374 -0.435 -1.006 -0.061 -1.413 c 0.372 -0.406 1.006 -0.435 1.413 -0.062 c 4.232 3.882 15.306 0.968 25.077 -1.602 c 3.991 -1.05 7.761 -2.041 11.184 -2.65 c 2.311 -0.417 4.571 0.974 5.258 3.219 c 0.696 2.275 -0.426 4.7 -2.612 5.64 L 50.49 83.529 c -1.887 0.812 -3.891 1.239 -5.949 1.269 l -6.843 0.1 C 37.622 84.898 37.546 84.899 37.471 84.899 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 12.616 85.559 H 1 c -0.552 0 -1 -0.447 -1 -1 V 61.417 c 0 -0.553 0.448 -1 1 -1 h 11.616 c 0.552 0 1 0.447 1 1 v 23.142 C 13.616 85.111 13.168 85.559 12.616 85.559 z M 2 83.559 h 9.616 V 62.417 H 2 V 83.559 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <rect x="8.98" y="22.71" rx="0" ry="0" width="53.92" height="29.31" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(148,194,60); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
                            <circle cx="36.743" cy="37.363" r="7.583" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(217,217,217); fill-rule: nonzero; opacity: 1;" transform="  matrix(1 0 0 1 0 0) "/>
                            <path d="M 62.901 53.021 H 8.978 c -0.552 0 -1 -0.447 -1 -1 V 22.707 c 0 -0.552 0.448 -1 1 -1 H 43.29 c 0.552 0 1 0.448 1 1 s -0.448 1 -1 1 H 9.978 v 27.315 h 51.923 V 36.015 c 0 -0.552 0.447 -1 1 -1 s 1 0.448 1 1 v 16.006 C 63.901 52.574 63.454 53.021 62.901 53.021 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 36.742 45.947 c -4.733 0 -8.583 -3.85 -8.583 -8.583 s 3.85 -8.583 8.583 -8.583 s 8.583 3.85 8.583 8.583 S 41.475 45.947 36.742 45.947 z M 36.742 30.781 c -3.63 0 -6.583 2.953 -6.583 6.583 s 2.953 6.583 6.583 6.583 s 6.583 -2.953 6.583 -6.583 S 40.372 30.781 36.742 30.781 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 53.099 45.903 h -6.671 c -0.552 0 -1 -0.448 -1 -1 s 0.448 -1 1 -1 h 6.671 c 0.553 0 1 0.448 1 1 S 53.651 45.903 53.099 45.903 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 27.057 45.903 h -6.67 c -0.552 0 -1 -0.448 -1 -1 c 0 -1.861 -1.514 -3.375 -3.375 -3.375 c -0.552 0 -1 -0.448 -1 -1 v -6.372 c 0 -0.552 0.448 -1 1 -1 c 1.861 0 3.375 -1.514 3.375 -3.375 c 0 -0.552 0.448 -1 1 -1 h 6.67 c 0.552 0 1 0.448 1 1 s -0.448 1 -1 1 h -5.763 c -0.409 2.164 -2.118 3.874 -4.282 4.282 v 4.558 c 2.163 0.409 3.873 2.119 4.282 4.282 h 5.763 c 0.552 0 1 0.448 1 1 S 27.609 45.903 27.057 45.903 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <rect x="77.39" y="5.44" rx="0" ry="0" width="11.61" height="23.14" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(67,152,209); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) "/>
                            <path d="M 54.307 5.861 c -3.323 0.477 -6.144 2.692 -7.381 5.813 l -4.053 6.601 H 54.81 l 0 0 l -5.801 8.234 c -0.318 0.456 -0.527 0.978 -0.612 1.527 l -0.502 5.739 c -0.388 2.519 1.232 4.91 3.716 5.483 l 0.788 0.182 c 2.441 0.563 4.91 -0.82 5.706 -3.195 l 1.159 -5.941 c 0.153 -0.456 0.394 -0.877 0.711 -1.238 l 5.649 -5.871 c 2.893 3.057 6.291 4.106 11.769 3.353 V 7.457 C 67.861 6.633 62.555 4.677 54.307 5.861 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(254,201,163); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 53.508 40.567 c -0.44 0 -0.888 -0.049 -1.335 -0.152 l -0.788 -0.182 c -2.978 -0.687 -4.944 -3.59 -4.479 -6.609 L 47.4 27.95 c 0.114 -0.761 0.384 -1.435 0.788 -2.013 l 7.714 -10.95 c 0.317 -0.452 0.94 -0.56 1.394 -0.241 c 0.451 0.318 0.56 0.942 0.241 1.394 l -7.712 10.946 c -0.227 0.324 -0.38 0.707 -0.44 1.102 l -0.494 5.675 c -0.314 2.056 0.981 3.969 2.943 4.421 l 0.788 0.182 c 1.932 0.443 3.858 -0.619 4.513 -2.479 l 1.146 -5.873 c 0.008 -0.042 0.02 -0.084 0.033 -0.125 c 0.194 -0.583 0.5 -1.115 0.906 -1.58 l 5.681 -5.906 c 0.188 -0.196 0.449 -0.307 0.721 -0.307 c 0.001 0 0.003 0 0.004 0 c 0.273 0.001 0.534 0.114 0.723 0.313 c 2.705 2.858 5.861 3.744 10.906 3.05 c 0.544 -0.081 1.051 0.308 1.126 0.854 c 0.075 0.547 -0.307 1.052 -0.854 1.127 c -5.248 0.724 -8.87 -0.154 -11.886 -2.921 l -4.946 5.142 c -0.188 0.216 -0.353 0.497 -0.464 0.806 l -1.145 5.872 c -0.008 0.043 -0.02 0.085 -0.033 0.126 C 58.233 39.005 55.979 40.567 53.508 40.567 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 42.871 19.275 c -0.178 0 -0.359 -0.047 -0.522 -0.148 c -0.471 -0.289 -0.618 -0.905 -0.329 -1.375 l 4.009 -6.529 c 1.382 -3.398 4.49 -5.829 8.135 -6.352 c 5.679 -0.815 10.034 -0.174 15.079 0.567 c 2.521 0.371 5.126 0.754 8.232 1.022 c 0.551 0.047 0.958 0.532 0.91 1.082 c -0.048 0.549 -0.523 0.963 -1.082 0.91 c -3.166 -0.273 -5.921 -0.678 -8.352 -1.036 c -5.092 -0.749 -9.111 -1.34 -14.504 -0.566 c -2.966 0.426 -5.492 2.415 -6.593 5.192 c -0.021 0.054 -0.047 0.105 -0.077 0.155 l -4.054 6.601 C 43.536 19.105 43.207 19.275 42.871 19.275 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            <path d="M 89 29.583 H 77.39 c -0.553 0 -1 -0.448 -1 -1 V 5.441 c 0 -0.552 0.447 -1 1 -1 H 89 c 0.553 0 1 0.448 1 1 v 23.142 C 90 29.135 89.553 29.583 89 29.583 z M 78.39 27.583 H 88 V 6.441 h -9.61 V 27.583 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round" />
                            </g>
                            </svg>

                        </div>

                        <div class="text">Pay</div>
                    </button>
                </form>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>