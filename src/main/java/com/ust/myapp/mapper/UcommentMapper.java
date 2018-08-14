package com.ust.myapp.mapper;

import com.ust.myapp.model.UcommentWithBLOBs;

public interface UcommentMapper {
   
    int insert(UcommentWithBLOBs record);

    
    int insertSelective(UcommentWithBLOBs record);
}