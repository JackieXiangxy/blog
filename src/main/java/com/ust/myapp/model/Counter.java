package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 访问次数实例
 */
public class Counter implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer id;//访问id

    private Long num;//访问次数

    public Integer getId() {
        return id;
    }

   
    public void setId(Integer id) {
        this.id = id;
    }


    public Long getNum() {
        return num;
    }

  
    public void setNum(Long num) {
        this.num = num;
    }
}