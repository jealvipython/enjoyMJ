package com.enjoyMJ.modules.login.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.enjoyMJ.modules.common.base.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by joseph on 2017/6/28
 */
public class User extends BaseEntity{
    private Long id;
    private String username;
    private String password;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;




}

