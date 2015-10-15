package com.qg.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.NewBMTableBLL;

@WebServlet("/deleteBMTable")
public class deleteBMTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NewBMTableBLL nbmtbll = new NewBMTableBLL();
    public deleteBMTableServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String fileName = request.getParameter("filename").toString();//空报名表文件名
		int id = Integer.parseInt(request.getParameter("tbid"));
		String filePath = this.getServletConfig().getServletContext().getRealPath("/"); //服务器绝对路径	
		File file = new File(filePath + "BMTable\\NewBMTable\\" ,fileName);
		if(file.exists()){
			int isOk = nbmtbll.deleteNewBMTB(fileName,id);
			if(isOk == 1){
				file.delete();
				out.print("<script type=\"text/javascript\">alert('文件删除成功！');</script>");
				out.print("<script type=\"text/javascript\">window.location.href=\"NewBMTableManage\"</script>");
			}else{
				out.print("<script type=\"text/javascript\">alert('系统执行错误，请重试！');</script>");
				out.print("<script type=\"text/javascript\">window.location.href=\"NewBMTableManage\"</script>");
			}
		}else{
			out.print("<script type=\"text/javascript\">alert('文件不存在！');</script>");
			out.print("<script type=\"text/javascript\">window.location.href=\"NewBMTableManage\"</script>");
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
