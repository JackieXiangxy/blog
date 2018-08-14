package com.ust.myapp.service;

/**
 * User接口
 * @author Administrator
 *
 */


import java.util.List;


import com.ust.myapp.model.User;
import com.ust.myapp.util.PageControl;

public interface UserService {
	User login(User user);//判断用户登录是否成功
	User getUserById(int id);//根据id获取用户
	int getIdByUserName(String username);//根据用户名获取id
	User getByEmail(String email);//获取邮箱
	int register(User user);//用户注册
	int setIsAppliedById(int id);//根据id激活用户
	User getByIdPwd(int userId, String password);//根据id设置密码
	int updatePwdById(int userId, String password);//根据id更改密码
	int setIsProfile(int userId);//根据id确定信息完整
	PageControl getUserOfPage(String curPageStr);//用户分页
	int deleteUser(int uId);//根据id删除用户
	int activeUser(int uId);//根据id恢复用户
	List<User> getAllUser();//获取所有用户
	List<User> getActiveUser(int num);//获取用户信息
	User selectByUserName(String name);//根据用户名查用户
	User selectByEmail(String email);//根据邮箱查用户
	int getTotalCount();//获取所有用户数
	boolean active(String code, String email);//判断是否激活
	User registUser(User user);//邮箱激活
	int updateByPrimaryKeySelective(User record);//更新用户
}
