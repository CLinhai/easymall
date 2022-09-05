package com.easybuy.entity;

import java.util.Date;

public class EasybuyComment {
    private Integer ecId;

    private String ecReply;

    private String ecContent;

    private Date ecCreateTime;

    private Date ecReplyTime;

    private Integer ecNickId;

    private String ecNickName;

    private Integer ecProductId;

    public Integer getEcId() {
        return ecId;
    }

    public void setEcId(Integer ecId) {
        this.ecId = ecId;
    }

    public String getEcReply() {
        return ecReply;
    }

    public void setEcReply(String ecReply) {
        this.ecReply = ecReply == null ? null : ecReply.trim();
    }

    public String getEcContent() {
        return ecContent;
    }

    public void setEcContent(String ecContent) {
        this.ecContent = ecContent == null ? null : ecContent.trim();
    }

    public Date getEcCreateTime() {
        return ecCreateTime;
    }

    public void setEcCreateTime(Date ecCreateTime) {
        this.ecCreateTime = ecCreateTime;
    }

    public Date getEcReplyTime() {
        return ecReplyTime;
    }

    public void setEcReplyTime(Date ecReplyTime) {
        this.ecReplyTime = ecReplyTime;
    }

    public Integer getEcNickId() {
        return ecNickId;
    }

    public void setEcNickId(Integer ecNickId) {
        this.ecNickId = ecNickId;
    }

    public String getEcNickName() {
        return ecNickName;
    }

    public void setEcNickName(String ecNickName) {
        this.ecNickName = ecNickName == null ? null : ecNickName.trim();
    }

    public Integer getEcProductId() {
        return ecProductId;
    }

    public void setEcProductId(Integer ecProductId) {
        this.ecProductId = ecProductId;
    }
}