package com.ust.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.myapp.model.ArticleWithBLOBs;
import com.ust.myapp.model.BlogInfoWithBLOBs;
import com.ust.myapp.model.Category;
import com.ust.myapp.model.Profile;
import com.ust.myapp.model.SysCategory;
import com.ust.myapp.model.User;
import com.ust.myapp.service.ArticleService;
import com.ust.myapp.service.BlogInfoService;
import com.ust.myapp.service.CategoryService;
import com.ust.myapp.service.CounterService;
import com.ust.myapp.service.ProfileService;
import com.ust.myapp.service.SysCategoryService;
import com.ust.myapp.service.UserService;
import com.ust.myapp.util.GetMessage;
import com.ust.myapp.util.MD5;
import com.ust.myapp.util.PageControl;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private SysCategoryService sysCate;
	@Autowired
	private UserService uService;
	@Autowired
	private ArticleService artService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BlogInfoService biService;
	@Autowired
	private UserService userService;
	@Autowired
	private CounterService counterService;
	@Autowired
	private ProfileService profileService;

	/**
	 * 用户首页显示
	 * 
	 * @author jackie
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpSession session, Model model) {
		List<SysCategory> scList = sysCate.getAllSysCategory();
		model.addAttribute("scList", scList);
		model.addAttribute("pcList", artService.getData("1").getList());
		model.addAttribute("tenList", artService.topTenArticle());
		model.addAttribute("ulist", artService.getActiveUser(2));
		model.addAttribute("count", counterService.getCounter().getNum());
		return "Index";

	}

	/**
	 * @author qiu
	 * @param username
	 * @param password
	 * @param incode
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String userLogin(String username, String password, String incode, HttpSession session) {
		User user = new User(username, password);
		User u = uService.login(user);
		String code = (String) session.getAttribute("sessionCode");
		if (incode.toUpperCase().equals(code.toUpperCase())) {
			if ("".equals(u) || u == null) {
				session.setAttribute("msg", "用户名或密码错误，请检查后输入");
				return "redirect:/login";
			} else {
				if (u.getIsDelete()) {
					session.setAttribute("msg", "账号已禁用，请联系管理员");
					return "redirect:/login";
				}
				session.setAttribute("user", u);
				return "redirect:/index";
			}
		} else {
			session.setAttribute("msg", "验证码错误，请重新输入");
			return "redirect:/login";

		}

	}

	@RequestMapping("register")
	public String register(@ModelAttribute User u, HttpSession session) {
		User user1 = uService.selectByUserName(u.getUsername());
		User user2 = uService.selectByEmail(u.getEmail());
		// String password = MD5.md5(u.getPassword());
		User u2 = new User(u.getUsername(), u.getPassword(), u.getEmail());

		if (user1 != null || user2 != null)
			session.setAttribute("existMsg", "用户名已经存在");
		else {
			User ur = uService.registUser(u2);
			if (ur != null) {
				session.setAttribute("succMsg", "用户名已经被注册！请查看邮箱激活！");
			} else {
				GetMessage.getResult("18111437442");//发送信息
				session.setAttribute("errorMsg", "注册成功！请查看短息通知，通过邮箱激活账号！");
			}
		}

		return "Register";
	}

	
	@RequestMapping("doactive")
	public String doActive(@ModelAttribute User u, HttpSession session, HttpServletRequest request) {
		String email = u.getEmail();
		String code = request.getParameter("code");
		boolean boo = false;
		boo = uService.active(code, email);
		String message = null;
		if (boo) {
			message = "激活成功！请使用账号登录!";
		} else {
			message = "激活失败！请重新注册！";
		}
		session.setAttribute("msg", message);
		return "Login";

	}

	/**
	 * 登出
	 * 
	 * @author jackie
	 * @param request
	 * @param response
	 * @return
	 */

	@RequestMapping("logout")
	public String logOut(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession(false); // 防止创建Session
			if (null == session) {
				return "redirect:/index";
			} else {
				session.removeAttribute("user");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/index";
	}

	/**
	 * 查看我的博客
	 * 
	 * @author wurui
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/myblog")
	public String myblog(Model model, HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute("user");
		int userId = user.getId();
		BlogInfoWithBLOBs bi = biService.getBlogInfoByUserId(userId);
		List<Category> cgList = categoryService.getByUserId(userId);

		if (null != bi) {
			String curPageStr = request.getParameter("curPage");
			PageControl pc = artService.getArtilcePageByUserId(curPageStr, userId);
			model.addAttribute("user", user);
			model.addAttribute("bi", bi);
			model.addAttribute("pc", pc);
			model.addAttribute("cgList", cgList);

		}
		return "MyBlogIndex";
	}

	/**
	 * 跳转到编辑个人信息页面
	 * 
	 * @author wurui
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/profile")
	public String profile(Model model, @RequestParam("userId") int userId) {
		Profile pf = profileService.getByuserId(userId);
		model.addAttribute("pf", pf);
		return "Profile";
	}

	/**
	 * 更改个人信息
	 * 
	 * @author qiu
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/updateprofile")
	public String updateprofile(HttpServletRequest request,@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastname, @RequestParam("telephone") String telephone,
			@RequestParam("gender") int gender) {
		User user=(User) request.getSession().getAttribute("user");
		int userId = user.getId();
		Profile pro = profileService.getByuserId(userId);
		pro.setFirstName(firstName);
		pro.setLastName(lastname);
		pro.setTelephone(telephone);
		Boolean boo=null;
		if (gender==1) {
			boo=true;//女
		}else {
			boo=false;//男
		}
		pro.setGender(boo);
		profileService.updateProfileById(pro);

		return "redirect:/user/profile?userId="+userId;
	}

	/**
	 * 更改密码
	 * 
	 * @author wurui
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/updatepass")
	public String updatepass(ModelMap map, HttpServletRequest request) {
		String oldPwd = request.getParameter("old_pwd");
		String newPwd1 = request.getParameter("new_pwd1");
		String newPwd2 = request.getParameter("new_pwd2");
		int userId = Integer.parseInt(request.getParameter("userId"));
		HttpSession session = request.getSession();
		if (newPwd1.equals(newPwd2)) {
			User u = userService.getByIdPwd(userId, oldPwd);

			if (null != u) {
				int res = userService.updatePwdById(userId, newPwd1);

				if (res > 0) {
					session.setAttribute("succUpdateMsg", "密码修改成功");
				} else {
					session.setAttribute("errorUpdateMsg", "密码修改失败");
				}

			} else {
				session.setAttribute("validPwdMsg", "请重新输入");
			}
		}
		map.put("userId", userId);

		return "redirect:/user/profile";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam("searchStr") String searchStr) {
		List<ArticleWithBLOBs> artList = artService.search(searchStr);
		model.addAttribute("artList", artList);
		return "SearchResult";
	}

	/**
	 * 转到编辑博客信息页面
	 * 
	 * @author wurui
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/bloginfo")
	public String bloginfo(Model model, HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		BlogInfoWithBLOBs bi = biService.getBlogInfoByUserId(userId);
		model.addAttribute("bi", bi);
		return "BlogInfo";

	}

	/**
	 * 更新博客信息
	 * 
	 * @author wurui
	 * @param model
	 * @param userId
	 * @return
	 */
	@RequestMapping("/updatebloginfo")
	public String updatebloginfo(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		int userId = user.getId();
		if (userId == 0) {
			return "redirect:/login";
		}
		String blogName = request.getParameter("blog_name");
		String description = request.getParameter("blog_des");
		String annoucement = request.getParameter("annoucement");
		BlogInfoWithBLOBs blogInfoWithBLOBs = biService.getBlogInfoByUserId(userId);
		blogInfoWithBLOBs.setBlogName(blogName);
		blogInfoWithBLOBs.setDescription(description);
		blogInfoWithBLOBs.setAnnoucement(annoucement);
		int res = biService.updateByPrimaryKeyWithBLOBs(blogInfoWithBLOBs);
		HttpSession session = request.getSession();
		if (res > 0) {
			session.setAttribute("succUpdateMsg", "更新成功");
		} else {
			session.setAttribute("errorUpdateMsg", "更新失败");
		}

		return "redirect:/user/bloginfo?userId=" + user.getId();

	}

}
