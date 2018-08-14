package com.ust.myapp.service;

import com.ust.myapp.model.BlogInfo;
import com.ust.myapp.model.BlogInfoWithBLOBs;

public interface BlogInfoService {
	BlogInfoWithBLOBs getBlogInfoByUserId(int userId);//根据用户id获得博客信息
	 int updateByPrimaryKey(BlogInfo record);//更新
	 int updateByPrimaryKeyWithBLOBs(BlogInfoWithBLOBs record);
}
