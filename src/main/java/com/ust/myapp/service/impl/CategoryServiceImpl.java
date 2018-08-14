package com.ust.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.CategoryMapper;
import com.ust.myapp.model.Category;
import com.ust.myapp.service.CategoryService;
import com.ust.myapp.util.PageControl;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryMapper cm;
	
	@Override
	public PageControl getCategoryByPageUserId(String curPageStr, int userId) {
		 int total=cm.count(userId);
	     PageControl pc=new PageControl(curPageStr,total);
	     List<Category> categoryList=cm.getCategoryPageByUserId((pc.getCurPage() - 1) * pc.getPageSize(),pc.getPageSize(),userId);
	     pc.setList(categoryList);
	     return pc;
	}

	@Override
	public List<Category> getByUserId(int userId) {
		 return cm.selectByUserId(userId);
	}

	/**
	 * 通过id查找分类
	 * @author jackie
	 */
	@Override
	public Category getById(Integer id) {
		return cm.selectByPrimaryKey(id);
	}

	@Override
	public int insertCategory(Category category) {
		category.setId(null);
		category.setArticals(0);
		category.setIsDelete(false);
		return cm.insert(category);
	}

	@Override
	public int updateByPrimaryKeySelective(Category category) {
		return cm.updateByPrimaryKeySelective(category);
	}

	@Override
	public Category getCateGoryById(Integer id) {
		return cm.selectByPrimaryKey(id);
	}

}
