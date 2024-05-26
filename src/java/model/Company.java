/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class Company {

    private int companyID;
    private String nameCompany;
    private User user;
    private String aboutUS;
    private String add;
    private String status;
    private String url;

    public Company(int companyID, User user, String aboutUS, String add, String status) {
        this.companyID = companyID;
        this.user = user;
        this.aboutUS = aboutUS;
        this.add = add;
        this.status = status;
    }

    public Company(int companyID, String nameCompany, User user, String aboutUS, String add, String status, String url) {
        this.companyID = companyID;
        this.nameCompany = nameCompany;
        this.user = user;
        this.aboutUS = aboutUS;
        this.add = add;
        this.status = status;
        this.url = url;
    }

    public Company(String nameCompany, User user, String aboutUS, String add, String status, String url) {
        this.nameCompany = nameCompany;
        this.user = user;
        this.aboutUS = aboutUS;
        this.add = add;
        this.status = status;
        this.url = url;
    }
    
    

    public Company() {
    }

    public Company(User user, String aboutUS, String add, String status) {
        this.user = user;
        this.aboutUS = aboutUS;
        this.add = add;
        this.status = status;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAboutUS() {
        return aboutUS;
    }

    public void setAboutUS(String aboutUS) {
        this.aboutUS = aboutUS;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getStatus() {
        return status;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public void setNameCompany(String nameCompany) {
        this.nameCompany = nameCompany;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Company{" + "companyID=" + companyID + ", nameCompany=" + nameCompany + ", user=" + user + ", aboutUS=" + aboutUS + ", add=" + add + ", status=" + status + ", url=" + url + '}';
    }

  

}
