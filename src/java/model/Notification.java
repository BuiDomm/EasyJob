/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class Notification {
    private int notificationID;
    private int userID;
    private String message;
    private String time;
    private int readStatus;

    public Notification() {
    }

    public Notification(int notificationID, int userID, String message, String time, int readStatus) {
        this.notificationID = notificationID;
        this.userID = userID;
        this.message = message;
        this.time = time;
        this.readStatus = readStatus;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getReadStatus() {
        return readStatus;
    }

    public void setReadStatus(int readStatus) {
        this.readStatus = readStatus;
    }

    @Override
    public String toString() {
        return "Notification{" + "notificationID=" + notificationID + ", userID=" + userID + ", message=" + message + ", time=" + time + ", readStatus=" + readStatus + '}';
    }

  
    
}
