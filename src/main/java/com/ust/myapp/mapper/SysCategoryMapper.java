package com.ust.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ust.myapp.model.SysCategory;

public interface SysCategoryMapper {
   
    int deleteByPrimaryKey(Integer id);

    
    int insert(SysCategory record);

    
    int insertSelective(SysCategory record);

    
    SysCategory selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(SysCategory record);

    
    int updateByPrimaryKey(SysCategory record);
    
    //获取系统分类
    List<SysCategory> selectAll();


	int count();


	List<SysCategory> getSysCategoryByPage(@Param("curPage") int curPage, @Param("size") int size);


	SysCategory selectByName(String scgName);
}