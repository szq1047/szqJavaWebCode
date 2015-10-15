package com.qg.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.HWBLL;

@WebServlet("/deleteNewWork")
public class deleteNewWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HWBLL hwbll = new HWBLL();
	File file = null;
    public deleteNewWorkServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String fileName = request.getParameter("filename").toString();//文件名
		int id = Integer.parseInt(request.getParameter("fileid"));
		String groupid = request.getParameter("groupid").toString();
		String filePath = this.getServletConfig().getServletContext().getRealPath("/"); //服务器绝对路径	
		if(groupid.equals("网络组")){
			file = new File(filePath + "homework\\NewHomeWork\\network\\" ,fileName);
		}
		if(groupid.equals("手游组")){
			file = new File(filePath + "homework\\NewHomeWork\\game\\" ,fileName);
		}
		if(groupid.equals("嵌入式组")){
			file = new File(filePath + "homework\\NewHomeWork\\embed\\" ,fileName);
		}
		if(groupid.equals("移动组")){
			file = new File(filePath + "homework\\NewHomeWork\\mobile\\" ,fileName);
		}
		if(groupid.equals("美工组")){
			file = new File(filePath + "homework\\NewHomeWork\\art\\" ,fileName);
		}
		if(file.exists()){
			int isOk = hwbll.deleteNewHW(fileName,id);
			if(isOk == 1){
				file.delete();
				out.print("<script type=\"text/javascript\">alert('文件删除成功！');</script>");
				out.print("<script type=\"text/javascript\">window.location.href=\"NewWorkManage\"</script>");
			}else{
				out.print("<script type=\"text/javascript\">alert('系统执行错误，请重试！');</script>");
				out.print("<script type=\"text/javascript\">window.location.href=\"NewWorkManage\"</script>");
			}
		}else{
			out.print("<script type=\"text/javascript\">alert('文件不存在！');</script>");
			out.print("<script type=\"text/javascript\">window.location.href=\"NewWorkManage\"</script>");
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
