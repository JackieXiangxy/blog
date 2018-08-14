package com.ust.myapp.model;

import java.io.Serializable;

/*
 * 用户信息实例
 */
public class Profile implements Serializable{


	private static final long serialVersionUID = 1L;


	private Integer id;//个人信息id


    private User user;//用户


    private String firstName;//名

    private String lastName;//姓

   
    private Boolean gender;//性别

  
    private String telephone;//手机号

    public Integer getId() {
        return id;
    }

  
    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getFirstName() {
        return firstName;
    }


    public void setFirstName(String firstName) {
        this.firstName = firstName == null ? null : firstName.trim();
    }

    public String getLastName() {
        return lastName;
    }


    public void setLastName(String lastName) {
        this.lastName = lastName == null ? null : lastName.trim();
    }


    public Boolean getGender() {
        return gender;
    }

 
    public void setGender(Boolean gender) {
        this.gender = gender;
    }


    public String getTelephone() {
        return telephone;
    }


    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }
}