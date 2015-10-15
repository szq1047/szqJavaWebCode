package com.hibtest3.biz;

import com.hibtest3.entity.UserInfo;


/**
 * Created by Administrator on 2015/9/26.
 */
public interface UserBiz {

    public UserInfo getUsers(UserInfo userInfos);
    public boolean exists(UserInfo userInfos);
}
