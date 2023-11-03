package com.example.bt_jsp_servlet_ss10.model;

public class Clients {
    private String fullname;
    private String date;
    private String address;

    public Clients(String fullname, String date, String address) {
        this.fullname = fullname;
        this.date = date;
        this.address = address;
    }

    public Clients() {
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
