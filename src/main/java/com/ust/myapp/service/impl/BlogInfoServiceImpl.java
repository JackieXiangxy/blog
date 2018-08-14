package com.ust.myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.BlogInfoMapper;
import com.ust.myapp.model.BlogInfo;
import com.ust.myapp.model.BlogInfoWithBLOBs;
import com.ust.myapp.service.BlogInfoService;

@Service
public class BlogInfoServiceImpl implements BlogInfoService{
	@Autowired
	private BlogInfoMapper bm;
	
	@Override
	public BlogInfoWithBLOBs getBlogInfoByUserId(int userId) {
		return bm.selectByUserId(userId);
	}

	@Override
	public int updateByPrimaryKey(BlogInfo record) {
		// TODO Auto-generated method stub
		return bm.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(BlogInfoWithBLOBs record) {
		return bm.updateByPrimaryKeyWithBLOBs(record);
	}

}
