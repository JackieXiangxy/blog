package com.ust.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.SysCategoryMapper;
import com.ust.myapp.model.SysCategory;
import com.ust.myapp.service.SysCategoryService;
import com.ust.myapp.util.PageControl;

@Service
public class SysCategoryServiceImpl implements SysCategoryService{
	@Autowired
	SysCategoryMapper sm;
	@Override
	public List<SysCategory> getAllSysCategory() {
		return sm.selectAll();
	}
	@Override
	public PageControl getSysCategoryByPage(String curPageStr) {
		int total = sm.count();
        PageControl pc = new PageControl(curPageStr, total);
        List<SysCategory> sList = sm.getSysCategoryByPage((pc.getCurPage() - 1) * pc.getPageSize(), pc.getPageSize());
        pc.setList(sList);
        return pc;
	}
	@Override
	public SysCategory getById(int scgId) {
		return sm.selectByPrimaryKey(scgId);
	}
	@Override
	public SysCategory getByName(String scgName) {
		return sm.selectByName(scgName);
	}
	@Override
	public int updateSysCategory(int scgId, String scgName) {
		SysCategory s=sm.selectByPrimaryKey(scgId);
		s.setCategoryName(scgName);
		return sm.updateByPrimaryKeySelective(s);
	}
	@Override
	public int insertSysCategory(String scgName) {
		SysCategory s=new SysCategory();
		s.setCategoryName(scgName);
		s.setId(null);
		s.setIsDelete(false);
		s.setArticals(0);
		return sm.insert(s);
	}
	@Override
	public int deleteSysCategory(int scgId) {
		SysCategory s=sm.selectByPrimaryKey(scgId);
		s.setIsDelete(true);
		return sm.updateByPrimaryKey(s);
	}
	@Override
	public int activeSysCategory(int scgId) {
		SysCategory s=sm.selectByPrimaryKey(scgId);
		s.setIsDelete(false);
		return sm.updateByPrimaryKey(s);
	}

}
