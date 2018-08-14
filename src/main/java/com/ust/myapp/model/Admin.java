package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 管理员实例
 */
public class Admin implements Serializable{

	private static final long serialVersionUID = 1L;


	private Integer id;//管理员ID


    private String username;//管理员账号


    private String password;//管理员密码


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}