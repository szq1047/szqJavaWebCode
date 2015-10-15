package com.hibtest3.dao;

import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * Created by Administrator on 2015/9/22.
 */
public class DAOSupport {
    protected HibernateTemplate template;
    public DAOSupport(HibernateTemplate template){
        this.template=template;
    }
}
