package com.ust.myapp.mapper;

import com.ust.myapp.model.Counter;

public interface CounterMapper {
    
    int deleteByPrimaryKey(Integer id);

   
    int insert(Counter record);

    
    int insertSelective(Counter record);

   
    Counter selectByPrimaryKey(Integer id);

    
    int updateByPrimaryKeySelective(Counter record);

    
    int updateByPrimaryKey(Counter record);
    
    public int setNum(int num);
    
    
    
}