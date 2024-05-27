/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.Random;
import model.Apply;
import model.CVProfile;
import model.Job;
import model.User;

/**
 *
 * @author ASUS
 */
public class test {

    public static void main(String[] args) {

        JobseekerDAO jd = new JobseekerDAO();
        User u = new User("Buiii", "Nhan", "nhanbtde170234@fpt.edu.vn", "Congdeptrai.vn?", 2);
//        User u1 = new User("Truong", "van", "n@gmail.com","passs", 2, "","","da nang","",);

//        jd.insert(u1);
        Random random = new Random();
        CategoryDAO cd = new CategoryDAO();
        CompanyDAO com = new CompanyDAO();
        JobDAO job = new JobDAO();
        JobseekerDAO jse = new JobseekerDAO();
        CVDAO cvd = new CVDAO();
//        System.out.println(cvd.findByIdUser(1));
        
        Job j = job.findById(4);
        
        CVProfile cvp = cvd.findById(1);
//                System.out.println(cvp);

        ApplyDAO ad = new ApplyDAO();
        Apply a = new Apply(j, cvp, "Pending");
        
//        System.out.println(ad.insert(a));

        System.out.println(ad.findListByIdCV(1));
        
        

//        System.out.println(jse.getRoleByEmail("nhanbtde170234@fpt.edu.vn"));

    }

}
