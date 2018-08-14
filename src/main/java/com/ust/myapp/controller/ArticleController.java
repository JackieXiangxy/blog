package com.ust.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ust.myapp.model.Article;
import com.ust.myapp.model.ArticleWithBLOBs;
import com.ust.myapp.model.Category;
import com.ust.myapp.model.SysCategory;
import com.ust.myapp.model.User;
import com.ust.myapp.service.ArticleService;
import com.ust.myapp.service.CategoryService;
import com.ust.myapp.service.SysCategoryService;
import com.ust.myapp.util.PageControl;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Autowired
	private ArticleService artService;
	@Autowired
	private SysCategoryService scService;
	@Autowired
	private CategoryService csService;

	/**
	 * 跳转到博文管理页面
	 * 
	 * @author wurui
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/manage")
	public String manage(Model model, HttpServletRequest request) {
		
		String curPage = request.getParameter("curPage");
		int userId = ((User) request.getSession().getAttribute("user")).getId();
		PageControl pc = artService.getArtilcePageByUserId(curPage, userId);
		List<ArticleWithBLOBs> ArtList=pc.getList();
		model.addAttribute("artList", ArtList);
		model.addAttribute("pc", pc);
		model.addAttribute("curPage", pc.getCurPage());
		model.addAttribute("totalPages", pc.getTotalPages());
		model.addAttribute("user", (User) request.getSession().getAttribute("user"));
		return "ArticleManage";

	}

	/**
	 * 跳转到更新博文页面
	 * 
	 * @author wurui
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public String update(Model model, HttpServletRequest request) {
		User user =(User) request.getSession().getAttribute("user");
		int userId = user.getId();
		int artId = Integer.parseInt(request.getParameter("artId"));
		Article art = artService.selectByPrimaryKey(artId);
		List<SysCategory> scgList = scService.getAllSysCategory();
		List<Category> cgList = csService.getByUserId(userId);
		model.addAttribute("cgList", cgList);
		model.addAttribute("scgList", scgList);
		model.addAttribute("art", art);
		return "UpdateArtical";

	}

	/**
	 * 更新博文
	 * 
	 * @author jackie
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveupdate")
	public String saveupdate(Model model, HttpServletRequest request) {
		Integer artId = Integer.parseInt(request.getParameter("artId"));
		String title = (String) request.getParameter("title");
		User user = (User) request.getSession().getAttribute("user");
		SysCategory sCategory = scService.getById(Integer.parseInt(request.getParameter("sys_category")));
		Category category = csService.getById(Integer.parseInt(request.getParameter("category")));
		String content = (String) request.getParameter("content");
		String summary = (String) request.getParameter("summary");
		ArticleWithBLOBs aWithBLOBs =artService.selectByPrimaryKey(artId);
		aWithBLOBs.setTitle(title);
		aWithBLOBs.setSysCategory(sCategory);
		aWithBLOBs.setCategory(category);
		aWithBLOBs.setContent(content);
		aWithBLOBs.setSummary(summary);
		aWithBLOBs.setPublishTime(new Date());
		int res=artService.updateByPrimaryKeySelective(aWithBLOBs);
		if (res > 0) {	//更新成功
			request.getSession().setAttribute("succMsg", "修改文章成功！");
			return "redirect:/article/manage";
		} else {
			request.getSession().setAttribute("errorMsg", "修改文章失败");
			return "redirect:/article/update?artId="+artId;
		}
		

	}

	/**
	 * 删除博文
	 * 
	 * @author wurui
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(Model model, HttpServletRequest request) {
		Integer artId = Integer.parseInt(request.getParameter("artId"));
		int res=artService.updateByDelete(artId);
		int userId=((User)request.getSession().getAttribute("user")).getId();
		if (res>0) {
			request.getSession().setAttribute("deleSuccMsg", "文章删除成功！");
			return "redirect:/article/manage";
		}else {
			request.getSession().setAttribute("deleErrorMsg", "文章删除失败");
			return "redirect:/article/update?artId="+artId;
		}
		

	}

	/**
	 * 转到添加博文
	 * 
	 * @author wurui
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Model model, HttpServletRequest request) {
		
		List<Category> cgList = csService.getByUserId(((User) request.getSession().getAttribute("user")).getId());
		List<SysCategory> scgList = scService.getAllSysCategory();
		request.setAttribute("cgList", cgList);
		request.setAttribute("scgList", scgList);
		return "AddArtical";
	}
	
	/**
	 * 添加文章
	 * @author jackie
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	public String savaArticle(HttpServletRequest request) {
		String title = (String) request.getParameter("title");
		User user = (User) request.getSession().getAttribute("user");
		SysCategory sCategory = scService.getById(Integer.parseInt(request.getParameter("sysCategory")));
		Category category = csService.getById(Integer.parseInt(request.getParameter("category")));
		String content = (String) request.getParameter("content");
		String summary = (String) request.getParameter("summary");
		ArticleWithBLOBs aWithBLOBs = new ArticleWithBLOBs();
		aWithBLOBs.setId(null);
		aWithBLOBs.setTitle(title);
		aWithBLOBs.setUser(user);
		aWithBLOBs.setSysCategory(sCategory);
		aWithBLOBs.setCategory(category);
		aWithBLOBs.setContent(content);
		aWithBLOBs.setSummary(summary);
		 int res=artService.insertArtical(aWithBLOBs);
		 if (res>0) {
			 request.getSession().setAttribute("succAdd","文章添加成功");
			return "redirect:/article/manage";
		}else {
			 request.getSession().setAttribute("errorAdd","文章添加失败");
			return "redirect:/article/add";
		}
		
		
	}
}
