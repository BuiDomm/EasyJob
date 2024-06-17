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
public class Answer {
    private int answerID;         
    private Question question;   
    private String answerText;   
    private Date answerDate;     
    private int isTrue;

    public Answer() {
    }

    public Answer(int answerID, Question question, String answerText, Date answerDate, int isTrue) {
        this.answerID = answerID;
        this.question = question;
        this.answerText = answerText;
        this.answerDate = answerDate;
        this.isTrue = isTrue;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }

    public Date getAnswerDate() {
        return answerDate;
    }

    public void setAnswerDate(Date answerDate) {
        this.answerDate = answerDate;
    }

    public int getIsTrue() {
        return isTrue;
    }

    public void setIsTrue(int isTrue) {
        this.isTrue = isTrue;
    }

    @Override
    public String toString() {
        return "Answer{" + "answerID=" + answerID + ", question=" + question + ", answerText=" + answerText + ", answerDate=" + answerDate + ", isTrue=" + isTrue + '}';
    }
    
}
