package com.qg.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.qg.BLL.NewBMTableBLL;
import com.qg.model.NewBMTable;

@WebServlet("/UploadNewBMTable")
public class UploadNewBMTable extends HttpServlet{
	private static final long serialVersionUID = 1L;
	NewBMTableBLL nbmtbBll = new NewBMTableBLL(); 
	NewBMTable nbmtb = new NewBMTable(); 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,IOException{	
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();//获取输出流对象out
		Calendar cal = Calendar.getInstance();//使用日历类
		int year = cal.get(Calendar.YEAR);//得到年
		int month = cal.get(Calendar.MONTH)+1;//得到月，因为从0开始的，所以要加1
		int day = cal.get(Calendar.DAY_OF_MONTH);//得到天
		Date time = cal.getTime();
		int hh = time.getHours();//小时
		int mm = time.getMinutes();//分
		int ss = time.getSeconds();//秒
		String datetime = year+"/"+month+"/"+day+" "+hh+":"+mm+":"+ss;//获取文件上传时间
		
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
						if(upFileSize>maxSize){
							message = "你上传的文件大小已经超过50M!";
							break;
						}
						File tempFile = new File(fileName);
						String path = request.getRealPath("/BMTable/NewBMTable");//获取文件上传路径
						File file = new File(path,tempFile.getName());
						try{
							item.write(file);
						}catch(Exception e){
							e.printStackTrace();
							message = "上传文件出现错误!"+e.getMessage();
						}
						//将文件上传信息保存到数据库	
						nbmtb.setTb_filename(fileName);
						nbmtb.setTb_url("BMTable\\NewBMTable\\"+fileName);
						nbmtb.setUptime(datetime);
						int isOK = nbmtbBll.AddNewBMTableInfo(nbmtb);	
						if(isOK == 1){
							out.println("<script type=\"text/javascript\">alert('文件上传成功！');</script>");
							out.println("<script type=\"text/javascript\">window.location.href=\"NewBMTableManage\"</script>");
						}
					}else{
						message = "没有选择上传文件！";
						out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
						out.println("<script type=\"text/javascript\">window.location.href=\"NewBMTableManage\"</script>");
					}					
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			message = "上传文件出现错误" + e.getMessage();
			out.println("<script type=\"text/javascript\">alert('" + message + "');</script>");
			out.println("<script type=\"text/javascript\">window.location.href=\"NewBMTableManage\"</script>");
		}	
	}
}
