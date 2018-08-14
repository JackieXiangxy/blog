package com.ust.myapp.service;

import java.util.List;


import com.ust.myapp.model.Article;
import com.ust.myapp.model.ArticleWithBLOBs;
import com.ust.myapp.model.User;
import com.ust.myapp.util.PageControl;

public interface ArticleService {
	int insertArtical(ArticleWithBLOBs art);//添加博客文章
	PageControl getData(String curPageStr);//获得当前页数
	PageControl getArtilcePageByUserId(String curPageStr,int userId);//登陆用户文章数据分页
	List<User> getActiveUser(int num);//获取当前用户信息
	List<ArticleWithBLOBs> topTenArticle();//获取排行前10的文章
	ArticleWithBLOBs selectByPrimaryKey(int artId);//根据id查询文章
	void updateCount(int artId);//更新博客浏览次数
	List<ArticleWithBLOBs> search(String title);//模糊查询
	int getTotalCount();//获取数据库文章数
	int deleteArtical(int artId);//根据id禁封文章
	int activeArtical(int artId);//根据id解封文章
    int updateByPrimaryKeySelective(ArticleWithBLOBs record);//更新文章
    public int updateByDelete(int id);//删除文章
}
