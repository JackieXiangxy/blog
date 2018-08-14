package com.ust.myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ust.myapp.mapper.ProfileMapper;
import com.ust.myapp.model.Profile;
import com.ust.myapp.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService{
	@Autowired
	private ProfileMapper pm;
	
	@Override
	public Profile getByuserId(int userId) {
		 Profile profile=pm.selectByUserId(userId);
	     return profile;
	}

	@Override
	public void updateProfileById(Profile pf) {
		pm.updateByPrimaryKey(pf);
	}

}
