package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 文章分类
 */
public class Category implements Serializable{

	private static final long serialVersionUID = 1L;


	private Integer id;//分类id


    private User user;//作者


    private String categoryName;//分类名称


    private Integer articals;//个人文章数量


    private Boolean isDelete;//是否删除

 
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

   
    public String getCategoryName() {
        return categoryName;
    }


    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }


    public Integer getArticals() {
        return articals;
    }


    public void setArticals(Integer articals) {
        this.articals = articals;
    }


    public Boolean getIsDelete() {
        return isDelete;
    }

 
    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
}