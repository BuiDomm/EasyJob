/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class UserPackages {

    private int idUserPackage;
    private int PackageID;
    private int userID;

    public UserPackages(int idUserPackage, int PackageID, int userID) {
        this.idUserPackage = idUserPackage;
        this.PackageID = PackageID;
        this.userID = userID;
    }

    public UserPackages() {
    }

    public int getIdUserPackage() {
        return idUserPackage;
    }

    public void setIdUserPackage(int idUserPackage) {
        this.idUserPackage = idUserPackage;
    }

    public int getPackageID() {
        return PackageID;
    }

    public void setPackageID(int PackageID) {
        this.PackageID = PackageID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "UserPackages{" + "idUserPackage=" + idUserPackage + ", PackageID=" + PackageID + ", userID=" + userID + '}';
    }
    
        
    }
