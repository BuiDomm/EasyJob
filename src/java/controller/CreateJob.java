/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import dao.JobseekerDAO;
import dao.NotificationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;
import model.Category;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class CreateJob extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateJob</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateJob at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idUser = Integer.parseInt(request.getParameter("id"));
        CompanyDAO cd = new CompanyDAO();
        Company com = cd.findCompanyByUserId(idUser);
        request.setAttribute("com", com);
        String errorMessage;
        if (com == null) {
            errorMessage = "You must create your company first !";
            request.setAttribute("errormess", errorMessage);
            request.getRequestDispatcher("companydetail.jsp").forward(request, response);
        } else if ("Disabled".equals(com.getStatus())) {
            errorMessage = "You must active your company first !";
            request.setAttribute("errormess", errorMessage);
            request.getRequestDispatcher("loadcompanyservlet").forward(request, response);
        } else {

            request.getRequestDispatcher("createjob.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User epl = (User) session.getAttribute("account");
        CompanyDAO comdao = new CompanyDAO();
        Company com = comdao.findByUserId(epl.getIdUser());

        String nameCompnay = request.getParameter("name");
        String nameWork = request.getParameter("namework");
        int idCate = 0;
        int yearExpr = 0;
        int salary = 0;
        try {
            idCate = Integer.parseInt(request.getParameter("cateID"));
        } catch (Exception e) {
            request.setAttribute("notice", "Please select the appropriate Category");
            request.getRequestDispatcher("createjob.jsp").forward(request, response);
        }

        try {
            yearExpr = Integer.parseInt(request.getParameter("experiences"));
        } catch (Exception e) {
            request.setAttribute("notice", "Please update all information.");
            request.getRequestDispatcher("createjob.jsp").forward(request, response);
        }

        try {
            salary = Integer.parseInt(request.getParameter("salary"));
        } catch (Exception e) {
            request.setAttribute("notice", "Please update all information.");
            request.getRequestDispatcher("createjob.jsp").forward(request, response);
        }
        Pattern p = Pattern.compile("[^\\d\\W]+|\\s");
        String location = request.getParameter("location");
        if (!p.matcher(location).find()) {
            request.setAttribute("notice", "Location do not contain numbers or special characters");
            request.getRequestDispatcher("createjob.jsp").forward(request, response);

        } else {
            String desc = request.getParameter("description");
            CategoryDAO cd = new CategoryDAO();
            Category c = cd.findById(idCate);

            Job j = new Job(com, c, nameWork, desc, yearExpr, location, salary, "Pending");

            JobDAO jd = new JobDAO();
            jd.insert(j);
            // danh sach cac job da tao boi nguoi dung
            List<Job> list = jd.findByIdUser(epl.getIdUser());
            // thong tin ve job moi tao ra can day nhat
            Job currentJob = jd.getJobCurrentInsert(epl.getIdUser());
            
            
            // send notitifica sang admin
            NotificationDAO nd = new NotificationDAO();
            JobseekerDAO js = new JobseekerDAO();
            List<User> adminlist = js.getAll();
            for (User user : adminlist) {
                if (user.getRoleId() == 1) {
                    nd.insertNotificationApprovel(user.getIdUser(), com.getNameCompany() + " has sent a request to create a new Job named " + j.getTitle() +".", 1);
                }
            }
            
            // send data sang jsp
            request.setAttribute("successfully", true);
            request.setAttribute("list", list);
            request.setAttribute("job", currentJob);
            request.getRequestDispatcher("listjobcreated").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
