package com.ust.myapp.service;

import java.util.List;

import com.ust.myapp.model.SysCategory;
import com.ust.myapp.util.PageControl;


public interface SysCategoryService {
	
	List<SysCategory> getAllSysCategory();//获得所有的系统分类

	PageControl getSysCategoryByPage(String curPageStr);//分页分类

	SysCategory getById(int scgId);//根据id查询分类

	SysCategory getByName(String scgName);//根据分类名获得分类

	int updateSysCategory(int scgId, String scgName);//更新分类

	int insertSysCategory(String scgName);//添加分类

	int deleteSysCategory(int scgId);//禁封分类

	int activeSysCategory(int scgId);//解封分类

}
