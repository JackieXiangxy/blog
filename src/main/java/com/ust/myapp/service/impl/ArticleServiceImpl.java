package com.ust.myapp.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.ArticleMapper;
import com.ust.myapp.mapper.UserMapper;
import com.ust.myapp.model.Article;
import com.ust.myapp.model.ArticleWithBLOBs;
import com.ust.myapp.model.User;
import com.ust.myapp.service.ArticleService;
import com.ust.myapp.util.PageControl;

@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleMapper am;
	@Autowired
	private UserMapper um;
	
	@Override
	public int insertArtical(ArticleWithBLOBs art) {
		art.setIsDelete(false);
		art.setPublishTime(new Date());
		art.setIsTop(false);
		art.setCount(0);
        return  am.insert(art);
	}

	/**
	 * 分页显示数据
	 */
	@Override
	public PageControl getData(String curPageStr) {
		int total = am.count();//获取总数
		PageControl pc = new PageControl(curPageStr, total);
	    List<ArticleWithBLOBs> artList = am.getArticleByPage((pc.getCurPage() - 1) * pc.getPageSize(), pc.getPageSize());
	    pc.setList(artList);
	    return pc;
	}

	/**
	 * 通过用户id获取文章并且分页
	 */
	@Override
	public PageControl getArtilcePageByUserId(String curPageStr, int userId) {
		int total = am.countbyuserid(userId);
        PageControl pc = new PageControl(curPageStr, total);
        int startSize=(pc.getCurPage() - 1) * pc.getPageSize();
        List<ArticleWithBLOBs> artList = am.getArticlePageByUserId(startSize, pc.getPageSize(),userId);
        pc.setList(artList);
        return pc; 
	}

	@Override
	public List<User> getActiveUser(int num) {
		return um.getActiveUser(num);
	}

	/**
	 * 获得热度靠前10篇文章
	 */
	@Override
	public List<ArticleWithBLOBs> topTenArticle() {
		return am.topTenArticle();
	}

	@Override
	public ArticleWithBLOBs selectByPrimaryKey(int artId) {
		 return am.selectByPrimaryKey(artId);
	}

	@Override
	public void updateCount(int artId) {
		Article article=am.selectByPrimaryKey(artId);
        article.setCount(article.getCount()+1);
        am.updateByPrimaryKey(article);
	}

	@Override
	public List<ArticleWithBLOBs> search(String str) {
		 return am.selectBySearch(str,str,str);
	}

	@Override
	public int getTotalCount() {
		 return am.count();
	}

	@Override
	public int deleteArtical(int artId) {
		Article a=am.selectByPrimaryKey(artId);
		a.setIsDelete(true);
		return am.updateByPrimaryKey(a);
	}

	@Override
	public int activeArtical(int artId) {
		Article a=am.selectByPrimaryKey(artId);
		a.setIsDelete(false);
		return am.updateByPrimaryKey(a);
	}

	@Override
	public int updateByPrimaryKeySelective(ArticleWithBLOBs record) {
		record.setIsDelete(false);
		record.setIsTop(false);
		record.setPublishTime(new Date());
		record.setCount(0);
		return am.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByDelete(int id) {
		return am.updateByDelete(id);
	}

}
