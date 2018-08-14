package com.ust.myapp.service;

import java.util.List;

import com.ust.myapp.model.Comment;
import com.ust.myapp.util.PageControl;

public interface CommentService {
	PageControl getCommentByPageArtId(int artId,String curPage);//根据文章id查评论
	int insertSelective(Comment cmt);//添加评论
	PageControl getCommentByUserId(int userId,String curPage);//根据用户id查评论
	int getTotalCount();//获取评论总数
	List<Comment> getAllByArtId(int artId);//根据artId获取所有评论
	int deleteComment(int cmtId);//删除评论
	int activeComment(int cmtId);//恢复评论
}
