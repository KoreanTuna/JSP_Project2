package com.example.bin;

import java.util.Date;

public class PoketmonVO {
    private int pid;
    private String pnumber;
    private String pname;
    private String type;
    private String spcial;
    private String pclass;
    private int catch_rate;
    private String height;
    private double weight;
    private int familiar;
    private String photo;
    private String detail;
    private Date regdate;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPnumber() {
        return pnumber;
    }

    public void setPnumber(String pnumber) {
        this.pnumber = pnumber;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSpcial() {
        return spcial;
    }

    public void setSpcial(String spcial) {
        this.spcial = spcial;
    }

    public String getPclass() {
        return pclass;
    }

    public void setPclass(String pclass) {
        this.pclass = pclass;
    }

    public int getCatch_rate() {
        return catch_rate;
    }

    public void setCatch_rate(int catch_rate) {
        this.catch_rate = catch_rate;
    }
    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getFamiliar() {
        return familiar;
    }

    public void setFamiliar(int familiar) {
        this.familiar = familiar;
    }


    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
}
