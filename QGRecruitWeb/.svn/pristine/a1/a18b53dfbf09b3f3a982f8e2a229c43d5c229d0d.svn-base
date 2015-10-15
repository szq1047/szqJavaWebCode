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

import com.qg.BLL.UserBLL;
import com.qg.BLL.ZJBLL;
import com.qg.model.ZJ;

@WebServlet("/UploadNewZJ")
public class UploadNewZJServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ZJBLL zjbll = new ZJBLL();
	ZJ zj = new ZJ(); 
	UserBLL usebll = new UserBLL();
	int uid = 0;
	String user = "";
	String wr_title = "";//周记文件名
	String realname = "";//周记上传人
	String datetime = "";//周记上传时间
	int groupid = 0;//周记所属组别ID
	String zjPath = ""; // 周记上传路径
	String zjPath1 = ""; //周记上传路径
    public UploadNewZJServlet() {
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
		if(request.getParameter("user") != null&&request.getParameter("uid")!=null){
			user = request.getParameter("user").toString();
			uid = Integer.parseInt(request.getParameter("uid"));
			try {
				groupid = usebll.getUserGroupID(user,uid);
				realname = usebll.getUserRealName(user, uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(groupid == 1){
			zjPath = "weeklyReport\\network\\";
			zjPath1 = "/weeklyReport/network";
		}
		if(groupid == 3){
			zjPath = "weeklyReport\\game\\";
			zjPath1 = "/weeklyReport/game";
		}
		if(groupid == 2 ){
			zjPath = "weeklyReport\\embed\\";
			zjPath1 = "/weeklyReport/embed";
		}
		if(groupid == 5){
			zjPath = "weeklyReport\\mobile\\";
			zjPath1 = "/weeklyReport/mobile";
		}
		if(groupid == 4){
			zjPath = "weeklyReport\\art\\";
			zjPath1 = "/weeklyReport/art";
		}
		String message = "";
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
							String path = request.getRealPath(zjPath1);//获取文件上传路径
							File file = new File(path,tempFile.getName());
							//将文件上传信息保存到数据库	
							zj.setWrTitle(fileName);
							zj.setWrAuthor(realname);
							zj.setWrUptime(datetime);
							zj.setWrGroupID(groupid);
							zj.setWrPath(zjPath+fileName);
							int isOK = zjbll.AddZJInfo(zj);	
							if(isOK == 1){
								try{
									item.write(file);
								}catch(Exception e){
									e.printStackTrace();
									message = "上传文件出现错误，请重试!";
									out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
									out.println("<script type=\"text/javascript\">history.back();</script>");
								}
								out.println("<script type=\"text/javascript\">alert('周记上传成功！');</script>");
								out.println("<script type=\"text/javascript\">history.back()</script>");
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
