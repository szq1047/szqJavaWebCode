package com.qg.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.qg.model.*;
import com.qg.BLL.NotifyManageBll;

/**
 * Servlet implementation class ViewAllNotifyServlet
 */
@WebServlet("/ViewAllNotifyServlet")
public class ViewAllNotifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAllNotifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String adminName=null;
		try{
			adminName=request.getSession().getAttribute("adminName").toString();
			NotifyManageBll bll=new NotifyManageBll();
			List<Notify> list=null;
			if(bll.isAdminTop(adminName)){
				list=bll.getAllNotifyInfo();
				request.setAttribute("notifyList", list);
				RequestDispatcher rd=request.getRequestDispatcher("ViewAllNotify.jsp");
				rd.forward(request, response);
			}else{
				response.getWriter().println("<script>alert('你没有权限进行此操作！');</script>");
				System.out.println("你没有权限进行此操作！");
				request.setAttribute("message", "你没有权限进行此操作！");
				return;
			}
		}catch(Exception e){
			//response.getWriter().println("<script>alert('请登录！');</script>");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
				
		
	}

}
