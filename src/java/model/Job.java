/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Job {
    private int jobID;
    private Company company;
    private Category category;
    private String title;
    private String descrip;
    private int yearEx;
    private String location;
    private int salary;
    private String status;
    private Date date;

      
     public Job( String location) {  
        this.location = location;   
    }


    public Job(int jobID, Company company, Category category, String title, String descrip, int yearEx, String location, int salary, String status, Date date) {
        this.jobID = jobID;
        this.company = company;
        this.category = category;
        this.title = title;
        this.descrip = descrip;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
        this.status = status;
        this.date = date;
    }

    public Job(Company company, Category category, String title, String descrip, int yearEx, String location, int salary, String status, Date date) {
        this.company = company;
        this.category = category;
        this.title = title;
        this.descrip = descrip;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
        this.status = status;
        this.date = date;
    }

    
    
    
    public Job(int jobID, Company company, Category category, String title, String descrip, int yearEx, String location, int salary, String status) {
        this.jobID = jobID;
        this.company = company;
        this.category = category;
        this.title = title;
        this.descrip = descrip;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
        this.status = status;
    }

    public Job(Company company, Category category, String title, String descrip, int yearEx, String location, int salary, String status) {
        this.company = company;
        this.category = category;
        this.title = title;
        this.descrip = descrip;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
        this.status = status;
    }

    public Job(Company company, Category category, String title, String descrip, int yearEx, String location, int salary) {
        this.company = company;
        this.category = category;
        this.title = title;
        this.descrip = descrip;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
    }

    public int getJobID() {
        return jobID;
    }

    @Override
    public String toString() {
        return "Job{" + "jobID=" + jobID + ", company=" + company + ", category=" + category + ", title=" + title + ", descrip=" + descrip + ", yearEx=" + yearEx + ", location=" + location + ", salary=" + salary + ", status=" + status + ", date=" + date + '}';
    }

  

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public Company getCompany() {
        return company;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    

    public void setCompany(Company company) {
        this.company = company;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public int getYearEx() {
        return yearEx;
    }

    public void setYearEx(int yearEx) {
        this.yearEx = yearEx;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
}
