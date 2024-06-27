/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Packages {
    private int packageID;
    private String packageName;
    private String description;
    private int price;

    public Packages() {
    }

    public Packages(int packageID, String packageName, String description, int price) {
        this.packageID = packageID;
        this.packageName = packageName;
        this.description = description;
        this.price = price;
    }

    public int getPackageID() {
        return packageID;
    }

    public void setPackageID(int packageID) {
        this.packageID = packageID;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Package{" + "packageID=" + packageID + ", packageName=" + packageName + ", description=" + description + ", price=" + price + '}';
    }
    
    
    
}
