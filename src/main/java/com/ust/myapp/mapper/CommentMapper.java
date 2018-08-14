package com.ust.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ust.myapp.model.Comment;

public interface CommentMapper {

    int deleteByPrimaryKey(Integer id);

   
    int insert(Comment record);

   
    int insertSelective(Comment record);

    
    Comment selectByPrimaryKey(@Param("cmtId")int cmtId);

    int updateByPrimaryKeySelective(Comment record);

    
    int updateByPrimaryKey(Comment record);


	int count(@Param("cmtId") int cmtId);


	List<Comment> selectCommentByArticleId(@Param("artId")int artId, @Param("curPage") int curPage, @Param("size") int size);


	int countByUserId(int userId);


	List<Comment> selectCommentByUserId(@Param("userId")int userId, @Param("curPage") int curPage, @Param("size") int size);


	int getTotalCount();


	List<Comment> getAllByArtId(int artId);
}