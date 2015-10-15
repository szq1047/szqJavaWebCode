package com.hibtest3.dao;

import com.hibtest3.entity.CustomerInfo;
import com.hibtest3.entity.CustomerLivingInfo;
import com.hibtest3.entity.RoomInfo;
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
public class CustomerLivingDAOImpl extends DAOSupport implements CustomerLivingDAO{

    public CustomerLivingDAOImpl(HibernateTemplate template){
        super(template);
    }
    public List search(final CustomerLivingInfo customerLivingInfo) {
        return template.executeFind(
        new HibernateCallback(){
            public Object doInHibernate(Session session) throws HibernateException,SQLException{
                Criteria criteria=session.createCriteria(CustomerLivingInfo.class);
                if(null!=customerLivingInfo){
                    criteria.add(Example.create(customerLivingInfo));
                }
                return criteria.list();
            }
        });
    }
    public void addCustomerLivingInfo(CustomerLivingInfo customerLivingInfo){
        template.save(customerLivingInfo);
    }
    public CustomerLivingInfo getCustomerLivingInfoByCno(RoomInfo roomInfo,CustomerInfo customerInfo){
        //System.out.println("addd======"+roomInfo.getRno()+","+customerInfo.getCno());
        String hql="from CustomerLivingInfo customerLivingInfo where customerLivingInfo.roomInfo.Rno=? and customerLivingInfo.customerInfo.Cno=?";
        CustomerLivingInfo customerLivingInfo=(CustomerLivingInfo)(template.find(hql,roomInfo.getRno(),customerInfo.getCno()).get(0));
        return customerLivingInfo;
    }

    public void updateCustomerLivingInfo(CustomerLivingInfo customerLivingInfo){
        template.update(customerLivingInfo);
    }


}

