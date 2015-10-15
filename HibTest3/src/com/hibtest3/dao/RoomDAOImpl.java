package com.hibtest3.dao;

import com.hibtest3.entity.RoomInfo;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2015/9/26.
 */
public class RoomDAOImpl extends DAOSupport implements RoomDAO{

    public RoomDAOImpl(HibernateTemplate template){
        super(template);
    }

    public List search(final RoomInfo roomInfo, final int startIndex,final int rows) {
        return template.executeFind(
        new HibernateCallback(){
            public Object doInHibernate(Session session) throws HibernateException,SQLException{
                Criteria criteria=session.createCriteria(RoomInfo.class);
                criteria.setFirstResult(startIndex);
                criteria.setMaxResults(rows);
                criteria.addOrder(org.hibernate.criterion.Order.desc("Rno"));//根据房间号进行降序排序，org.hibernate.criterion.Order对查询结果进行排序
                //查出房间号大于101且小于201的房间信息
                //criteria.add(Restrictions.conjunction().add(Restrictions.gt("Rno",101)).add(Restrictions.lt("Rno",201)));
                if(null!=roomInfo){
                   //  roomInfo.setRno("101");//若果RoomInfo不为空，则根据房间号为101来查询信息
                    criteria.add(Example.create(roomInfo));//会将RoomInfo的所有的属性（不包括主键属性）作为查询条件放到where子句中，但会忽略值为null的属性，也就是说生成的
                    //where子句中不包括值为null的属性
                }
                return criteria.list();
            }
        });
    }

    //根据具体的条件查询房间信息list
    public List search(String str){
        String hql="from RoomInfo where Rstate=?";
        List<RoomInfo> roomlist=(List<RoomInfo>)template.find(hql,str);
        System.out.println("房间编号======"+roomlist.get(0).getRstate());
        return roomlist;
    }
    public void addRoomInfo(RoomInfo roomInfo){
        template.save(roomInfo);
    }

    //根据Rno删除记录
    public void deleteRoomByRno(String rno){
        RoomInfo roomInfo=template.get(RoomInfo.class, rno);
        template.delete(roomInfo);
    }
    //根据rno来查RoomInfo信息
    public RoomInfo searchByRno(String rno){
        RoomInfo roomInfo=template.get(RoomInfo.class,rno);
        return roomInfo;
    }

    public void updateRoomInfo(RoomInfo roomInfo){
        template.update(roomInfo);
    }

    //计算总的行数
    public int rowsCount(RoomInfo roomInfo){
        String hql="select count(*) from RoomInfo";
        int rows = Integer.parseInt(template.find(hql).get(0).toString());
        return rows;


    }
}

