package com.qg.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.*;
import com.qg.model.*;

/**
 * Servlet implementation class UpdateNotifyServlet
 */
@WebServlet("/ViewNotifyByIdServlet")
public class ViewNotifyByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewNotifyByIdServlet() {
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
		String ntfId=request.getParameter("NtfId");
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("ntfId=="+ntfId);
		NotifyManageBll bll=new NotifyManageBll();
		Notify notify=bll.getSingle(ntfId);
		if(notify!=null){
			request.setAttribute("notifyById",notify);
			RequestDispatcher rd=request.getRequestDispatcher("UpdateNotify.jsp");
			rd.forward(request,response);
		}else{
			response.getWriter().println("<script>alert('获得信息出错！')</script>");
			System.out.println("获得信息出错！");
			request.setAttribute("message", "无法获取信息");
			return;	
		}
	}

}
