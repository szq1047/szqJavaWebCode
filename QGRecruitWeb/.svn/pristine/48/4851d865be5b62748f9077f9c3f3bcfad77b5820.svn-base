package com.qg.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.*;
import com.qg.model.*;

/**
 * Servlet implementation class AddNotifyServlet
 */
@WebServlet("/AddNotifyServlet")
public class AddNotifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNotifyServlet() {
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
		String title=request.getParameter("notifyTitle");
		String content=request.getParameter("content").replace("\\s*", "").trim();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String now=format.format(new Date());
		System.out.println("now=="+now);
		System.out.println("notifyTitle=="+title);
		System.out.println("content=="+content);
		NotifyManageBll bll=new NotifyManageBll();
		Notify notify=new Notify();
		notify.setNtfTitle(title);
		notify.setNtfContent(content);
		notify.setNtfPublisher(request.getSession().getAttribute("adminName").toString());
		notify.setNtfPubDate(now.toString());
		int result=bll.AddNotifyInfo(notify);
		if(result!=0){
			RequestDispatcher rd=request.getRequestDispatcher("ViewAllNotifyServlet");
			rd.forward(request, response);
		}else{
			response.getWriter().println("<script>alert('添加出错！')</script>");
			System.out.println("添加出错！！");
			request.setAttribute("message", "添加失败！");
			return;
		}
	}

}
