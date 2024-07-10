/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.io.File;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String tempDirPath = System.getProperty("java.io.tmpdir")  + File.separator + "tmp";
        File tmpDir = new File(tempDirPath);

        if (!tmpDir.exists()) {
            if (tmpDir.mkdirs()) {
                System.out.println("Temporary upload directory created at: " + tempDirPath);
            } else {
                System.err.println("Failed to create temporary upload directory at: " + tempDirPath);
            }
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // No action needed here
    }
}