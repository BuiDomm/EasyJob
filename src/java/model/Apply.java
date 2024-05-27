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
public class Apply {
    
    private int applicationID;
    private Job job;
    private CVProfile cvProfile;
    private Date applicationDate;
    private String status;

    public Apply() {
    }

    public Apply(Job job, CVProfile cvProfile, String status) {
        this.job = job;
        this.cvProfile = cvProfile;
        this.status = status;
    }
    
    
    

    public Apply(int applicationID, Job job, CVProfile cvProfile, Date applicationDate, String status) {
        this.applicationID = applicationID;
        this.job = job;
        this.cvProfile = cvProfile;
        this.applicationDate = applicationDate;
        this.status = status;
    }

    public Apply(Job job, CVProfile cvProfile, Date applicationDate, String status) {
        this.job = job;
        this.cvProfile = cvProfile;
        this.applicationDate = applicationDate;
        this.status = status;
    }

    public int getApplicationID() {
        return applicationID;
    }

    public void setApplicationID(int applicationID) {
        this.applicationID = applicationID;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public CVProfile getCvProfile() {
        return cvProfile;
    }

    public void setCvProfile(CVProfile cvProfile) {
        this.cvProfile = cvProfile;
    }

    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Apply{" + "applicationID=" + applicationID + ", job=" + job + ", cvProfile=" + cvProfile + ", applicationDate=" + applicationDate + ", status=" + status + '}';
    }
    
    
    
}
