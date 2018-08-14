package com.ust.myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.AdminMapper;
import com.ust.myapp.model.Admin;
import com.ust.myapp.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper am;
	
	
	@Override
	public Admin selectBySelective(Admin admin) {
		return am.selectBySelective(admin);
	}

}
