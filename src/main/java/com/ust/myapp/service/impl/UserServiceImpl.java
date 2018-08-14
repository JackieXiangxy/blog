package com.ust.myapp.service.impl;

import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.UserMapper;
import com.ust.myapp.model.User;
import com.ust.myapp.service.UserService;
import com.ust.myapp.util.MailUtil;
import com.ust.myapp.util.PageControl;
import com.ust.myapp.util.UUIDUtil;



@Service
public class UserServiceImpl implements UserService{
	private static Map<String,User> userMap = new HashMap<String, User>();
	
	
	
	@Autowired
	private UserMapper um;
	
	
	
	@Override
	public User login(User user) {
		 return um.login(user);
	}

	@Override
	public User getUserById(int id) {
		 return um.selectByPrimaryKey(id);
	}

	@Override
	public int getIdByUserName(String username) {
		 try {
	            return um.selectByUsername(username).getId();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return 0;
	}

	@Override
	public User getByEmail(String email) {
		 try {
	            return um.selectByEmail(email);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	}

	@Override
	public int register(User user) {
		 return um.insertSelective(user);
	}

	@Override
	public int setIsAppliedById(int id) {
		  User u = um.selectByPrimaryKey(id);
	       u.setIsApplied(true);
	       um.updateByPrimaryKeySelective(u);
	        return 0;
	}

	@Override
	public User getByIdPwd(int userId, String password) {
		 User u = new User();
	        u.setId(userId);
	        u.setPassword(password);
	        return um.selectBySelective(u).get(0);
	}

	@Override
	public int updatePwdById(int userId, String password) {
		 User u = um.selectByPrimaryKey(userId);
	        u.setPassword(password);
	        return um.updateByPrimaryKeySelective(u);
	}

	@Override
	public int setIsProfile(int userId) {
		User u = um.selectByPrimaryKey(userId);
        u.setIsProfile(true);
        return um.updateByPrimaryKeySelective(u);
	}

	@Override
	public PageControl getUserOfPage(String curPageStr) {
		int total = um.count();
        PageControl pc = new PageControl(curPageStr, total);
        List<User> uList = um.getUserByPage((pc.getCurPage() - 1) * pc.getPageSize(), pc.getPageSize());
        pc.setList(uList);
        return pc;
	}

	@Override
	public int deleteUser(int uId) {
		 User u = um.selectByPrimaryKey(uId);
	        u.setIsDelete(true);
	        return um.updateByPrimaryKeySelective(u);
	}

	@Override
	public int activeUser(int uId) {
		  User u = um.selectByPrimaryKey(uId);
	        u.setIsDelete(false);
	        return um.updateByPrimaryKeySelective(u);
	}

	@Override
	public List<User> getAllUser() {
		 return um.selectAll();
	}

	@Override
	public List<User> getActiveUser(int num) {
		return um.getActiveUser(num);
	}

	@Override
	public User selectByUserName(String name) {
		  return um.selectByUsername(name);
	      
	}

	@Override
	public User selectByEmail(String email) {
		return um.selectByEmail(email);
	      
	}

	@Override
	public int getTotalCount() {
		 return um.count();
	}

	@Override
	public User registUser( User user) {
		 String  uuid =UUIDUtil.getUUID();
		
			Collection<User> list = userMap.values();
			for (User u : list) {
				if(u.getUsername().equals(user.getUsername()))
				{
					return u;
				}
			}
			userMap.put(uuid, user);
			System.out.println(user.getEmail());
		
			MailUtil.sendEmil(user.getEmail(), uuid);	
			
		

		return null;
	}
	
	/**
	 * 判断用户激活信息
	 * @throws SQLException 
	 * @throws ServiceException 
	 */

	@Override
	public boolean active(String code, String email) {
     User user = userMap.remove(code);
		
		if(user!=null&&user.getEmail().equals(email))
		{
			//激活成功 添加到数据库
			this.register(user);
			return true;
		}
		return false;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		return um.updateByPrimaryKeySelective(record);
	}

}
