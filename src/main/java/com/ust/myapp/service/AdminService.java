package com.ust.myapp.service;

import com.ust.myapp.model.Admin;

public interface AdminService {

	Admin selectBySelective(Admin admin);//查询账户是否存在
}
