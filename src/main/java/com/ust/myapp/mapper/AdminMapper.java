package com.ust.myapp.mapper;

import com.ust.myapp.model.Admin;

public interface AdminMapper {
  
    int deleteByPrimaryKey(Integer id);

  
    int insert(Admin record);

    int insertSelective(Admin record);


    Admin selectByPrimaryKey(Integer id);

 
    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    Admin selectBySelective(Admin admin);
}