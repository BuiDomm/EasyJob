

<%-- 
    Document   : newjsp
    Created on : May 21, 2024, 11:51:28 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/3ef3559250.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/cvgenerator.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.0/jspdf.debug.js" integrity="sha512-NMLPS0RLYPLrZ9S7kAjWu659RKcdwrssZSo7rzKsejLJspGmY/pLJg/dMereQnLQmBDg6vMZ1o45KcSO2yiroA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.2.1/html2canvas.min.js" integrity="sha512-RGZt6PJZ2y5mdkLGwExIfOMlzRdkMREWobAwzTX4yQV0zdZfxBaYLJ6nPuMd7ZPXVzBQL6XAJx0iDXHyhuTheQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>
    <body>

        <section class="resume" id="contentToDownload">
            <div class="resume_left">
                <div class="r_profile_pic file-upload">
                    <figure style="height: 200px; width: 200px; object-fit: cover;border-radius: 50%;">
                        <img style="height: 100%; width: 100%; border-radius: 50%;" id="imagePreview" src="./assets/images/profile.png" alt="profile_pic">
                    </figure>
                    <input type="file" id="imageUpload" accept="image/*" class="file-input">
                    <!--<label for="fileInput" class="file-label">Choose a file</label>-->
                </div>
                <div class="r_left_sub">
                    <div class="r_aboutme">
                        <h2>About me</h2>
                        <textarea placeholder="About yourself here...." class="textarea-box" name="about" rows="4" cols="25" v></textarea><br>
                        <!--<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Culpa earum optio id iure reprehenderit accusamus quisquam accusantium nulla? Dolorum ipsa sed perspiciatis nemo aliquam quibusdam, alias quae totam nulla nihil.</p>-->
                    </div>
                    <div class="r_skills">
                        <h2>Skills</h2>
                        <ul>
                            <li>
                                <p class="icon-skill"><i class="fa-solid fa-code"></i></p>
                                <!--<p>Web Designing</p>-->

                                <input type="text" class="p-css" name="skill1" placeholder="Your skill" value="" />
                            </li>
                            <li>
                                <p><i class="fa-solid fa-pen-nib"></i></p>
                                <input type="text" class="p-css" name="skill2" placeholder="Your skill" value="" />
                            </li>
                            <li>
                                <p><i class="fa-solid fa-video"></i></p>
                                <input type="text" class="p-css" name="skill3" placeholder="Your skill" value="" />
                            </li>
                            <li>
                                <p><i class="fa-solid fa-headphones"></i></p>
                                <input type="text" class="p-css" name="skill4" placeholder="Your skill" value="" />
                            </li>
                            <li>
                                <p><i class="fa-solid fa-image"></i></p>
                                <input type="text" class="p-css" name="skill5" placeholder="Your skill" value="" />
                            </li>
                        </ul>
                    </div>
                    <div class="r_hobbies">
                        <h2>Hobbies</h2>
                        <ul>
                            <li>
                                <p><i class="fa-solid fa-football"></i></p>
                            </li>
                            <li>
                                <p><i class="fa-solid fa-plant-wilt"></i></p>
                            </li>
                            <li>
                                <p><i class="fa-solid fa-book"></i></p>
                            </li>
                            <li>
                                <p><i class="fa-solid fa-bicycle"></i></p>
                            </li>
                            <li>
                                <p><i class="fa-solid fa-chess"></i></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="resume_right">
                <div class="r_namerole">
                    <input type="text" autocomplete="off" class="name--css" name="firstName" placeholder="Nguyen" value="${sessionScope.account.firstName}" /> 
                    <br>
                    <input type="text" autocomplete="off" class="name--css" name="lastName" placeholder="Dat" value="${sessionScope.account.lastName}" /> 
                    <br>
                    <!--<p class="role">Web Developer</p>-->
                    <input autocomplete="off" type="text" class="role" name="job" placeholder="Fullstack Deverloper" value="" /> 

                </div>
                <div class="r_info">
                    <ul>
                        <li>

                            <input autocomplete="off" type="text" class="email-css" name="job" placeholder="easyjob@gmail.com" value="${sessionScope.account.email}" /> 

                        </li>
                        <li>
                            <input autocomplete="off" type="text" class="email-css" name="job" placeholder="(84)331235132" value="${not empty sessionScope.account.phoneNumber ? "0" + sessionScope.account.phoneNumber : " "} " /> 
                        </li>
                    </ul>
                </div>
                <div class="r_right_sub">
                    <div class="r_education">
                        <h2>Education</h2>
                        <ul  class="edu--box">
                            <li class="edu">
                                <div class="r_ed_left">
                                    <input autocomplete="off" type="text" class="year-edu" name="year-edu" placeholder="2003-2006" value="" /> 
                                </div>
                                <div class="r_ed_right">
                                    <input autocomplete="off" type="text" class="edu--des edu--name" name="schoolname" placeholder="FPT University" value="" /> 
                                    <br>
                                    <input autocomplete="off" type="text" class="edu--des" name="describe" placeholder="Describe" value="" /> 
                                </div>

                                <button  class="addbutton" id="addMoreButton">+</button>
                            </li>
                        </ul>
                    </div>
                    <div class="r_jobs">
                        <h2>Work Experience</h2>
                        <ul class="experience">


                            <li class="experience-item">
                                <div class="r_ed_left">
                                    <div class="r_ed_left">
                                        <input autocomplete="off" type="text" class="year-edu" name="year-exper" placeholder="2003-2006" value="" /> 
                                    </div>
                                </div>
                                <div class="r_ed_right">
                                    <input autocomplete="off" type="text" class="edu--des edu--name" name="company" placeholder="FPT Software" value="" /> 
                                    <br>
                                    <input autocomplete="off" type="text" class="edu--des" name="describe" placeholder="Working position" value="" /> 
                                    <button class="addbutton" id="addMoreButtonExp"> + </button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <button class="download-button" onclick="downloadPDF()">Download CV</button>  
    </body>

    <script>
        // Function to add a new education item
        function addEducationItem(event) {
            // ngăn chuyển trang khi bấm dzo cái nút button form
            event.preventDefault();

            var newLi = document.createElement('li');
            newLi.className = 'edu';
            // thêm html dzo thẻ mới tạo
            newLi.innerHTML = `
                  <div class="r_ed_left">
                      <input autocomplete="off" type="text" class="year-edu" name="year-edu" placeholder="2003-2006" value="" /> 
                  </div>
                  <div class="r_ed_right">
                      <input autocomplete="off" type="text" class="edu--des edu--name" name="schoolname" placeholder="FPT University" value="" /> 
                      <br>
                      <input autocomplete="off" type="text" class="edu--des" name="describe" placeholder="Describe" value="" /> 
                  </div>
                  <button class="addMore addbutton">+</button>
              `;
            // nhét thẻ mới tạo dzo thằng cha
            document.querySelector('.edu--box').appendChild(newLi);
        }
        // handle sự kiện click
        document.getElementById('addMoreButton').addEventListener('click', addEducationItem);
        document.querySelector('.edu--box').addEventListener('click', function (event) {
            if (event.target && event.target.classList.contains('addMore')) {
                addEducationItem(event);
            }
        });
        // 
        function addExperienceItem(event) {
            // cũng y như trên :v
            event.preventDefault();
            // y như trên luôn :v ko khác j
            var newLi = document.createElement('li');
            newLi.className = 'experience-item';
            // uhm tương tự
            newLi.innerHTML = `
                <div class="r_ed_left">
                    <input autocomplete="off" type="text" class="year-edu" name="year-exper" placeholder="2003-2006" value="" /> 
                </div>
                <div class="r_ed_right">
                    <input autocomplete="off" type="text" class=" edu--name edu--des" name="company" placeholder="FPT Software" value="" /> 
                    <br>
                    <input autocomplete="off" type="text" class="edu--des" name="describe" placeholder="Working position" value="" /> 
                    <button class="addMoreButtonExp addbutton">+</button>
                </div>
            `;
            // vẫn y thế
            document.querySelector('.experience').appendChild(newLi);
        }

        // 0 khác j nha
        document.getElementById('addMoreButtonExp').addEventListener('click', addExperienceItem);

        document.querySelector('.experience').addEventListener('click', function (event) {
            if (event.target && event.target.classList.contains('addMoreButtonExp')) {
                addExperienceItem(event);
            }
        });
        /// hanle xử lý hình ảnh khi add dzo ảnh mới
        document.getElementById('imageUpload').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                // chỗ này dùng hàm ni để đoc file mứi đc in pút vô
                const reader = new FileReader();
                //onload là cái hàm xử lý khi 1 đối tượng đc tải lên :v 
                reader.onload = function (e) {
                    // lấy cái tên của chỗ thẻ img
                    const img = document.getElementById('imagePreview');
                    // set cái url mới
                    img.src = e.target.result;
                    img.style.display = 'block';
                };
                // sự kiện này dùng để lắng nghe cái quá trình đọc file này có thành công hay ko
                reader.readAsDataURL(file);
            }
        });


        function downloadPDF() {
            // Lấy phần nội dung của section có id là contentToDownload
            const contentToDownload = document.getElementById('contentToDownload');

            // Sử dụng thư viện HTML2Canvas để chụp nội dung HTML và chuyển đổi thành hình ảnh
            html2canvas(contentToDownload, {scale: 2}).then(function (canvas) {
                // Chuyển đổi hình ảnh thành dữ liệu URL
                const imgData = canvas.toDataURL('image/png');

                // Tạo một instance của jsPDF
                const pdf = new jsPDF('p', 'mm', 'a4');

                // Thêm hình ảnh đã chụp vào file PDF
                pdf.addImage(imgData, 'PNG', 0, 0, pdf.internal.pageSize.getWidth(), pdf.internal.pageSize.getHeight());

                // Tải xuống file PDF
                pdf.save('downloaded_content.pdf');
            });
        }






    </script>



</html>