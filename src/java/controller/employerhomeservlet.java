package controller;

import dao.ApplyDAO;
import dao.CompanyDAO;
import dao.JobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Company;
import model.Job;
import model.User;

public class employerhomeservlet extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User epl = (User) session.getAttribute("account");
        
        CompanyDAO comdao = new CompanyDAO();
        Company com = null;
        List<Job> list = new ArrayList<>();
        ApplyDAO appdao = new ApplyDAO();
        int accept = 0;
        int reject = 0;
        int pending = 0;
        int cvapplied = 0;
        List<Integer> applicationsByMonth = new ArrayList<>();

        try {
            com = comdao.findCompanyByUserId(epl.getIdUser());
            if (com != null) {
                JobDAO jd = new JobDAO();
                list = jd.findByIdUser(epl.getIdUser());
                
                int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
                for (int month = 1; month <= 12; month++) {
                    int count = appdao.countApplicationsByMonthAndYear(currentYear, month, com.getCompanyID());
                    applicationsByMonth.add(count);
                }
                accept = jd.countAcceptedJobs(com.getCompanyID());
                reject = jd.countRejectJobs(com.getCompanyID());
                pending = jd.countPendingJobs(com.getCompanyID());
                cvapplied = appdao.countApplicationsByCompanyId(com.getCompanyID());
            }
        } catch (Exception e) {
            
        }

        request.setAttribute("applicationsByMonth", applicationsByMonth);
        request.setAttribute("list", list);
        request.setAttribute("com", com);
        request.setAttribute("accept", accept);
        request.setAttribute("reject", reject);
        request.setAttribute("pending", pending);
        request.setAttribute("cvapplied", cvapplied);
        request.getRequestDispatcher("homeemployeer.jsp").forward(request, response);
    } 
}
