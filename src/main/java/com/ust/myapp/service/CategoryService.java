package com.ust.myapp.service;

import java.util.List;

import com.ust.myapp.model.Category;
import com.ust.myapp.util.PageControl;

public interface CategoryService {
	PageControl getCategoryByPageUserId(String curPageStr, int userId);//根据用户id把分类分页
	List<Category> getByUserId(int userId);//根据用户id查文章分类
	 Category getById(Integer id);
	 int insertCategory(Category category);
	 int updateByPrimaryKeySelective(Category category);
	 Category getCateGoryById(Integer id);
}
