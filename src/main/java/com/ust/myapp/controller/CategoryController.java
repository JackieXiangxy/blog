package com.ust.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ust.myapp.model.Article;
import com.ust.myapp.model.Category;
import com.ust.myapp.model.User;
import com.ust.myapp.service.CategoryService;
import com.ust.myapp.util.PageControl;

@Controller
@RequestMapping("/category")
public class CategoryController {
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	@Autowired
	private CategoryService cgService;
	
	/**
	 * 跳转到分类管理页面
	 * @author wurui
	 * @param model
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/manage")
    public String manage(Model model, HttpServletRequest request){

		User user=(User)request.getSession().getAttribute("user");
		int userId =user.getId();
		String curPageStr = request.getParameter("curPage");
		PageControl pc=cgService.getCategoryByPageUserId(curPageStr, userId);
		model.addAttribute("pc", pc);
        return "CategoryManage";

    }
	
	/**
	 * 编辑分类页面跳转
	 * @author jackie
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit")
	public String editCategory(HttpServletRequest request) {
		Integer id= Integer.parseInt(request.getParameter("cgId"));
		Category category=cgService.getById(id);
		request.setAttribute("cg", category);
		return "EditCategory";
	}
	
	/**
	 * 添加分类页面跳转
	 * @author jackie
	 * @return
	 */
	@RequestMapping("/addCategory")
	public String addCategory() {
		
		return "AddCategory";
	}
	
	/**
	 * 添加分类
	 * @author jackie
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	public String add(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute("user");
		if(user==null) {
			return "redirect:/login";
		}
		String name=request.getParameter("category_name");
		Category category=new Category();
		category.setUser(user);
		category.setCategoryName(name);
		int res=cgService.insertCategory(category);
		if (res>0) {
			request.getSession().setAttribute("succUpdateMsg", "添加分类成功");
			return "redirect:/category/manage";
		}else {
			request.getSession().setAttribute("errorAddMsg", "添加分类失败");
			return "redirect:/category/addCategory";
		}
	}
	
	/**
	 * 更新个人分类
	 * @author jackie
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	public String sateUpdate(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute("user");
		if (user==null) {
			return "redirect:/login";
		}
		Integer id=Integer.parseInt(request.getParameter("categoryId"));
		String categoryName=request.getParameter("category_name");
		Category category=cgService.getById(id);
		category.setCategoryName(categoryName);
		int res=cgService.updateByPrimaryKeySelective(category);
		if (res>0) {
			request.getSession().setAttribute("succUpdateMsg", "分类更改成功");
			return "redirect:/category/manage?userId="+user.getId();
		}else {
			request.getSession().setAttribute("errorUpdateMsg", "分类更改失败");
			return "redirect:/category/edit?cgId="+id;
		}
		
	}
	
	@RequestMapping("/updateToDelete")
	public String updateToDelete(HttpServletRequest request) {
		Category category=cgService.getById(Integer.parseInt(request.getParameter("cgId")));
		category.setIsDelete(true);
		int res=cgService.updateByPrimaryKeySelective(category);
		if (res>0) {
			request.getSession().setAttribute("succDeleMsg", "删除成功");
			return "redirect:/category/manage";
		}else {
			request.getSession().setAttribute("errorDeleMsg", "删除失败");
			return "redirect:/category/manage";
			
		}
		
	}

}
