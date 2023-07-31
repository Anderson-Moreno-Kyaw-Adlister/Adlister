package com.codeup.adlister.models;

import com.codeup.adlister.dao.Ads;

import java.util.ArrayList;
import java.util.List;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private List<Ads> userAds;
    public User(){}

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        setPassword(password);
        this.userAds = new ArrayList<>();
    }


    public User(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public User(String username, String email, Long id) {
        this.username = username;
        this.email = email;
        this.id =id;
        this.userAds = new ArrayList<>();
    }

    public User(Long id,String username, String email, String password) {
        this.id =id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.userAds = new ArrayList<>();
    }
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
