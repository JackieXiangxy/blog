package com.ust.myapp.util;

import java.io.UnsupportedEncodingException;
import java.security.*;

public class MD5 {
	public static String md5(String str) {
		if(str==null){
			return "";
		}
		// 获取摘要工具
		MessageDigest m = null;
		try {
			// MD5摘要工具
			m = MessageDigest.getInstance("MD5");
			// 更新被文搞描述的位元组
			m.update(str.getBytes("UTF8"));
			// 捕获不支持摘要异常
		} catch (NoSuchAlgorithmException e) {
			// 创建一个MD5消息文搞 的时候出错
			e.printStackTrace();
			// 捕获不支持字符集异常
		} catch (UnsupportedEncodingException e) {
			// 更新被文搞描述的位元组 的时候出错
			e.printStackTrace();
		}
		// 最后更新使用位元组的被叙述的排列,然后完成文摘计算
		byte s[] = m.digest();
		// System.out.println(s); // 输出加密后的位元组
		// 创建结果字符串缓冲
		StringBuilder result = new StringBuilder("");
		// 遍历文摘
		for (int i = 0; i < s.length; i++) {
			// 进行十六进制转换
			result.append(Integer.toHexString((0x000000FF & s[i]) | 0xFFFFFF00).substring(6));
		}
		// 返回加密结果
		return result.toString();

	}
}