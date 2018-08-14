package com.ust.myapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/*
 * 文章实体类
 */
public class Article implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;// 文章id

	private String title;// 文章标题

	private User user;// 文章作者

	private SysCategory sysCategory;// 文章系统分类

	private Category category;// 文章分类

	private Date publishTime;// 发布时间

	private Boolean isTop;// 是否置顶

	private Boolean isDelete;// 是否删除

	private Integer count;// 浏览次数

	private List<Comment> comments;// 评论

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public SysCategory getSysCategory() {
		return sysCategory;
	}

	public void setSysCategory(SysCategory sysCategory) {
		this.sysCategory = sysCategory;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
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

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", user=" + user + ", sysCategory=" + sysCategory
				+ ", category=" + category + ", publishTime=" + publishTime + ", isTop=" + isTop + ", isDelete="
				+ isDelete + ", count=" + count + ", comments=" + comments + "]";
	}
	
	
}