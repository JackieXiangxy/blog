package com.ust.myapp.model;

/*
 * 博客
 */
public class BlogInfoWithBLOBs extends BlogInfo {

 
	private static final long serialVersionUID = 1L;


	private String description;//博客描述


    private String annoucement;//博客详细描述


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

 
    public String getAnnoucement() {
        return annoucement;
    }


    public void setAnnoucement(String annoucement) {
        this.annoucement = annoucement == null ? null : annoucement.trim();
    }
}