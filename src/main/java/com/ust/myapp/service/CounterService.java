package com.ust.myapp.service;

import com.ust.myapp.model.Counter;

public interface CounterService {
    public	Counter getCounter();//获取浏览次数
    public int setNum(int num);
	
}
