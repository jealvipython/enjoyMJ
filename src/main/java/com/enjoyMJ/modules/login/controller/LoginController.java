package com.enjoyMJ.modules.login.controller;

import com.enjoyMJ.modules.login.entity.User;
import com.enjoyMJ.modules.login.repository.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 85075 on 2017/4/12.
 */
@Controller
@RequestMapping("index")
public class LoginController {
        @Autowired
        private UserDao userDao;
        @RequestMapping(value="/toLogin")
        public String index(Model model){

            return "index";

        }



























//        @RequestMapping("/world")
//        public  Object say(){
//            List<User> list = userDao.getList();
//
//               Map<String, Object> map = new HashMap<>();
//               Map<String, Object> map2 = new HashMap<>();
//                map.put("total",10);
//                map.put("rows",list);
//                map2.put("data",map);
//                return  map;
//        }
//        @RequestMapping(value = "/one")
//        public  Object sayOne(@Param(value = "id") Long id){
//                return  userDao.getById(id);
//        }
//        @RequestMapping(value = "/add")
//        public  Object addOne(User user){
//               try{
//                       userDao.add(user);
//                       return "success";
//               }catch (Exception e){
//                        return "fail";
//               }
//        }
//        @RequestMapping(value = "/delete")
//        public  Object delete(@Param(value = "id") Long id){
//                try{
//                        userDao.delete(id);
//                        return "success";
//                }catch (Exception e){
//                        return "fail";
//                }
//        }
//        @RequestMapping(value = "/update")
//        public  Object update(User user){
//                try{
//                        userDao.update(user);
//                        return "success";
//                }catch (Exception e){
//                        return "fail";
//                }
//        }


}
