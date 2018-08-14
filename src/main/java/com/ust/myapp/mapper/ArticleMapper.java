package com.ust.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ust.myapp.model.Article;
import com.ust.myapp.model.ArticleWithBLOBs;

public interface ArticleMapper {
 

 
    int insert(ArticleWithBLOBs record);

 
    int insertSelective(ArticleWithBLOBs record);

 
    ArticleWithBLOBs selectByPrimaryKey(Integer id);

 
    int updateByPrimaryKeySelective(ArticleWithBLOBs record);

 
    int updateByPrimaryKeyWithBLOBs(ArticleWithBLOBs record);

  
    int updateByPrimaryKey(Article record);


	int count();

	int countbyuserid(int userId);
	
	List<ArticleWithBLOBs> getArticleByPage(@Param("curPage") int curPage, @Param("size") int size);


	List<ArticleWithBLOBs> getArticlePageByUserId(@Param("curPage") int curPage, @Param("size") int size,@Param("userId") int userId);


	List<ArticleWithBLOBs> topTenArticle();


	List<ArticleWithBLOBs> selectBySearch(@Param("title") String title,@Param("content") String content,@Param("summary") String summary);


	List<ArticleWithBLOBs> getBycgIdorscgId(@Param("cgId")int cgId, @Param("sysCgId")int sysCgId,@Param("artId") int artId);

	public int updateByDelete(int id);

}