package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 系统分类
 */
public class SysCategory implements Serializable{

 
	private static final long serialVersionUID = 1L;


	private Integer id;//系统分类id


    private String categoryName;//分类名称


    private Integer articals;


    private Boolean isDelete;//是否被删除

  
    public Integer getId() {
        return id;
    }

  
    public void setId(Integer id) {
        this.id = id;
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