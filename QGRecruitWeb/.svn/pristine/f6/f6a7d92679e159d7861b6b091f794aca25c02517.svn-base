package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.BMBLL;
import com.qg.BLL.UserBLL;

@WebServlet("/LetBMPass")
public class LetBMPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		BMBLL bmtbbll = new BMBLL();
	    UserBLL userbll = new UserBLL();
		String type = request.getParameter("type").toString();//获取审核种类（在线报名审核和下载报名表审核）
		int formid = Integer.parseInt(request.getParameter("ID"));//获取报名表ID
		try {
			if(bmtbbll.getFormStatus(formid) != 1){
				int okuser = userbll.LetBMPass(formid);
				int okbmtb = bmtbbll.LetBMPass(formid);
				if(okbmtb == 1 && okuser == 1){
					out.println("<script type=\"text/javascript\">alert('审核成功！');</script>");
					if(type.equals("tb"))
						out.println("<script type=\"text/javascript\">window.location.href=\"BMTableManage\"</script>");
					if(type.equals("zxbm"))
						out.println("<script type=\"text/javascript\">window.location.href=\"ZXBMManage\"</script>");
				}else{
					out.println("<script type=\"text/javascript\">alert('系统执行错误，请重试！');</script>");
					out.println("<script type=\"text/javascript\">history.back()</script>");
				}						
			}else{
				out.println("<script type=\"text/javascript\">alert('这个报名表已经通过审核，不要重复操作！');</script>");
				if(type.equals("tb"))
					out.println("<script type=\"text/javascript\">window.location.href=\"BMTableManage\"</script>");
				if(type.equals("zxbm"))
					out.println("<script type=\"text/javascript\">window.location.href=\"ZXBMManage\"</script>");	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
