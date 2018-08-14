package com.ust.myapp.mapper;

import org.apache.ibatis.annotations.Param;

import com.ust.myapp.model.Profile;

public interface ProfileMapper {
  
    int deleteByPrimaryKey(Integer id);

   
    int insert(Profile record);

   
    int insertSelective(Profile record);

   
    Profile selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(Profile record);

    
    int updateByPrimaryKey(Profile record);


	Profile selectByUserId(@Param("userId") Integer userId);
}