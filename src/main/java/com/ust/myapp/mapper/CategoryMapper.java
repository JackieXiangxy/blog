package com.ust.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ust.myapp.model.Category;

public interface CategoryMapper {
  
    int deleteByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);
   
    int insert(Category record);

   
    int insertSelective(Category record);

 
    Category selectByPrimaryKey(Integer id);

 
    int updateByPrimaryKey2(@Param("categoryName") String categoryName, @Param("id1")int id);

    int updateByPrimaryKey(Category record);


	int count(int userId);


	List<Category> getCategoryPageByUserId(@Param("curPage") int curPage, @Param("size") int size, @Param("userId") int userId);


	List<Category> selectByUserId(int userId);
}