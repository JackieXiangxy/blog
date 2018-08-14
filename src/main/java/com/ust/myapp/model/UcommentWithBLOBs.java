package com.ust.myapp.model;


/*
 * 用户评论
 */
public class UcommentWithBLOBs extends Ucomment {

	private static final long serialVersionUID = 1L;


	private String acontent;//文章内容


    private String summary;//文章总结


    public String getAcontent() {
        return acontent;
    }


    public void setAcontent(String acontent) {
        this.acontent = acontent == null ? null : acontent.trim();
    }


    public String getSummary() {
        return summary;
    }


    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }
}