package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.UserBLL;

@WebServlet("/ZXBM")
public class ZXBMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ZXBMServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getSession().getAttribute("userName")==null){
			out.println("<script type=\"text/javascript\">alert('你还未登录，请先登录或者注册！');</script>");
			out.println("<script type=\"text/javascript\">history.back()</script>");
		}else{
			String username = request.getSession().getAttribute("userName").toString();
			UserBLL user = new UserBLL();
			try {
				ResultSet userRS = user.getUserInfo(username);
				request.setAttribute("user", userRS);
				request.getRequestDispatcher("ZXBM.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
