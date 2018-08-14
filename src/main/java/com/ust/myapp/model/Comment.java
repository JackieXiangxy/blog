package com.ust.myapp.model;

import java.io.Serializable;
import java.util.Date;

/*
 * 评论实体类
 */
public class Comment implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer id;//评论id

    private User user;//评论用户

    private Article article;//评论id

    private String content;//评论内容
 
    private Date time;//评论时间

    private Boolean isDelete;//是否被删除

   
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


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

 
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

 
    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}