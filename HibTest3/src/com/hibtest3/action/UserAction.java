package com.hibtest3.action;

import com.hibtest3.biz.UserBiz;
import com.hibtest3.entity.UserInfo;

import java.util.Map;

/**
 * Created by Administrator on 2015/9/26.
 */
public class UserAction extends BaseAction {
    public UserBiz getUserBiz() {
        return userBiz;
    }

    UserBiz userBiz;
    public void setUserBiz(UserBiz userBiz){
        this.userBiz=userBiz;
    }

    Map<String,Object> request;
    Map<String,Object> session;

    public UserInfo getUserInfos() {
        return userInfos;
    }

    public void setUserInfos(UserInfo userInfos) {
        this.userInfos = userInfos;
    }

    private UserInfo userInfos;

    public String login(){
        //boolean result=false;
        UserInfo u=null;
        //System.out.println("userInfos==="+userInfos.getUserName()+",userInfos.getPwd="+userInfos.getPassword());
        userBiz=serviceManager.getUserBiz();
        System.out.println("uu==============="+userBiz.exists(userInfos));
        //System.out.println("userInfos=============="+userInfos.getUserName()+",userInfos====="+userInfos.getPassword());
        try{
            u=userBiz.getUsers(userInfos);
           // System.out.println("u=============="+u.getUserName()+",uname====="+u.getPassword());
            if(null!=u){
                session.put("user",u);
            }
        }catch (Exception e){
           // System.out.print("error=========="+e.getMessage());
        }
       if(u!=null){
           return "index";
       }else{
           return "error";
       }
    }

}
