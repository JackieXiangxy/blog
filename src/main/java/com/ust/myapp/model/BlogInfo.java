package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 博客信息实例
 */
public class BlogInfo implements Serializable{

  
	private static final long serialVersionUID = 1L;


	private Integer id;//博客id


    private User user;//博客作者


    private String blogName;//博客名称


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getBlogName() {
        return blogName;
    }


    public void setBlogName(String blogName) {
        this.blogName = blogName == null ? null : blogName.trim();
    }
}