package com.qg.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.qg.BLL.BMBLL;
import com.qg.model.BM;

@WebServlet("/UploadBMTable")
public class UploadBMTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BMBLL bmbll = new BMBLL();
	BM bm = new BM();   
	String form_Name = "报名表";//报名表名
	int uid = 0;  //报名者ID
	String reason = "见报名表";//报名原因
	int groupid = 0;//意向组别ID
	String datetime = "";//报名时间
	String formPath = ""; // 报名表上传路径
	String form_status= "0";//报名表确认状态
	String realname = "";//报名者真实姓名
    public UploadBMTableServlet() {
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
		
		datetime = year+"/"+month+"/"+day+" "+hh+":"+mm+":"+ss;//报名表上传时间
		if(request.getParameter("reg_id") != null)
			uid = Integer.parseInt(request.getParameter("reg_id"));
		if(request.getParameter("realname") != null){
			realname = request.getParameter("realname").toString();
		}

		if(bmbll.BMIsExit(uid) == true){
			out.println("<script type=\"text/javascript\">alert('您已经报过名，请留意报名结果！');</script>");
			out.println("<script type=\"text/javascript\">window.location.href=\"BMindex.jsp\"</script>");
		}else{
			String message = "";//
			int maxSize = 50*1024*1024;//规定上传文件的大小不超过50M
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try{
				List items = upload.parseRequest(request);
				Iterator itr = items.iterator();
				while(itr.hasNext()){
					FileItem item = (FileItem)itr.next();
					if(item.isFormField()){
						String value = item.getString();
						groupid = Integer.parseInt(value);
					}
					if(!item.isFormField()){
						if(item.getName()!=null&&!item.getName().equals("")){
							long upFileSize = item.getSize();	//获取上传文件的大小
							String fileName = item.getName();  //获取上传的文件名
							fileName = new String(fileName.getBytes(),"UTF-8");
							if(!fileName.equals(realname+"的报名表.docx")){
								out.println("<script type=\"text/javascript\">alert('您的文件名不符合要求，格式为“姓名+的报名表”！');</script>");
								out.println("<script type=\"text/javascript\">history.back();</script>");
							}else{
								if(upFileSize>maxSize){
									message = "你上传的文件大小已经超过50M!";
									out.println("<script type=\"text/javascript\">history.back();</script>");
								}else{
									File tempFile = new File(fileName);
									String path = request.getRealPath("/BMTable/FinishedBMTable");//获取文件上传路径
									File file = new File(path,tempFile.getName());
									//将文件上传信息保存到数据库	
									bm.setFormName(fileName);
									bm.setUserID(uid);
									bm.setReason(reason);
									bm.setGroupID(groupid);
									bm.setForm_Date(datetime);
									bm.setForm_path("BMTable\\FinishedBMTable\\"+fileName);
									bm.setForm_Status(form_status);
									int isOK = bmbll.AddBMInfo(bm);	
									if(isOK == 1){
										try{
											item.write(file);
										}catch(Exception e){
											e.printStackTrace();
											message = "上传文件出现错误，请重试!";
											out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
											out.println("<script type=\"text/javascript\">history.back();</script>");
										}
										out.println("<script type=\"text/javascript\">alert('报名表上传成功！');</script>");
										out.println("<script type=\"text/javascript\">window.location.href=\"UploadBMTable.jsp\"</script>");
									}else{
										out.println("<script type=\"text/javascript\">alert('系统错误，请重试！');</script>");
										out.println("<script type=\"text/javascript\">history.back();</script>");
									}
								}
							}
						}else{
							message = "没有选择上传文件！";
							out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
							out.println("<script type=\"text/javascript\">history.back();</script>");
						}					
					}
				}
			}catch(Exception e){
				e.printStackTrace();
				message = "上传文件出现错误" + e.getMessage();
				out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
				out.println("<script type=\"text/javascript\">history.back();</script>");
			}				
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
