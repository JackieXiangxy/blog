/**
 *  Copyright 2015 ChinaSoft International Ltd. All rights reserved.
 */
package com.ust.myapp.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

/**
 * <p>
 * Title: SaveCodeService
 * </p>
 * <p>
 * Description: 创建验证码的服务对象
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * Company: ChinaSoft International Ltd.
 * </p>
 * 
 * @author etc
 * @version 1.0
 */
public class SaveCode {

	public SaveCode() {
	}
	/**
	 * 验证码字符串长度
	 */
	private int length = 6;
	/**
	 * 构建验证码的字符元素
	 */
	private char[] elements = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
			'q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K',
			'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6',
			'7','8','9'};
	/**
	 * 验证码图片宽度
	 */
	private int width = 100;
	/**
	 * 验证码图片高度
	 */
	private int height = 30;
	/**
	 * 验证码缓存图片
	 */
	private BufferedImage image;

	/**
	 * 验证码结果字符串
	 */
	private String codeString;

	/**
	 * 验证码服务对象构造器
	 * 
	 * @param elements
	 *            构建验证码的字符元素
	 * @param width
	 *            验证码图片宽度
	 * @param height
	 *            验证码图片高度
	 * @param length
	 *            验证码字符串长度
	 */
	public SaveCode(String str, int width, int height, int length) {
		// 初始化生成验证码的字符元素数组
		this.elements = str.toUpperCase().toCharArray();
		// 初始化验证码图片宽度
		this.width = width;
		// 初始化验证码图片高度
		this.height = height;
		// 初始化验证码字符串长度
		this.length = length;
	}

	/**
	 * 创建验证码图片的方法
	 */
	public void createSaveCodeImage() {
		// 创建验证码缓存图片
		image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 生成随机类
		Random random = new Random();
		// 设定背景色
		g.setColor(getRandColor(220, 250));
		// 利用实心矩形清屏
		g.fillRect(0, 0, width, height);
		// 设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		// 画边框
		// g.drawRect(0,0,width-1,height-1);
		g.draw3DRect(0, 0, width, height, true);
		// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
		g.setColor(getRandColor(160, 200));
		// 循环产生干扰线
		for (int i = 0; i < 155; i++) {
			// 干扰线起点X坐标
			int x = random.nextInt(width);
			// 干扰线起点Y坐标
			int y = random.nextInt(height);
			// 干扰线终点X坐标
			int xl = random.nextInt(12);
			// 干扰线终点Y坐标
			int yl = random.nextInt(12);
			// 绘制干扰线
			g.drawLine(x, y, x + xl, y + yl);
		}
		// 取随机产生的认证码(length位数字)
		codeString = "";
		// 循环提取随机字符
		for (int i = 0; i < length; i++) {
			// 获取随机字符
			char rand = elements[Math.abs(random.nextInt()) % elements.length];
			// 串联结果字符串
			codeString += rand;
		}

		// 设置画笔颜色
		g.setColor(new Color(random.nextInt(256), random.nextInt(256), random.nextInt(256)));
		// 设置字体类型，字体类型，样式，大小
		g.setFont(new Font(null, Font.BOLD, 24));
		// 画出字符串,从(4,25)这个点开始画
		g.drawString(codeString, 5, 25);

		// 完成图片
		g.dispose();
	}

	/**
	 * 获取验证码图片的方法
	 * 
	 * @return 创建好的验证码图片
	 */
	public BufferedImage getImage() {
		// 返回验证码图片
		return image;
	}

	/**
	 * 获取验证码字符串的方法
	 * 
	 * @return 生成的验证码字符串
	 */
	public String getCodeString() {
		// 返回验证码字符串
		return codeString;
	}

	/**
	 * 随机生成干扰线颜色的方法
	 * 
	 * @param fc
	 *            基础色系值
	 * @param bc
	 *            色系偏移量值
	 * @return 创建好的随机颜色
	 */
	private static Color getRandColor(int fc, int bc) {
		// 创建随机工具
		Random random = new Random();
		// 基础色系值纠错
		if (fc > 255)
			// 限定基础色系值最大值
			fc = 255;
		// 颜色偏移量值纠错
		if (bc > 255)
			// 限定颜色偏移量值最大值
			bc = 255;
		// 生成的随机红色分量值
		int r = fc + random.nextInt(bc - fc);
		// 生成的随机绿色分量值
		int g = fc + random.nextInt(bc - fc);
		// 生成的随机蓝色分量值
		int b = fc + random.nextInt(bc - fc);
		// 返回随机的颜色对象
		return new Color(r, g, b);
	}

}
