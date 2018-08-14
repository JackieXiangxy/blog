package com.ust.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ust.myapp.model.User;

public interface UserMapper {
   
    int deleteByPrimaryKey(Integer id);

    
    int insert(User record);

    
    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(User record);

   
    int updateByPrimaryKey(User record);


	List<User> getActiveUser(@Param("num") int num);


	User login(User user);


	User selectByUsername(String username);


	User selectByEmail(String email);


	List<User> selectBySelective(User u);


	int count();


	List<User> getUserByPage(@Param("curPage") int curPage, @Param("size") int size);


	List<User> selectAll();
}