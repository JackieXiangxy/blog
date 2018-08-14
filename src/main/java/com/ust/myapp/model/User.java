package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 用户实体类
 */
public class User implements Serializable{

	private static final long serialVersionUID = 1L;


	private Integer id;//用户id


    private String username;//用户账号


    private String password;//用户密码


    private String email;//用户邮箱


    private Boolean isApplied;//是否激活


    private Boolean isDelete;//是否删除


    private Boolean isProfile;//个人信息是否完整
    
    
    
    


    public User(String username, String password, String email) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
	}


	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}


	public User() {
	}


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


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }


    public Boolean getIsApplied() {
        return isApplied;
    }


    public void setIsApplied(Boolean isApplied) {
        this.isApplied = isApplied;
    }


    public Boolean getIsDelete() {
        return isDelete;
    }


    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }


    public Boolean getIsProfile() {
        return isProfile;
    }

    public void setIsProfile(Boolean isProfile) {
        this.isProfile = isProfile;
    }
}