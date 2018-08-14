package com.ust.myapp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ust.myapp.model.ArticleWithBLOBs;
import com.ust.myapp.model.SysCategory;
import com.ust.myapp.service.ArticleService;
import com.ust.myapp.service.CounterService;
import com.ust.myapp.service.SysCategoryService;
import com.ust.myapp.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private SysCategoryService sysCate;
	@Autowired
	private ArticleService artService;
	@Autowired
	private CounterService counterService;
	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		// ModelAndView model=new ModelAndView();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		//获得系统分类
		List<SysCategory> scList = sysCate.getAllSysCategory();
		//获得文章
		model.addAttribute("scList", scList);
		model.addAttribute("pcList", artService.getData("1").getList());
		model.addAttribute("tenList", artService.topTenArticle());
		model.addAttribute("ulist", artService.getActiveUser(5));
		model.addAttribute("count", counterService.getCounter().getNum());
		

		return "Index";
	}

	/**
	 * 跳转用户登录界面
	 * 
	 * @author jackie
	 * @return 登录视图
	 */
	@RequestMapping("/login")
	public String userLogin() {
		return "Login";
	}

	/**
	 * 跳转用户注册界面
	 * 
	 * @author jackie
	 * @return 注册视图
	 */
	@RequestMapping("/register")
	public String userResgister() {
		return "Register";
	}

	@RequestMapping("/index")
	public String index() {
		return "redirect:user/index";
	}
	
	/**
	 * 跳转到管理员登陆界面
	 * @author wanggang
	 * @return
	 */
	 @RequestMapping(value ="/adminIndex",method = RequestMethod.GET)
	 public String adminLogin(){
	        return "AdminLogin";
	    }
	 
	 
	 /**
	  * 登出
	  * @author jackie
	  * @param request
	  * @param response
	  * @return
	  */
	 
	 @RequestMapping("logout")
	 public String logOut(HttpServletRequest request, HttpServletResponse response) {
		 try{
	            request.setCharacterEncoding("utf-8");
	            HttpSession session = request.getSession(false);    //防止创建Session
	            if (null == session) {
	                return "redirect:/index";
	            }else{
	                session.removeAttribute("user");
	            }
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return "redirect:/index";
	 }
	
	
	
}
