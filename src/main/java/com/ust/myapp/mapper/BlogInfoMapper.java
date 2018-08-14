package com.ust.myapp.mapper;

import com.ust.myapp.model.BlogInfo;
import com.ust.myapp.model.BlogInfoWithBLOBs;

public interface BlogInfoMapper {
 
    int deleteByPrimaryKey(Integer id);

 
    int insert(BlogInfoWithBLOBs record);

 
    int insertSelective(BlogInfoWithBLOBs record);

    
    BlogInfoWithBLOBs selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(BlogInfoWithBLOBs record);

    
    int updateByPrimaryKeyWithBLOBs(BlogInfoWithBLOBs record);

    
    int updateByPrimaryKey(BlogInfo record);


	BlogInfoWithBLOBs selectByUserId(int userId);
}