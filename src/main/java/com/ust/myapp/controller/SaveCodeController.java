package com.ust.myapp.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ust.myapp.util.SaveCode;

import net.sf.json.JSONObject;


/**
 * 验证码
 * @author wanggang
 *
 */
@Controller
@RequestMapping("/code")
public class SaveCodeController {
	
	private static SaveCode saveCode;
	private static JSONObject object;
	
	/**
	 * 生成验证码
	 * @author wanggang
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@ResponseBody 
	@RequestMapping(value="/saveCode" , method= RequestMethod.GET , produces="application/json;charset=UTF-8")
	private void saveCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		saveCode=new SaveCode();
		// 创建验证码图片
		saveCode.createSaveCodeImage();
		// 获取验证码图片
		BufferedImage img = saveCode.getImage();
		// 获取验证码字符串
		String codeString = saveCode.getCodeString();
		// 获取会话对象
		HttpSession session = request.getSession();
		// 将验证码字符串存入会话
		session.setAttribute("sessionCode", codeString);
		OutputStream os =response.getOutputStream();
		ImageIO.write(img, "JPEG", os);
		os.close();
	}
	
	/**
	 * 验证验证码
	 * @author wanggang
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="/checkCode" , method= RequestMethod.POST , produces="application/json;charset=UTF-8")
	private void checkCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		object=new JSONObject();
		String code=request.getParameter("code");
		// 获取会话中保存的验证码
		String sessionCode=(String) request.getSession().getAttribute("sessionCode");
		try {
			// 判断用户输入的验证码与会话信息中保存的验证码能够匹配
			if (sessionCode.equalsIgnoreCase(code)) {
				// 输出验证码正确的标识
				object.put("strMessage", "1");
				// 如果不能匹配
			} else {
				// 输出验证码错误的标识
				object.put("strMessage", "0");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.write(object.toString());
		out.close();
		}
	}
	
	

