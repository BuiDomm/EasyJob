/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.Random;
import model.User;

/**
 *
 * @author ASUS
 */
public class test {

    public static void main(String[] args) {

        JobseekerDAO jd = new JobseekerDAO();
        User u = new User("Buiii", "Nhan", "nhanbtde170234@fpt.edu.vn", "Congdeptrai.vn?", 2);
//        jd.insert(u);
        Random random = new Random();
  
        
//        System.out.println(jd.update(u));

    }

}
