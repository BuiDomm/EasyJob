/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Comment;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author This PC
 */
public class CommentDAO extends DBContext implements BaseDAO<Comment> {

    public boolean updateComment(int commentId, String content) {
        String sql = "UPDATE Comments SET CommentText = ?, CommentDate = GETDATE() WHERE CommentID = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, commentId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getCountByBlog(int blogId) {
        int result = 0;
        String sql = "SELECT COUNT(*) FROM Comments WHERE BlogID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, blogId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int findUserIdByCmt(int id) {
        String sql = "SELECT * FROM Comments \n"
                + "Where CommentID = ? ";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(2);
            }
        } catch (Exception ex) {
            Logger.getLogger(JobseekerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public Comment findCmtById(int cmtId) {
        
        try {
            String sql = "SELECT * FROM Comments \n"
                    + "WHERE CommentID = ? \n";

            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, cmtId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 return  (new Comment(
                        rs.getInt("CommentID"),
                        rs.getInt("UserID"),
                        rs.getInt("BlogID"),
                        rs.getString("CommentText"),
                        rs.getString("CommentDate")
                ));
            }
        } catch (Exception ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Comment> getAllLoadMore(int blogId) {
        List<Comment> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Comments \n"
                    + "WHERE BlogID = ? \n";

            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, blogId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(
                        rs.getInt("CommentID"),
                        rs.getInt("UserID"),
                        rs.getInt("BlogID"),
                        rs.getString("CommentText"),
                        rs.getString("CommentDate")
                ));
            }
        } catch (Exception ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public List<Comment> getAll() {
        return null;
    }

    @Override
    public Comment findById(int id) {
        return null;
    }

    @Override
    public boolean insert(Comment cmt) {
        String sql = "INSERT INTO [dbo].[Comments]\n"
                + "           ([UserID]\n"
                + "           ,[BlogID]\n"
                + "           ,[CommentText]\n"
                + "           ,[CommentDate]) \n"
                + "     VALUES \n"
                + "           (?,?,?,GETDATE())";

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, cmt.getUserId());
            st.setInt(2, cmt.getBlogId());
            st.setString(3, cmt.getContent());

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
    public boolean update(Comment newObject) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    public boolean deleteComment(int commentId) {
        String sql = "DELETE FROM Comments WHERE CommentID = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, commentId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateStatus(int commentId, String status) {
        String sql = "UPDATE Comments SET Status = 'Report' WHERE CommentID = ?";
        try {
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, commentId);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
