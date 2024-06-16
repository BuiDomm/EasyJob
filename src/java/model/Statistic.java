/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Statistic {
    private int year;
    private int month;
    private int countJob;

    public Statistic() {
    }

    public Statistic(int year, int month, int countJob) {
        this.year = year;
        this.month = month;
        this.countJob = countJob;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getCountJob() {
        return countJob;
    }

    public void setCountJob(int countJob) {
        this.countJob = countJob;
    }

    @Override
    public String toString() {
        return "Statistic{" + "year=" + year + ", month=" + month + ", countJob=" + countJob + '}';
    }
    
    
}
