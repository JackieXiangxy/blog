package com.ust.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.CommentMapper;
import com.ust.myapp.model.Comment;
import com.ust.myapp.service.CommentService;
import com.ust.myapp.util.PageControl;


@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentMapper cm;
	
	@Override
	public PageControl getCommentByPageArtId(int artId, String curPage) {
		int total=cm.count(artId);
        PageControl pc=new PageControl(curPage, total);
        int startSize=(pc.getCurPage() - 1) * pc.getPageSize();
        List<Comment> commentList=cm.selectCommentByArticleId(artId,startSize, pc.getPageSize());
        pc.setList(commentList);
        return pc;
	}

	@Override
	public int insertSelective(Comment cmt) {
		return cm.insertSelective(cmt);
	}

	@Override
	public PageControl getCommentByUserId(int userId, String curPage) {
		int total=cm.countByUserId(userId);
        PageControl pc=new PageControl(curPage,total);
        int startSize=(pc.getCurPage() - 1) * pc.getPageSize();
        List<Comment> commentList=cm.selectCommentByUserId(userId,startSize,pc.getPageSize());
        pc.setList(commentList);
        return pc;
	}

	@Override
	public int getTotalCount() {
		 return cm.getTotalCount();
	}

	@Override
	public List<Comment> getAllByArtId(int artId) {
		return cm.getAllByArtId(artId);
	}

	@Override
	public int deleteComment(int cmtId) {
		Comment c=cm.selectByPrimaryKey(cmtId);
		c.setIsDelete(true);
		return cm.updateByPrimaryKey(c);
	}

	@Override
	public int activeComment(int cmtId) {
		Comment c=cm.selectByPrimaryKey(cmtId);
		c.setIsDelete(false);
		return cm.updateByPrimaryKey(c);
	}

}
