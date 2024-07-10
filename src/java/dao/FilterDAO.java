/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Company;
import model.Job;
import model.User;

/**
 *
 * @author DELL
 */
public class FilterDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    filter job
    public List<Job> getJobsByCriteria(String title, String company, int category, int experienceOption, String location, int salaryOption, int index) {
        List<Job> filterJobs = new ArrayList<>();

        StringBuilder query = new StringBuilder("SELECT DISTINCT J.JobID, J.CompanyID, J.CategoryID, J.Title, J.[Description], J.ExperienceYears, J.[Location], J.Salary, J.[Status], J.[Date]\n"
                + "FROM Jobs J\n"
                + "LEFT JOIN CompanyProfile C ON J.CompanyID = C.CompanyID\n"
                + "LEFT JOIN Categories CAT ON J.CategoryID = CAT.CategoryID\n"
                + "WHERE J.Status = 'Accept'");

        if (title != null) {
            query.append(" AND J.Title LIKE ?");
        }

        if (company != null) {
            query.append(" AND C.CompanyName like ?");
        }

        if (category > 0) {
            query.append(" AND J.CategoryID = ?");
        }

        if (experienceOption == 1) {
            query.append(" AND J.ExperienceYears >= 0 AND J.ExperienceYears <= 1");
        } else if (experienceOption == 2) {
            query.append(" AND J.ExperienceYears > 1 AND J.ExperienceYears <= 2");
        } else if (experienceOption == 3) {
            query.append(" AND J.ExperienceYears > 2");
        }

        if (location != null) {
            query.append(" AND J.[Location] LIKE ?");
        }

        if (salaryOption == 2000) {
            query.append(" AND J.Salary >= 0 AND J.Salary < 2000");
        } else if (salaryOption == 3000) {
            query.append(" AND J.Salary >= 2000 AND J.Salary <= 4000");
        } else if (salaryOption == 4000) {
            query.append(" AND J.Salary > 4000");
        }

        query.append(" ORDER BY J.JobID OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY;");

        try {
            conn = new DBContext().getConnection();//open connection to SQL
            ps = conn.prepareStatement(query.toString());
            int parameterIndex = 1;

            if (title != null) {
                ps.setString(parameterIndex++, "%" + title + "%");
            }

            if (company != null) {
                ps.setString(parameterIndex++, "%" + company + "%");
            }

            if (category > 0) {
                ps.setInt(parameterIndex++, category);
            }

            if (location != null) {
                ps.setString(parameterIndex++, "%" + location + "%");
            }

            ps.setInt(parameterIndex++, (index - 1) * 4);
            rs = ps.executeQuery();

            CompanyDAO com = new CompanyDAO();
            CategoryDAO cd = new CategoryDAO();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String titleString = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String locationString = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company companyObject = com.findById(idCompany);
                Category categoryObject = cd.findById(idCategory);
                Job j = new Job(idJob, companyObject, categoryObject, titleString, desc, expY, locationString, salary, status, date);
                filterJobs.add(j);
            }
        } catch (Exception e) {
            // Handle exceptions
            System.out.println(e);
        }
//
//        System.out.println(query);
        return filterJobs;
    }

    public int countJobsByCriteria(String title, String company, int category, int experienceOption, String location, int salaryOption) {
        int jobCount = 0;

        StringBuilder query = new StringBuilder("SELECT COUNT(DISTINCT J.JobID) as JobCount\n"
                + "FROM Jobs J\n"
                + "LEFT JOIN CompanyProfile C ON J.CompanyID = C.CompanyID\n"
                + "LEFT JOIN Categories CAT ON J.CategoryID = CAT.CategoryID\n"
                + "WHERE J.Status = 'Accept'");

        if (title != null) {
            query.append(" AND J.Title LIKE ?");
        }

        if (company != null) {
            query.append(" AND J.CompanyID = ?");
        }

        if (category > 0) {
            query.append(" AND J.CategoryID = ?");
        }

        if (experienceOption == 1) {
            query.append(" AND J.ExperienceYears >= 0 AND J.ExperienceYears <= 1");
        } else if (experienceOption == 2) {
            query.append(" AND J.ExperienceYears > 1 AND J.ExperienceYears <= 2");
        } else if (experienceOption == 3) {
            query.append(" AND J.ExperienceYears > 2");
        }

        if (location != null) {
            query.append(" AND J.[Location] LIKE ?");
        }

        if (salaryOption == 2000) {
            query.append(" AND J.Salary >= 0 AND J.Salary <= 2000");
        } else if (salaryOption == 3000) {
            query.append(" AND J.Salary > 2000 AND J.Salary <= 4000");
        } else if (salaryOption == 4000) {
            query.append(" AND J.Salary > 4000");
        }

        try {
            conn = new DBContext().getConnection(); // Open connection to SQL
            ps = conn.prepareStatement(query.toString());
            int parameterIndex = 1;

            if (title != null) {
                ps.setString(parameterIndex++, "%" + title + "%");
            }

            if (company != null) {
                ps.setString(parameterIndex++, "%" + company + "%");
            }

            if (category > 0) {
                ps.setInt(parameterIndex++, category);
            }

            if (location != null) {
                ps.setString(parameterIndex++, "%" + location + "%");
            }

            rs = ps.executeQuery();

            if (rs.next()) {
                jobCount = rs.getInt("JobCount");
            }
        } catch (Exception e) {
            // Handle exceptions
            System.out.println(e);
        }

        System.out.println(query);
        return jobCount;
    }

    //Company
    public List<Company> getAllCompany() {
        List<Company> list = new ArrayList<>();
        String query = "SELECT * FROM CompanyProfile";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idCompany = rs.getInt(1);
                String nameCompany = rs.getString(2);
                int idUser = rs.getInt(3);
                String aboutUs = rs.getString(4);
                String add = rs.getString(5);
                String status = rs.getString(6);
                String url = rs.getString(7);
                JobseekerDAO jd = new JobseekerDAO();
                User user = jd.findById(idUser);
                Company c = new Company(idCompany, nameCompany, user, aboutUs, add, status, url);
                list.add(c);

            }
        } catch (Exception ex) {

        }
        return list;
    }

    //Category
    public List<Category> getAllCategory() {

        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idCategory = rs.getInt(1);
                String CategoryName = rs.getString(2);
                Category c = new Category(idCategory, CategoryName);
                list.add(c);
            }
        } catch (Exception ex) {

        }
        return list;

    }

    //Location
    public List<Job> getAllLocation() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT distinct Location FROM Jobs";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String location = rs.getString(1);
                Job j = new Job(location);
                list.add(j);
            }
        } catch (Exception ex) {

        }
        return list;
    }

    public Company companyByJobId(int id) {
        String sql = "select * from CompanyProfile cp\n"
                + "join Jobs j on cp.CompanyID = j.CompanyID\n"
                + "where j.JobID = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int idCompany = rs.getInt(1);
                String nameCompany = rs.getString(2);
                int idUser = rs.getInt(3);
                String aboutUs = rs.getString(4);
                String add = rs.getString(5);
                String status = rs.getString(6);
                String url = rs.getString(7);
                JobseekerDAO jd = new JobseekerDAO();
                User user = jd.findById(idUser);
                Company c = new Company(idCompany, nameCompany, user, aboutUs, add, status, url);
                return c;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    

    public static void main(String[] args) {
        FilterDAO dao = new FilterDAO();
        List<Job> job = dao.getJobsByCriteria(null, "ABC", 0, 0, "New York", 0, 1);
        for (Job job1 : job) {
            System.out.println(job1);
        }

    }
}
