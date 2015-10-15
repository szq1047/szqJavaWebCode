package com.hibtest3.dao;

import com.hibtest3.entity.UserInfo;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class UserDAOImpl extends DAOSupport implements UserDAO {

    public UserDAOImpl(HibernateTemplate template) {
        super(template);
    }

    public List search(final UserInfo userInfos) {
        return template.executeFind(
                new HibernateCallback() {
                    public Object doInHibernate(Session session) throws HibernateException, SQLException {
                        Criteria criteria = session.createCriteria(UserInfo.class);
                        if (null != userInfos) {
                            criteria.add(Example.create(userInfos));
                        }
                        return criteria.list();
                    }
                });
    }

    public boolean exists(UserInfo userInfo) {
        //  System.out.println("userInfo============== "+userInfo.getUserName()+",,, "+userInfo.getPassword());
        //∂®“ÂHQL”Ôæ‰
        String hql = "select count(*) from UserInfo where userName=?";
        //System.out.println("aaaaa="+template.find(hql,userInfo.getUserName()).get(0));
        int count = Integer.parseInt(template.find(hql, userInfo.getUserName()).get(0).toString());
        if (count == 0) {
            return false;
        } else {
            String hql1 = "select count(*) from UserInfo where userName=? and password=?";
            int count1 = Integer.parseInt(template.find(hql1, userInfo.getUserName(), userInfo.getPassword()).get(0).toString());
            if (count1 == 0) {
                return false;
            } else {
                return true;
            }
        }

    }
}

