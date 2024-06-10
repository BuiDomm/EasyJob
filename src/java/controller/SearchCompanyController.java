package controller;

import dao.CompanyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Company;

/**
 *
 * @author This PC
 */
@WebServlet(name = "SearchCompanyController", urlPatterns = {"/searchCompany"})
public class SearchCompanyController extends HttpServlet {

    private CompanyDAO companyDao = new CompanyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Do nothing on GET request, or implement if needed
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cname = request.getParameter("cname");
        String addr = request.getParameter("addr");
        
        List<Company> list;
        
        if ((cname != null && !cname.isEmpty()) || (addr != null && !addr.isEmpty())) {
            list = companyDao.getSearchCompanies(cname, addr);
        } else {
            // If both inputs are empty, return all companies
            list = companyDao.getAll();
        }

        request.setAttribute("companies", list);
        request.setAttribute("cname", cname);
        request.setAttribute("addr", addr);
        request.getRequestDispatcher("search-company.jsp").forward(request, response);
    }

}
