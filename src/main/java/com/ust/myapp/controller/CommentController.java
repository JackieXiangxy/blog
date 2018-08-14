package com.ust.myapp.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ust.myapp.model.Article;
import com.ust.myapp.model.ArticleWithBLOBs;
import com.ust.myapp.model.Comment;
import com.ust.myapp.model.User;
import com.ust.myapp.service.ArticleService;
import com.ust.myapp.service.CommentService;
import com.ust.myapp.service.UserService;
import com.ust.myapp.util.PageControl;



@Controller
@RequestMapping("/comment")
public class CommentController {
	 @Autowired
	 private CommentService cmts;
	 @Autowired
	 private UserService users;
	 @Autowired
	 private ArticleService arts;
    
    
    
    /**
     * 跳转到评论界面
     * @author wanggang
     * @param session
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/post")
    public String post(HttpServletRequest request,Model model){
		int artId=Integer.parseInt(request.getParameter("artId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		User u = users.getUserById(userId);//获取文章作者
		arts.updateCount(artId);//文章点击数+1
		ArticleWithBLOBs artList=arts.selectByPrimaryKey(artId);
		String curPageStr = request.getParameter("curPage");
		PageControl pc = cmts.getCommentByPageArtId(artId,curPageStr);
		model.addAttribute("u",u);
		model.addAttribute("userId", userId);
		model.addAttribute("artId",artId);
		model.addAttribute("article",artList);
		model.addAttribute("pc",pc);
    	return "Post";
    }
    
    /**
     * 评论提交
     * @author wanggang
     * @param session
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/commit")
    public String commit(HttpServletRequest request,Model model){
    	User user=(User) request.getSession().getAttribute("user");
    	if (user==null) {
    		request.setAttribute("message", "请先登录");
    		return "Login";
		}
    	
    	int userId =user.getId();
		int artId = Integer.parseInt(request.getParameter("artId"));
		String content = request.getParameter("content");
	
			Article a=arts.selectByPrimaryKey(artId);
			User u=users.getUserById(userId);
			Comment c=new Comment();
			c.setId(null);
			c.setArticle(a);
			c.setContent(content);
			c.setUser(u);
			c.setTime(new Date());
			c.setIsDelete(false);
			int res = cmts.insertSelective(c);
			if (res > 0) {
				request.getSession().setAttribute("succMsg","评论文章成功！");
			} else {
				request.getSession().setAttribute("errorMsg","评论文章失败！");
			}
			return "redirect:/comment/post?artId="+artId+"&userId="+userId;
		
    }
    
    @RequestMapping("/manage")
    public String manage(Model model,HttpServletRequest request){
    	int userId = Integer.parseInt(request.getParameter("userId"));
		if (userId == 0) { 
			request.setAttribute("notFound", true);
		}
		User u=users.getUserById(userId);
		String curPageStr = request.getParameter("curPage");			
		PageControl pc =cmts.getCommentByUserId(userId, curPageStr);
		model.addAttribute("u",u);
		model.addAttribute("pc",pc);
        return "CommentManage";
    }
    @RequestMapping("/delete")
    public String delete(Model model,HttpServletRequest request){
    	int userId = Integer.parseInt(request.getParameter("userId"));
		int cmtId = Integer.parseInt(request.getParameter("cmtId"));
		int res = cmts.deleteComment(cmtId);
		if (res > 0) {
			request.getSession().setAttribute("succDeleMsg", "删除评论成功！");
		} else {
			request.getSession().setAttribute("errorDeleMsg", "删除评论失败！");
		}
		return "redirect:/comment/manage?userId="+userId;
    }
    @RequestMapping("/active")
    public String active(Model model,HttpServletRequest request){
    	int userId = Integer.parseInt(request.getParameter("userId"));
		int cmtId = Integer.parseInt(request.getParameter("cmtId"));
		int res = cmts.activeComment(cmtId);
		if (res > 0) {
			request.getSession().setAttribute("succDeleMsg", "恢复评论成功！");
		} else {
			request.getSession().setAttribute("errorDeleMsg", "恢复评论失败！");
		}
		return "redirect:/comment/manage?userId="+userId;
    }
}
