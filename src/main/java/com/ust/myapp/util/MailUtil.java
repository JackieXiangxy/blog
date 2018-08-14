package com.ust.myapp.util;

import java.security.Security;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

	//将激活码和邮箱拼接到url发送到用户邮箱，用户点击邮件中的超级链接再将两个值传回来查询数据库 一致 则让用户激活
		public static void main(String[] args) {
		}
		
		 /**
	     * 使用加密的方式,利用465端口进行传输邮件,开启ssl
	     * @param email    为收件人邮箱
	     * @param code    发送的消息
	     */
	    @SuppressWarnings("restriction")
		public static void sendEmil(String email, String code) {
	        try {
	            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	            final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	            //设置邮件会话参数
	            Properties props = new Properties();
	            //邮箱的发送服务器地址
	            props.setProperty("mail.smtp.host", "smtp.qq.com");
	            props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	            props.setProperty("mail.smtp.socketFactory.fallback", "false");
	            //邮箱发送服务器端口,这里设置为465端口
	            
	            props.setProperty("mail.smtp.port", "465");
	            props.setProperty("mail.smtp.socketFactory.port", "465");
	            props.put("mail.smtp.auth", "true");
	            final String username = "244538014@qq.com";
	            final String password = "ykfqzflgmddkbjef";
	            //获取到邮箱会话,利用匿名内部类的方式,将发送者邮箱用户名和密码授权给jvm
	            Session session = Session.getDefaultInstance(props, new Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(username, password);
	                }
	            });
	            //通过会话,得到一个邮件,用于发送
	            Message msg = new MimeMessage(session);
	            //设置发件人
	            msg.setFrom(new InternetAddress("244538014@qq.com"));
	            //设置收件人,to为收件人,cc为抄送,bcc为密送
	            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
//	            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(email, false));
//	            msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(email, false));
	            msg.setSubject("用户注册激活邮件-成都翡翠教育");
				msg.setContent(//在这里面拼接servlet访问地址并URL传值
						"<h1>此邮件为成都翡翠教育注册激活邮件！请点击下面链接完成激活操作！</h1><br />"
						+ "此邮件30分钟有效!"
						+ "<h4><a href='http://localhost:8080/blog/user/doactive?code="
						+ code
						+ "&email="
						+ email
						+ "'>http://localhost:8080/blog/user/doactive?code="
						+ code + "&email=" + email + "</a></h4>",
						"text/html;charset=UTF-8");
				msg.saveChanges();
	            //设置发送的日期
	            msg.setSentDate(new Date());
	            
	            //调用Transport的send方法去发送邮件
	            Transport.send(msg);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }
	    
	}
