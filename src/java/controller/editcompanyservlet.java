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
public class editcompanyservlet extends HttpServlet {
   
    
    private static final String UPLOAD_DIR = "assets/img/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy thông tin tài khoản từ session
        HttpSession session = request.getSession();
        User acc = (User) session.getAttribute("account");
        CompanyDAO dao = new CompanyDAO();
        Company company = dao.findCompanyByUserId(acc.getIdUser());
        
        // Lấy các tham số từ yêu cầu
        String ecompany_name = request.getParameter("name");
        String edescription = request.getParameter("aboutus");
        String eaddress = request.getParameter("address");
        String estatus = request.getParameter("status");
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
         String oldrelativeFilePath = UPLOAD_DIR + imageFileName;


        
        String errorMessage = null;
boolean hasError = false;

// Kiểm tra các trường bắt buộc
if (ecompany_name == null || ecompany_name.isEmpty()) {
    errorMessage = "Company name is required.";
    hasError = true;
} else if (edescription == null || edescription.isEmpty()) {
    errorMessage = "Description is required.";
    hasError = true;
} else if (eaddress == null || eaddress.isEmpty()) {
    errorMessage = "Address is required.";
    hasError = true;
}

// Kiểm tra sự tồn tại của tên công ty
if (!hasError && dao.isCompanyNameExists(ecompany_name)) {
    if (!company.getNameCompany().equalsIgnoreCase(ecompany_name)) {
        errorMessage = "Company name already exists.";
        hasError = true;
    }
}

// Kiểm tra định dạng tệp hình ảnh
if (!hasError && imageFileName != null && !imageFileName.isEmpty()) {
    String fileExtension = imageFileName.substring(imageFileName.lastIndexOf(".") + 1);
    if (!fileExtension.equalsIgnoreCase("png") && !fileExtension.equalsIgnoreCase("jpg")) {
        errorMessage = "Only PNG and JPG files are allowed.";
        hasError = true;
    }
}

// Xử lý nếu có lỗi
if (hasError) {
    Company c = new Company(0, ecompany_name, null, edescription, eaddress, estatus, null);
    request.setAttribute("com", c);
    request.setAttribute("errorMessage", errorMessage);
    request.getRequestDispatcher("EditCompany.jsp").forward(request, response);
    return;
}

// Cập nhật thông tin công ty
company.setNameCompany(ecompany_name);
company.setAboutUS(edescription);
company.setAdd(eaddress);
company.setStatus(estatus);
if (imageFileName != null && !imageFileName.isEmpty() && !oldrelativeFilePath.equals(UPLOAD_DIR)) {
    company.setUrl(relativeFilePath);  
} 
dao.update(company);
response.sendRedirect("companycontrolservlet");
       
        
    }


}
