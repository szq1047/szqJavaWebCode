package com.hibtest3.dao;

import com.hibtest3.entity.UserInfo;

import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public interface UserDAO {
    public List search(UserInfo userInfos);
    public boolean exists(UserInfo userInfo);
}
