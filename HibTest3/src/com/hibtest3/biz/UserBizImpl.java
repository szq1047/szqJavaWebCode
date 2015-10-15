package com.hibtest3.biz;

import com.hibtest3.dao.UserDAO;
import com.hibtest3.entity.UserInfo;

import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class UserBizImpl implements UserBiz {
    private UserDAO userDAO;
    public UserBizImpl(UserDAO userDAO){
        this.userDAO=userDAO;
    }

    public void setUserDAO(UserDAO userDAO){
        this.userDAO=userDAO;
    }
    public UserInfo getUsers(UserInfo userInfos){
        UserInfo userInfo=null;
        List list=userDAO.search(userInfos);
        Iterator iter=list.iterator();
        if(iter.hasNext()){
            userInfo=(UserInfo)iter.next();
        }
        return userInfo;
    }
    public boolean exists(UserInfo userInfos){
        //System.out.println("userInfo=============="+userInfos.getUserName()+","+userInfos.getPassword());
       // userDAO=new UserDAOImpl(hibernateTemplate);
       // userDAO=new UserDAOImpl();
        boolean result=userDAO.exists(userInfos);
        return result;
    }
}
