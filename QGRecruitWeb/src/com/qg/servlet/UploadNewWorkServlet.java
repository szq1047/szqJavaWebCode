package com.qg.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.qg.BLL.AdminBLL;
import com.qg.BLL.HWBLL;
import com.qg.model.HW;

@WebServlet("/UploadNewWork")
public class UploadNewWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HWBLL hwbll = new HWBLL();
	HW hw = new HW(); 
	AdminBLL adbll = new AdminBLL();
	String hw_title = "";//作业文件名
	String user = "";//作业上传人
	int groupid = 0;//作业所属组别ID
	String datetime = "";//作业上传时间
	String hwPath = ""; // 作业上传路径
	String hwPath1 = ""; // 作业上传路径
    public UploadNewWorkServlet() {
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
		datetime = year+"/"+month+"/"+day+" "+hh+":"+mm+":"+ss;//新作业上传时间
		if(request.getParameter("user") != null){
			user = request.getParameter("user").toString();
			try {
				groupid = adbll.getGroupID(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(groupid == 1){
			hwPath = "homework\\NewHomeWork\\network\\";
			hwPath1 = "/homework/NewHomeWork/network";
		}
		if(groupid == 3){
			hwPath = "homework\\NewHomeWork\\game\\";
			hwPath1 = "/homework/NewHomeWork/game";
		}
		if(groupid == 2 ){
			hwPath = "homework\\NewHomeWork\\embed\\";
			hwPath1 = "/homework/NewHomeWork/embed";
		}
		if(groupid == 5){
			hwPath = "homework\\NewHomeWork\\mobile\\";
			hwPath1 = "/homework/NewHomeWork/mobile";
		}
		if(groupid == 4){
			hwPath = "homework\\NewHomeWork\\art\\";
			hwPath1 = "/homework/NewHomeWork/art";
		}
		String message = "";//
		int maxSize = 50*1024*1024;//规定上传文件的大小不超过50M
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try{
			List items = upload.parseRequest(request);
			Iterator itr = items.iterator();
			while(itr.hasNext()){
				FileItem item = (FileItem)itr.next();
				if(!item.isFormField()){
					if(item.getName()!=null&&!item.getName().equals("")){
						long upFileSize = item.getSize();	//获取上传文件的大小
						String fileName = item.getName();  //获取上传的文件名
						fileName = new String(fileName.getBytes(),"UTF-8");
						if(upFileSize>maxSize){
							message = "你上传的文件大小已经超过50M!";
							out.println("<script type=\"text/javascript\">history.back();</script>");
						}else{
							File tempFile = new File(fileName);
							String path = request.getRealPath(hwPath1);//获取文件上传路径
							File file = new File(path,tempFile.getName());
							//将文件上传信息保存到数据库	
							hw.setHwTitle(fileName);
							hw.setHwAuthor(user);
							hw.setHwUptime(datetime);
							hw.setHwGroupID(groupid);
							hw.setHwPath(hwPath+fileName);
							int isOK = hwbll.AddHWInfo(hw);	
							if(isOK == 1){
								try{
									item.write(file);
								}catch(Exception e){
									e.printStackTrace();
									message = "上传文件出现错误，请重试!";
									out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
									out.println("<script type=\"text/javascript\">history.back();</script>");
								}
								out.println("<script type=\"text/javascript\">alert('作业发布成功！');</script>");
								out.println("<script type=\"text/javascript\">window.location.href=\"NewWorkManage\"</script>");
							}else{
								out.println("<script type=\"text/javascript\">alert('系统错误，请重试！');</script>");
								out.println("<script type=\"text/javascript\">history.back();</script>");
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
