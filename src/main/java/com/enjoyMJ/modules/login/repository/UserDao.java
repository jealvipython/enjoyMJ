package com.enjoyMJ.modules.login.repository;


import com.enjoyMJ.modules.login.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * Created by 85075 on 2017/4/12.
 */
@Mapper
@Component
public interface UserDao {
    @Select("select * from user")
    public List<User> getList();
    @Select("select * from user where id= #{id}")
    public  User getById(@Param("id") Long id);
    @Insert("insert into user  values(#{id},#{name},#{sex},#{birthday})")
    public void add(User user);
    @Delete("delete from  user where id=#{id}")
    public  void delete(@Param("id") Long id);
    @Update("update user set name=#{name},sex=#{sex},birthday=#{birthday}")
    public void update(User user);
}
