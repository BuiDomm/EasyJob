/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class ChooseAnswer {
    
    private int chooseID;
    private User user;
    private Answer answer;
    private String status;

    public ChooseAnswer() {
    }

    public ChooseAnswer(int chooseID, User user, Answer answer, String status) {
        this.chooseID = chooseID;
        this.user = user;
        this.answer = answer;
        this.status = status;
    }

    public int getChooseID() {
        return chooseID;
    }

    public void setChooseID(int chooseID) {
        this.chooseID = chooseID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ChooseAnswer{" + "chooseID=" + chooseID + ", user=" + user + ", answer=" + answer + ", status=" + status + '}';
    }

    
}
