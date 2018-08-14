package com.ust.myapp.model;

import java.io.Serializable;
import java.util.Date;

/*
 * 用户评论
 */
public class Ucomment implements Serializable{

	private static final long serialVersionUID = 1L;


	private Integer cid;//评论id


    private Integer cuid;//评论用户id


    private Integer articalId;//评论文章id


    private String ccontent;//评论内容


    private Date ctime;//评论时间


    private Boolean cdelete;//是否被删除

 
    private Integer uid;//评论用户id


    private String username;//评论用户名


    private String password;//评论用户密码


    private String email;//评论用户邮箱


    private Boolean isApplied;//评论用户是否激活


    private Boolean udelete;//评论用户是否删除


    private Boolean isProfile;//评论用户信息是否完整


    private Integer aid;//文章id


    private String title;//文章标题


    private Integer userId;//文章作者id

  
    private Integer sysCategoryId;//文章系统分类


    private Integer categoryId;//文章次分类


    private Date atime;//文章发送时间

 
    private Boolean isTop;//文章是否置顶

   
    private Boolean isDelete;//文章是否删除

   
    public Integer getCid() {
        return cid;
    }

    
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    
    public Integer getCuid() {
        return cuid;
    }

    public void setCuid(Integer cuid) {
        this.cuid = cuid;
    }

  
    public Integer getArticalId() {
        return articalId;
    }

  
    public void setArticalId(Integer articalId) {
        this.articalId = articalId;
    }

   
    public String getCcontent() {
        return ccontent;
    }

   
    public void setCcontent(String ccontent) {
        this.ccontent = ccontent == null ? null : ccontent.trim();
    }

    
    public Date getCtime() {
        return ctime;
    }

    
    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    
    public Boolean getCdelete() {
        return cdelete;
    }

    
    public void setCdelete(Boolean cdelete) {
        this.cdelete = cdelete;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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


    public Boolean getUdelete() {
        return udelete;
    }


    public void setUdelete(Boolean udelete) {
        this.udelete = udelete;
    }

    public Boolean getIsProfile() {
        return isProfile;
    }

    public void setIsProfile(Boolean isProfile) {
        this.isProfile = isProfile;
    }


    public Integer getAid() {
        return aid;
    }


    public void setAid(Integer aid) {
        this.aid = aid;
    }


    public String getTitle() {
        return title;
    }


    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }


    public Integer getUserId() {
        return userId;
    }


    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Integer getSysCategoryId() {
        return sysCategoryId;
    }


    public void setSysCategoryId(Integer sysCategoryId) {
        this.sysCategoryId = sysCategoryId;
    }


    public Integer getCategoryId() {
        return categoryId;
    }


    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }


    public Date getAtime() {
        return atime;
    }


    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public Boolean getIsTop() {
        return isTop;
    }


    public void setIsTop(Boolean isTop) {
        this.isTop = isTop;
    }


    public Boolean getIsDelete() {
        return isDelete;
    }


    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
}