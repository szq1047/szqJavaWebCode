package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.BMBLL;
import com.qg.model.BM;

@WebServlet("/addBMInfo")
public class addBMInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BMBLL bmbll = new BMBLL();
	BM bm = new BM();	
	String form_Name = "报名表";//报名表名
	int uid = 0;  //报名者ID
	String reason = "";//报名原因
	int groupid = 0;//意向组别ID
	String datetime = "";//报名时间
	String formPath = ""; // 报名表上传路径
	String form_status= "0";//报名表确认状态
	public addBMInfoServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Calendar cal = Calendar.getInstance();//使用日历类
		int year = cal.get(Calendar.YEAR);//得到年
		int month = cal.get(Calendar.MONTH)+1;//得到月，因为从0开始的，所以要加1
		int day = cal.get(Calendar.DAY_OF_MONTH);//得到天
		Date time = cal.getTime();
		int hh = time.getHours();//小时
		int mm = time.getMinutes();//分
		int ss = time.getSeconds();//秒
		datetime = year+"/"+month+"/"+day+" "+hh+":"+mm+":"+ss;
		if(request.getParameter("reg_id") != null)
			uid = Integer.parseInt(request.getParameter("reg_id"));
		if(request.getParameter("reason") != null){
			reason = request.getParameter("reason").toString();	
			reason = new String(reason.getBytes("ISO-8859-1"),"UTF-8");
		}
		if(request.getParameter("groupID") != null)
			groupid = Integer.parseInt(request.getParameter("groupID"));
		if(request.getParameter("formname") != null)
			form_Name = request.getParameter("formname").toString();		
		
		if(bmbll.BMIsExit(uid) == true){
			out.println("<script type=\"text/javascript\">alert('您已经报过名，请留意您的审核结果！');</script>");
			out.println("<script type=\"text/javascript\">history.back();</script>");
		}else{	
			bm.setUserID(uid);
			bm.setGroupID(groupid);
			bm.setReason(reason);
			bm.setForm_Date(datetime);
			bm.setForm_path(formPath);
			bm.setForm_Status(form_status);
			bm.setFormName(form_Name);
			int ok = bmbll.AddBMInfo(bm);
			if(ok == 1){
				out.println("<script type=\"text/javascript\">alert('在线报名成功！');</script>");
				out.println("<script type=\"text/javascript\">window.location.href=\"BMindex.jsp\"</script>");			
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
