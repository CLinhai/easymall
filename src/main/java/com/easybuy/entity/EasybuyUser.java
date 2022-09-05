package com.easybuy.entity;

public class EasybuyUser {
    private Integer euUserId;

    private String euUserLoginid;

    private String euUserName;

    private String euPassword;

    private String euSex;

    private String euBirthday;

    private String euIdentityCode;

    private String euEmail;

    private String euMobile;

    private String euAddress;

    private Integer euStatus;

    private String euFilepath;

    public Integer getEuUserId() {
        return euUserId;
    }

    public void setEuUserId(Integer euUserId) {
        this.euUserId = euUserId;
    }

    public String getEuUserLoginid() {
        return euUserLoginid;
    }

    public void setEuUserLoginid(String euUserLoginid) {
        this.euUserLoginid = euUserLoginid == null ? null : euUserLoginid.trim();
    }

    public String getEuUserName() {
        return euUserName;
    }

    public void setEuUserName(String euUserName) {
        this.euUserName = euUserName == null ? null : euUserName.trim();
    }

    public String getEuPassword() {
        return euPassword;
    }

    public void setEuPassword(String euPassword) {
        this.euPassword = euPassword == null ? null : euPassword.trim();
    }

    public String getEuSex() {
        return euSex;
    }

    public void setEuSex(String euSex) {
        this.euSex = euSex == null ? null : euSex.trim();
    }

    public String getEuBirthday() {
        return euBirthday;
    }

    public void setEuBirthday(String euBirthday) {
        this.euBirthday = euBirthday == null ? null : euBirthday.trim();
    }

    public String getEuIdentityCode() {
        return euIdentityCode;
    }

    public void setEuIdentityCode(String euIdentityCode) {
        this.euIdentityCode = euIdentityCode == null ? null : euIdentityCode.trim();
    }

    public String getEuEmail() {
        return euEmail;
    }

    public void setEuEmail(String euEmail) {
        this.euEmail = euEmail == null ? null : euEmail.trim();
    }

    public String getEuMobile() {
        return euMobile;
    }

    public void setEuMobile(String euMobile) {
        this.euMobile = euMobile == null ? null : euMobile.trim();
    }

    public String getEuAddress() {
        return euAddress;
    }

    public void setEuAddress(String euAddress) {
        this.euAddress = euAddress == null ? null : euAddress.trim();
    }

    public Integer getEuStatus() {
        return euStatus;
    }

    public void setEuStatus(Integer euStatus) {
        this.euStatus = euStatus;
    }

    public String getEuFilepath() {
        return euFilepath;
    }

    public void setEuFilepath(String euFilepath) {
        this.euFilepath = euFilepath == null ? null : euFilepath.trim();
    }
}