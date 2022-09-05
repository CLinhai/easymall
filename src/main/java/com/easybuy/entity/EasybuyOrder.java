package com.easybuy.entity;

import java.util.Date;

public class EasybuyOrder {
    private Integer eoId;

    private Integer eoUserId;

    private String eoUserName;

    private String eoUserAddress;

    private Date eoCreateTime;

    private Double eoCost;

    private Integer eoStatus;

    private Integer eoType;

    public Integer getEoId() {
        return eoId;
    }

    public void setEoId(Integer eoId) {
        this.eoId = eoId;
    }

    public Integer getEoUserId() {
        return eoUserId;
    }

    public void setEoUserId(Integer eoUserId) {
        this.eoUserId = eoUserId;
    }

    public String getEoUserName() {
        return eoUserName;
    }

    public void setEoUserName(String eoUserName) {
        this.eoUserName = eoUserName == null ? null : eoUserName.trim();
    }

    public String getEoUserAddress() {
        return eoUserAddress;
    }

    public void setEoUserAddress(String eoUserAddress) {
        this.eoUserAddress = eoUserAddress == null ? null : eoUserAddress.trim();
    }

    public Date getEoCreateTime() {
        return eoCreateTime;
    }

    public void setEoCreateTime(Date eoCreateTime) {
        this.eoCreateTime = eoCreateTime;
    }

    public Double getEoCost() {
        return eoCost;
    }

    public void setEoCost(Double eoCost) {
        this.eoCost = eoCost;
    }

    public Integer getEoStatus() {
        return eoStatus;
    }

    public void setEoStatus(Integer eoStatus) {
        this.eoStatus = eoStatus;
    }

    public Integer getEoType() {
        return eoType;
    }

    public void setEoType(Integer eoType) {
        this.eoType = eoType;
    }
}