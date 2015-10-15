package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.Common.DblHelper;

@WebServlet("/addMessage")
public class addMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addMessageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		new DblHelper();//实例化DBHelper对象
		int uid = 0;//留言者ID
		String user = request.getParameter("user").toString();//留言者
		if(user.equals("")){
			out.println("<script type=\"text/javascript\">alert('你还未登录，请先注册登录之后再发表留言！');</script>");
			out.println("<script type=\"text/javascript\">history.back();</script>");
		}else{
			String content = request.getParameter("content").toString();//留言内容
			content = new String(content.getBytes("ISO-8859-1"),"UTF-8");
			Object [] obj1 = {user};
			ResultSet rs = DblHelper.executeQueryRS("select * from tb_user where reg_Name = ?", obj1);
			try {
				if(rs.next()){
					uid = rs.getInt("reg_ID");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			//String title = request.getParameter("title");//留言标题
			String title = "留言";//留言标题
			Calendar cal = Calendar.getInstance();//使用日历类
			int year = cal.get(Calendar.YEAR);//得到年
			int month = cal.get(Calendar.MONTH)+1;//得到月，因为从0开始的，所以要加1
			int day = cal.get(Calendar.DAY_OF_MONTH);//得到天
			Date time = cal.getTime();
			int hh = time.getHours();
			int mm = time.getMinutes();
			int ss = time.getSeconds();
			String datetime=year+"/"+month+"/"+day+" "+hh+":"+mm+":"+ss;//留言时间
			Object [] obj = {uid,title,content,datetime};
			String sqlStr = "insert into tb_message values(null,?,?,?,?)";
			try{
				int isOk = DblHelper.ExcuteNonQuery(sqlStr, obj);
				if(isOk==1){
					out.println("<script type=\"text/javascript\">alert('留言添加成功！');</script>");
					out.println("<script type=\"text/javascript\">window.location.href=\"GetLiuyan\"</script>");
				}
				else{
					out.println("<script type=\"text/javascript\">alert('系统错误，留言添加失败，请重试！');</script>");
					out.println("<script type=\"text/javascript\">window.location.href=\"GetLiuyan\"</script>");
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
				
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
