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
                criteria.addOrder(org.hibernate.criterion.Order.desc("Rno"));//���ݷ���Ž��н�������org.hibernate.criterion.Order�Բ�ѯ�����������
                //�������Ŵ���101��С��201�ķ�����Ϣ
                //criteria.add(Restrictions.conjunction().add(Restrictions.gt("Rno",101)).add(Restrictions.lt("Rno",201)));
                if(null!=roomInfo){
                   //  roomInfo.setRno("101");//����RoomInfo��Ϊ�գ�����ݷ����Ϊ101����ѯ��Ϣ
                    criteria.add(Example.create(roomInfo));//�ὫRoomInfo�����е����ԣ��������������ԣ���Ϊ��ѯ�����ŵ�where�Ӿ��У��������ֵΪnull�����ԣ�Ҳ����˵���ɵ�
                    //where�Ӿ��в�����ֵΪnull������
                }
                return criteria.list();
            }
        });
    }

    //���ݾ����������ѯ������Ϣlist
    public List search(String str){
        String hql="from RoomInfo where Rstate=?";
        List<RoomInfo> roomlist=(List<RoomInfo>)template.find(hql,str);
        System.out.println("������======"+roomlist.get(0).getRstate());
        return roomlist;
    }
    public void addRoomInfo(RoomInfo roomInfo){
        template.save(roomInfo);
    }

    //����Rnoɾ����¼
    public void deleteRoomByRno(String rno){
        RoomInfo roomInfo=template.get(RoomInfo.class, rno);
        template.delete(roomInfo);
    }
    //����rno����RoomInfo��Ϣ
    public RoomInfo searchByRno(String rno){
        RoomInfo roomInfo=template.get(RoomInfo.class,rno);
        return roomInfo;
    }

    public void updateRoomInfo(RoomInfo roomInfo){
        template.update(roomInfo);
    }

    //�����ܵ�����
    public int rowsCount(RoomInfo roomInfo){
        String hql="select count(*) from RoomInfo";
        int rows = Integer.parseInt(template.find(hql).get(0).toString());
        return rows;


    }
}

