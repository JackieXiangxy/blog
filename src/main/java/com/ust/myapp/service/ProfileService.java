package com.ust.myapp.service;

import com.ust.myapp.model.Profile;

public interface ProfileService {
	
	Profile getByuserId(int userId);//根据id查个人信息
	void updateProfileById(Profile pf);//更新个人信息
}
