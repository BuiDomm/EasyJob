/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CompanyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;
import model.Company;
import model.User;

/**
 *
 * @author ACER
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class insertcompanyservlet extends HttpServlet {
   
    private static final String UPLOAD_DIR = "assets/img/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         CompanyDAO dao = new CompanyDAO();
        // Lấy các tham số từ yêu cầu
        String company_name = request.getParameter("name");
        String description = request.getParameter("aboutus");
        String address = request.getParameter("address");
        Part file = request.getPart("image");
        String imageFileName = file.getSubmittedFileName();
        
      
   

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        
        // Tạo thư mục nếu nó không tồn tại
        File fileUploadDir = new File(uploadFilePath);
        if (!fileUploadDir.exists()) {
            fileUploadDir.mkdirs();
        }
         // Tạo tên tệp duy nhất để tránh ghi đè
        String uniqueFileName = UUID.randomUUID().toString() + "_" + imageFileName;
        String filePath = uploadFilePath + File.separator + uniqueFileName;
        
        try (FileOutputStream fos = new FileOutputStream(filePath);
             InputStream is = file.getInputStream()) {
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Đường dẫn tương đối cho cơ sở dữ liệu
        String relativeFilePath = UPLOAD_DIR + uniqueFileName;
       

        // Lấy thông tin tài khoản từ session
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("account");
        String status = "Active";
         String errorMessage = null;
        if (company_name == null || company_name.isEmpty()
                || description == null || description.isEmpty()
                || address == null || address.isEmpty()
                || imageFileName == null || imageFileName.isEmpty()) {
            errorMessage = "All fields are required. Please fill out all fields.";
        }else if (dao.isCompanyNameExists(company_name)) {
            // Nếu tên công ty đã tồn tại, gửi thông báo lỗi
            errorMessage = "Company name already exists.";
            
        } else {
            String fileExtension = imageFileName.substring(imageFileName.lastIndexOf(".") + 1);
            if (!fileExtension.equalsIgnoreCase("png") && !fileExtension.equalsIgnoreCase("jpg")) {
                errorMessage = "Only PNG and JPG files are allowed.";
            }
        }

        if (errorMessage != null) {
            Company c = new Company(0, company_name, null, description, address, "Active", null);
            request.setAttribute("company", c);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("companydetail.jsp").forward(request, response);
            return;
        }

        Company c = new Company(0, company_name, acc, description, address, status, relativeFilePath);
        
        
        // Lưu thông tin công ty vào cơ sở dữ liệu
       
        dao.insert(c);
        response.sendRedirect("companycontrolservlet");
        
        
        
    }
}
