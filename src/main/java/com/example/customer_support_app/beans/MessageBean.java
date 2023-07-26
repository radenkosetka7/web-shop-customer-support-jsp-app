package com.example.customer_support_app.beans;

import java.io.Serializable;

public class MessageBean implements Serializable {


    private	Integer id;
    private String question;
    private Boolean status;
    private String recipientMail;

    public MessageBean()
    {

    }

    public MessageBean(Integer id, String question, Boolean status, String recipientMail) {
        super();
        this.id = id;
        this.question = question;
        this.status = status;
        this.recipientMail = recipientMail;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getRecipientMail() {
        return recipientMail;
    }

    public void setRecipientMail(String recipientMail) {
        this.recipientMail = recipientMail;
    }



}