package com.ust.myapp.util;

import java.util.Random;
/**
 * 
 * @author 邱恩东
 *发送工具类
 */
public class RandUtil {
	 public static String getRandNum() {
	        String randNum = new Random().nextInt(1000000)+"";
//	        System.out.println("生成"+randNum);
	        if (randNum.length()!=6) {   //如果生成的不是6位数随机数则返回该方法继续生成
	            return getRandNum();
	        }
	        return randNum;
	    }

}
