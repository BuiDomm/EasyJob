/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Company;
import model.FavoriteJobDTO;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class JobDAO extends DBContext implements BaseDAO<Job> {

    CompanyDAO com = new CompanyDAO();
    CategoryDAO cd = new CategoryDAO();

    private static final int RECORDS_PER_PAGE = 6;

    @Override
    public List<Job> getAll() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> getAllJobAccept() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs \n"
                + "Where Status = 'Accept'";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public Job findById(int id) {
        String sql = "Select * from jobs\n"
                + "where JobID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                return j;

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Job> findByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs\n"
                + "Join CompanyProfile as CM on CM.CompanyID = jobs.CompanyID\n"
                + "JOIN Users as u on u.UserID = CM.UserID\n"
                + "Where u.UserID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> findAcceptJobByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs\n"
                + "Join CompanyProfile as CM on CM.CompanyID = jobs.CompanyID\n"
                + "JOIN Users as u on u.UserID = CM.UserID\n"
                + "Where u.UserID = ? AND jobs.Status = 'Accept'\n"
                + "ORDER BY jobs.Date DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> findRejectJobByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs\n"
                + "Join CompanyProfile as CM on CM.CompanyID = jobs.CompanyID\n"
                + "JOIN Users as u on u.UserID = CM.UserID\n"
                + "Where u.UserID = ? AND jobs.Status = 'Reject'\n"
                + "ORDER BY jobs.Date DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> findPendingJobByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs\n"
                + "Join CompanyProfile as CM on CM.CompanyID = jobs.CompanyID\n"
                + "JOIN Users as u on u.UserID = CM.UserID\n"
                + "Where u.UserID = ? AND jobs.Status = 'Pending'\n"
                + "ORDER BY jobs.Date DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getPageNumber() {

        String sql = "Select count(*) as countjob from jobs where status = 'Accept'";

        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                int numberpage = 0;
                numberpage = count / 12;
                if (count % 12 != 0) {
                    numberpage = numberpage + 1;
                }
                return numberpage;

            }

        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Job> getTop3() {
        List<Job> list = new ArrayList<>();
        String sql = "SElect TOP 3  * FROM Jobs\n"
                + "Order by JobID DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> getTop3Succes() {
        List<Job> list = new ArrayList<>();
        String sql = "SElect TOP 3  * FROM Jobs "
                + "Where Status = 'Accept' \n"
                + "Order by JobID DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> getAllFollowPage(int num) {
        List<Job> list = new ArrayList<>();
        CategoryDAO cd = new CategoryDAO();
        String sql = "Select * from jobs where status = 'Accept'\n"
                + "	order by JobID\n"
                + "	offset ? rows \n"
                + "	fetch first 12 rows only";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, (num - 1) * 12);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);

                list.add(j);
            }

        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean insert(Job newObject) {
        String sql = "	Insert Into Jobs(CompanyID,CategoryID,Title,Description,ExperienceYears,Location,Salary,Status) \n"
                + "	Values(?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, newObject.getCompany().getCompanyID());
            ps.setInt(2, newObject.getCategory().getCategoryID());
            ps.setString(3, newObject.getTitle());
            ps.setString(4, newObject.getDescrip());
            ps.setInt(5, newObject.getYearEx());
            ps.setString(6, newObject.getLocation());
            ps.setInt(7, newObject.getSalary());
            ps.setString(8, newObject.getStatus());
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean updateStatusExpire(int idJob) {

        String sql = "Update Jobs\n"
                + "Set Status = 'Expire'\n"
                + "Where JobID = ?";

        PreparedStatement ps;
        try {
            ps = getConnection().prepareStatement(sql);
            ps.setInt(1, idJob);

            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Job getJobCurrentInsert(int idUser) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT TOP 1 * FROM Jobs\n"
                + "JOIN CompanyProfile as COM On COM.CompanyID = Jobs.CompanyID\n"
                + "JOIN Users as Us ON Us.UserID = COM.UserID\n"
                + "Where Us.UserID = ? \n"
                + "ORder by JobID DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                return j;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countAcceptedJobs(int companyId) {
        String sql = "SELECT COUNT(*) AS AcceptedJobCount FROM Jobs WHERE CompanyID = ? AND Status = 'Accept'";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("AcceptedJobCount");
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int countRejectJobs(int companyId) {
        String sql = "SELECT COUNT(*) AS RejectJobCount FROM Jobs WHERE CompanyID = ? AND Status = 'Reject'";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("RejectJobCount");
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int countPendingJobs(int companyId) {
        String sql = "SELECT COUNT(*) AS PendingJobCount FROM Jobs WHERE CompanyID = ? AND Status = 'Pending'";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, companyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("PendingJobCount");
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public boolean update(Job job) {
        String sql = "UPDATE [dbo].[Jobs]\n"
                + "   SET [CategoryID] = ?\n"
                + "      ,[Title] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[ExperienceYears] = ?\n"
                + "      ,[Location] = ?\n"
                + "      ,[Salary] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[Date] = GETDATE()\n"
                + " WHERE JobID=?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, job.getCategory().getCategoryID());
            st.setString(2, job.getTitle());
            st.setString(3, job.getDescrip());
            st.setInt(4, job.getYearEx());
            st.setString(5, job.getLocation());
            st.setInt(6, job.getSalary());
            st.setString(7, job.getStatus());
            st.setInt(8, job.getJobID());

            int rowAffect = st.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String deleteAnswersSql = "DELETE FROM Answers WHERE QuestionID IN (SELECT QuestionID FROM Questions WHERE JobID = ?)";
        String deleteQuestionsSql = "DELETE FROM Questions WHERE JobID = ?";
        String deleteJobSql = "DELETE FROM Jobs WHERE JobID = ?";
        PreparedStatement ps;
        try {

            PreparedStatement deleteAns = getConnection().prepareStatement(deleteAnswersSql);
            deleteAns.setInt(1, id);
            deleteAns.executeUpdate();

            PreparedStatement deleteQues = getConnection().prepareStatement(deleteQuestionsSql);
            deleteQues.setInt(1, id);
            deleteQues.executeUpdate();

            PreparedStatement deleteJob = getConnection().prepareStatement(deleteJobSql);
            deleteJob.setInt(1, id);
            int rowAffect = deleteJob.executeUpdate();

            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public String getJobTitleById(int id) {
        String sql = "Select Title from jobs\n"
                + "where JobID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String title = rs.getString("Title");
                return title;

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public FavoriteJobDTO findJobFavoriteById(int id) {
        String sql = "SELECT j.JobID, j.Title, j.ExperienceYears, j.Location, j.Salary, c.CompanyName FROM jobs j JOIN CompanyProfile c ON j.CompanyID = c.CompanyID WHERE j.JobID = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idJob = rs.getInt(1);
                String title = rs.getString(2);
                int expY = rs.getInt(3);
                String location = rs.getString(4);
                int salary = rs.getInt(5);
                String companyName = rs.getString(6);

                return new FavoriteJobDTO(idJob, title, expY, location, salary, companyName);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Job findByCompanyId(int id) {
        String sql = "Select * from jobs\n"
                + "where CompanyID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                return j;

            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Job> getJobsCompany(int cid, int page) {
        List<Job> list = new ArrayList<>();
        int start = (page - 1) * RECORDS_PER_PAGE;
        String sql = "SELECT * FROM Jobs WHERE CompanyID = ? AND Status = 'Accept' ORDER BY JobID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, start);
            ps.setInt(3, RECORDS_PER_PAGE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt(1);
                int idCompany = rs.getInt(2);
                int idCategory = rs.getInt(3);
                String title = rs.getString(4);
                String desc = rs.getString(5);
                int expY = rs.getInt(6);
                String location = rs.getString(7);
                int salary = rs.getInt(8);
                String status = rs.getString(9);
                Date date = rs.getDate(10);
                Company company = com.findById(idCompany);
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);
                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getNoOfJobCom(int cid) {
        int noOfJCom = 0;
        String sql = "SELECT COUNT(*) FROM Jobs WHERE CompanyID = ? AND Status = 'Accept' ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                noOfJCom = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return noOfJCom;
    }

    public List<Job> findPendingJobsWithQuestionsByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT DISTINCT jobs.JobID, jobs.CompanyID, jobs.CategoryID, jobs.Title, jobs.Description, "
                + "jobs.ExperienceYears, jobs.Location, jobs.Salary, jobs.Status, jobs.Date "
                + "FROM Jobs jobs "
                + "JOIN CompanyProfile CM on CM.CompanyID = jobs.CompanyID "
                + "JOIN Users u on u.UserID = CM.UserID "
                + "LEFT JOIN Questions q on q.JobID = jobs.JobID "
                + "WHERE u.UserID = ? AND jobs.Status = 'Pending' AND q.Content IS NOT NULL "
                + "ORDER BY jobs.Date DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt("JobID");
                int idCompany = rs.getInt("CompanyID");
                int idCategory = rs.getInt("CategoryID");
                String title = rs.getString("Title");
                String desc = rs.getString("Description");
                int expY = rs.getInt("ExperienceYears");
                String location = rs.getString("Location");
                int salary = rs.getInt("Salary");
                String status = rs.getString("Status");
                Date date = rs.getDate("Date");

                CompanyDAO com = new CompanyDAO();
                Company company = com.findById(idCompany);
                CategoryDAO cd = new CategoryDAO();
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);

                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobApplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Job> findPendingJobsWithNoQuestionsByIdUser(int id) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT jobs.*, CM.* FROM Jobs jobs "
                + "JOIN CompanyProfile CM on CM.CompanyID = jobs.CompanyID "
                + "JOIN Users u on u.UserID = CM.UserID "
                + "LEFT JOIN Questions q on q.JobID = jobs.JobID "
                + "WHERE u.UserID = ? AND jobs.Status = 'Pending' AND q.Content IS NULL "
                + "ORDER BY jobs.Date DESC";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idJob = rs.getInt("JobID");
                int idCompany = rs.getInt("CompanyID");
                int idCategory = rs.getInt("CategoryID");
                String title = rs.getString("Title");
                String desc = rs.getString("Description");
                int expY = rs.getInt("ExperienceYears");
                String location = rs.getString("Location");
                int salary = rs.getInt("Salary");
                String status = rs.getString("Status");
                Date date = rs.getDate("Date");

                CompanyDAO com = new CompanyDAO();
                Company company = com.findById(idCompany);
                CategoryDAO cd = new CategoryDAO();
                Category category = cd.findById(idCategory);
                Job j = new Job(idJob, company, category, title, desc, expY, location, salary, status, date);

                list.add(j);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobApplyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public static void main(String[] args) {
        JobDAO jobDAO = new JobDAO();

        // Replace with the actual user ID you want to test
        int testUserId = 2; // Example user ID

        // Get pending jobs with no questions by user ID
        List<Job> jobs = jobDAO.findPendingJobsWithQuestionsByIdUser(testUserId);

        // Print the retrieved jobs
        for (Job job : jobs) {
            System.out.println("Job ID: " + job.getJobID());
            System.out.println("Company: " + job.getCompany().getNameCompany());
            System.out.println("Category: " + job.getCategory().getCategoryName());
            System.out.println("Title: " + job.getTitle());
            System.out.println("Description: " + job.getDescrip());
            System.out.println("Experience Years: " + job.getYearEx());
            System.out.println("Location: " + job.getLocation());
            System.out.println("Salary: " + job.getSalary());
            System.out.println("Status: " + job.getStatus());
            System.out.println("Date: " + job.getDate());
            System.out.println("-----------------------------");
        }

        // If no jobs found, print a message
        if (jobs.isEmpty()) {
            System.out.println("No pending jobs without questions found for the given user ID.");
        }
    }
}
