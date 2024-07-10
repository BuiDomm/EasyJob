/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author This PC
 */
public class FavoriteJobDTO {
    private int id;
    private String title;
    private int yearEx;
    private String location;
    private int salary;
    private String companyName;
    private String Status;

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public FavoriteJobDTO(int id, String title, int yearEx, String location, int salary, String companyName, String Status) {
        this.id = id;
        this.title = title;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
        this.companyName = companyName;
        this.Status = Status;
    }
    
    

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public FavoriteJobDTO(int id, String title, int yearEx, String location, int salary, String companyName) {
        this.id = id;
        this.title = title;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
        this.companyName = companyName;
    }
    
    
    

    public FavoriteJobDTO(int id, String title, String location, int salary) {
        this.id = id;
        this.title = title;
        this.location = location;
        this.salary = salary;
    }

    public FavoriteJobDTO(int id, String title, int yearEx, String location, int salary) {
        this.id = id;
        this.title = title;
        this.yearEx = yearEx;
        this.location = location;
        this.salary = salary;
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
    
    

    public FavoriteJobDTO() {
    }

    public FavoriteJobDTO(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
    
}
