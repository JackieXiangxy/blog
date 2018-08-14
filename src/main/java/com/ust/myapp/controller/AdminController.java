package com.ust.myapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.fabric.Response;
import com.ust.myapp.model.Admin;
import com.ust.myapp.model.Counter;
import com.ust.myapp.model.Profile;
import com.ust.myapp.model.SysCategory;
import com.ust.myapp.service.AdminService;
import com.ust.myapp.service.ArticleService;
import com.ust.myapp.service.CommentService;
import com.ust.myapp.service.CounterService;
import com.ust.myapp.service.ProfileService;
import com.ust.myapp.service.SysCategoryService;
import com.ust.myapp.service.UserService;
import com.ust.myapp.util.PageControl;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adms;
	@Autowired
	private UserService us;
	@Autowired
	private CommentService coms;
	@Autowired
    private CounterService cs;	
	@Autowired
	private ArticleService arts;
	@Autowired
	private ProfileService pros;
	@Autowired
	private SysCategoryService syss;
	/**
	 * 管理员验证登陆
	 * 
	 * @author wanggang
	 * @param session
	 * @param admin
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("admin") Admin admin)
			throws ServletException, IOException {
		// 判断验证码是否正确 不正确直接跳转
		String code = request.getParameter("incode");
		String sessiocCode = (String) request.getSession().getAttribute("sessionCode");
		boolean boo = code.equalsIgnoreCase(sessiocCode);
		if (!boo) {
			request.getSession().setAttribute("message", "验证码不正确！请重新输入");
			return "redirect:/adminIndex";
		}
		Admin ad = adms.selectBySelective(admin);
		if (ad == null) {
			request.getSession().setAttribute("msg", "用户名或密码不正确！");
			return "redirect:/adminIndex";
		} else {
			request.getSession().setAttribute("admin", ad);
		}
		return "redirect:/admin/index";
	}
	/**
	 * 管理员主界面
	 * @author wanggang
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		Counter counter = cs.getCounter();
		int userCount = us.getTotalCount();
		int articleCount = arts.getTotalCount();
		int cmtCount = coms.getTotalCount();
	
		model.addAttribute("counter", counter);
		model.addAttribute("userCount", userCount);
		model.addAttribute("articleCount", articleCount);
		model.addAttribute("cmtCount", cmtCount);
		return "admin/Index";
	}
	/**
	 * 管理员退出
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession(false);//防止创建Session
		if (session != null) {
			session.removeAttribute("admin");
		}
		request.getSession().setAttribute("logoutMsg", "退出成功！");
		return "redirect:/adminIndex";
	}
	
	/**
	 * 用户管理
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/useradmin")
	public String useradmin(Model model,HttpServletRequest request) {
		//分页
		String curPageStr = request.getParameter("curPage");
		PageControl pc=us.getUserOfPage(curPageStr);
		model.addAttribute("pc",pc);
		return "admin/UserAdmin";
	}
	/**
	 * 用户信息
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/userprofile")
	public String userprofile(Model model,HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("userId"));
		Profile pf = pros.getByuserId(userId);			
		model.addAttribute("pf", pf);
		return "admin/UserProfile";
	}
	/**
	 * 禁用用户
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteuser")
	public String deleteuser(Model model,HttpServletRequest request) {
		int uId = Integer.parseInt(request.getParameter("userId"));
		int res = us.deleteUser(uId);
		if (res > 0) {	//删除成功
			request.getSession().setAttribute("succDeleMsg", "禁用账户成功！");
		} else {     //删除失败
			request.getSession().setAttribute("errorDeleMsg", "禁用账户失败！");
		}
		return "redirect:/admin/useradmin";
	}
	/**
	 * 激活用户
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/activeuser")
	public String activeuser(Model model,HttpServletRequest request) {
		int uId = Integer.parseInt(request.getParameter("userId"));
		int res = us.activeUser(uId);
		if (res > 0) {	//激活成功
			request.getSession().setAttribute("succActMsg", "激活账户成功！");
		} else {     //激活失败
			request.getSession().setAttribute("errorActMsg", "激活账户失败！");
		}
		return "redirect:/admin/useradmin";
	}
	/**
	 * 文章界面
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/sysArticalAdmin")
	public String SysArticalAdmin(Model model,HttpServletRequest request) {
		String curPageStr = request.getParameter("curPage");
		PageControl pc = arts.getData(curPageStr);
		model.addAttribute("pc",pc);
		return "admin/SysArticleAdmin";
	}
	/**
	 * 禁封文章
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteSysArtical")
	public String DeleteSysArtical(Model model,HttpServletRequest request) {
		int artId = Integer.parseInt(request.getParameter("artId"));
		int res = arts.deleteArtical(artId);
		if (res > 0) {	//删除成功
			request.getSession().setAttribute("deleSuccMsg", "禁封成功！");
		} else {
			request.getSession().setAttribute("deleErrorMsg", "禁封失败！");
		}
		return "redirect:/admin/sysArticalAdmin";
	}
	/**
	 * 解封文章
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/activeSysArtical")
	public String ActiveSysArtical(Model model,HttpServletRequest request) {
		int artId = Integer.parseInt(request.getParameter("artId"));
		int res = arts.activeArtical(artId);
		if (res > 0) {	//删除成功
			request.getSession().setAttribute("deleSuccMsg", "解封成功！");
		} else {
			request.getSession().setAttribute("deleErrorMsg", "解封失败！");
		}
		return "redirect:/admin/sysArticalAdmin";
	}
	/**
	 * 管理系统分类
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/sysCategoryAdmin")
	public String SysCategoryAdmin(Model model,HttpServletRequest request) {
		String curPageStr = request.getParameter("curPage");
		PageControl pc=syss.getSysCategoryByPage(curPageStr);
		model.addAttribute("pc",pc);
		return "admin/SysCategoryAdmin";
	}
	/**
	 * 编辑系统分类
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/editSysCategory")
	public String EditSysCategory(Model model,HttpServletRequest request) {
		int scgId = Integer.parseInt(request.getParameter("scgId"));
		SysCategory sc = syss.getById(scgId);			
		model.addAttribute("sc", sc);
		return "admin/EditSysCategory";
	}
	/**
	 * 更新系统分类
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateSysCategory")
	public String updateSysCategory(Model model,HttpServletRequest request) {
		int scgId = Integer.parseInt(request.getParameter("scgId"));			
		String scgName = request.getParameter("scgName");
		SysCategory scg = syss.getByName(scgName);
		if (( scg!=null) && (scgId != scg.getId())) {
			request.getSession().setAttribute("scgExist", "该分类名已存在，请重新输入分类名！");
			return "redirect:/admin/editSysCategory?scgId="+scgId;
		} else {			//允许更新该分类名
			int res = syss.updateSysCategory(scgId, scgName);
			if (res > 0) {	//更新成功
				request.getSession().setAttribute("succUpdateScg", "更新分类成功！");
				return "redirect:/admin/sysCategoryAdmin";
			} else {
				request.getSession().setAttribute("errorUpdateScg", "更新分类失败！");
				return "redirect:/admin/sysCategoryAdmin";
			}
	}
		}
	/**
	 * 跳转添加系统分类
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/toaddCategory")
	public String toaddCategory() {
		return "admin/AddSysCategory";
	}
	/**
	 * 添加系统分类
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/addSysCategory")
	public String AddSysCategory(Model model,HttpServletRequest request) {
		String scgName = request.getParameter("scgName");
		SysCategory scg = syss.getByName(scgName);
		if (null != scg) {    //提示该分类已存在
			request.getSession().setAttribute("scgExist", "该分类名已存在，请重新输入分类名！");
			return "admin/AddSysCategory";
		} else {
			int res = syss.insertSysCategory(scgName);
			if (res > 0) {	  //添加分类成功
				request.getSession().setAttribute("succAddScg", "添加分类成功！");
			} else {		  //添加分类失败
				request.getSession().setAttribute("errorAddScg", "添加分类失败！");
			}
			return "redirect:/admin/sysCategoryAdmin";
		}
	}
	/**
	 * 删除系统分类
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteSysCategory")
	public String DeleteSysCategory(Model model,HttpServletRequest request) {
		int scgId = Integer.parseInt(request.getParameter("scgId"));
		int res = syss.deleteSysCategory(scgId);
		if (res > 0) {
			request.getSession().setAttribute("succDeleScg", "禁封成功！");
		} else {
			request.getSession().setAttribute("errorDeleScg", "禁封失败！");
		}
		return "redirect:/admin/sysCategoryAdmin";
	}
	/**
	 * 解封文章
	 * @author wanggang
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/activeSysCategory")
	public String ActiveSysCategory(Model model,HttpServletRequest request) {
		int scgId = Integer.parseInt(request.getParameter("scgId"));
		int res = syss.activeSysCategory(scgId);
		if (res > 0) {
			request.getSession().setAttribute("succDeleScg", "解封成功！");
		} else {
			request.getSession().setAttribute("errorDeleScg", "解封失败！");
		}
		return "redirect:/admin/sysCategoryAdmin";
	}
	}

