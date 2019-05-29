package com.ust.myapp.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.CounterMapper;
import com.ust.myapp.model.Counter;
import com.ust.myapp.service.CounterService;

@Service
public class CounterServiceImpl implements CounterService{
	@Autowired
	private CounterMapper cm;
	
	//获得网站访问人数
	@Override
	public Counter getCounter() {
		this.setNum(1);
		return cm.selectByPrimaryKey(1);
	}

	//统计网站访问人数
	@Override
	public int setNum(int num) {
		
		return cm.setNum(num);
	}

}
