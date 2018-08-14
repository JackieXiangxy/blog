package com.ust.myapp.model;


public class ArticleWithBLOBs extends Article {

	private static final long serialVersionUID = 1L;

	private String content;// 内容

	private String summary;// 总结

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary == null ? null : summary.trim();
	}

	@Override
	public String toString() {
		return "ArticleWithBLOBs [content=" + content + ", summary=" + summary + "]";
	}
	
	
	
	
}