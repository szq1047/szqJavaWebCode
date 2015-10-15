package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.Common.DblHelper;

@WebServlet("/deleteMessage")
public class deleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public deleteMessageServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		new DblHelper();
		int msg_id = Integer.parseInt(request.getParameter("ID"));
		String sqlStr = "delete from tb_message where msg_ID = ?";
		try{
			Object []obj = {msg_id};
			int isOk = DblHelper.ExcuteNonQuery(sqlStr, obj);
			//System.out.println("msg_id"+msg_id);
			if(isOk==1){
		
				out.println("<script type=\"text/javascript\">alert('该留言删除成功！');</script>");
				out.println("<script type=\"text/javascript\">window.location.href=\"GetLiuyan?role=admin\"</script>");
			}
			else{
				out.println("<script type=\"text/javascript\">alert('系统错误，请重试！');</script>");
				out.println("<script type=\"text/javascript\">window.location.href=\"GetLiuyan?role=admin\"</script>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
