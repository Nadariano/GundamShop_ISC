/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author Dell
 */
public class User {
    private int accountId;
    private String email;
    private String accountPass;
    private String accountName;
    private String accountPhone;
    private String accountAddress;
    private boolean roleId;

    public User() {
    }

    public User(int accountId, String email, String accountPass, String accountName, String accountPhone, String accountAddress) {
        this.accountId = accountId;
        this.email = email;
        this.accountPass = accountPass;
        this.accountName = accountName;
        this.accountPhone = accountPhone;
        this.accountAddress = accountAddress;
    }

    public User(int accountId, String email, String accountPass, String accountName, String accountPhone, String accountAddress, boolean roleId) {
        this.accountId = accountId;
        this.email = email;
        this.accountPass = accountPass;
        this.accountName = accountName;
        this.accountPhone = accountPhone;
        this.accountAddress = accountAddress;
        this.roleId = roleId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccountPass() {
        return accountPass;
    }

    public void setAccountPass(String accountPass) {
        this.accountPass = accountPass;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountPhone() {
        return accountPhone;
    }

    public void setAccountPhone(String accountPhone) {
        this.accountPhone = accountPhone;
    }

    public String getAccountAddress() {
        return accountAddress;
    }

    public void setAccountAddress(String accountAddress) {
        this.accountAddress = accountAddress;
    }

    public boolean isRoleId() {
        return roleId;
    }

    public void setRoleId(boolean roleId) {
        this.roleId = roleId;
    }

  
}