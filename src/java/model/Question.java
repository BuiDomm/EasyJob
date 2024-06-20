/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ACER
 */
public class Question {

    private String questionID;
    private Job job;
    private String content;
    private Date date;

    public Question() {
    }

    public Question(String questionID, Job job, String content, Date date) {
        this.questionID = questionID;
        this.job = job;
        this.content = content;
        this.date = date;
    }

    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Question{" + "questionID=" + questionID + ", job=" + job + ", content=" + content + ", date=" + date + '}';
    }

    

}
