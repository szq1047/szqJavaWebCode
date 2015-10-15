package com.qg.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.NotifyManageBll;
import com.qg.model.Notify;

/**
 * Servlet implementation class UpdateNotifyServlet
 */
@WebServlet("/UpdateNotifyServlet")
public class UpdateNotifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNotifyServlet() {
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
		try {
			String ntfId=request.getParameter("notifyId");
			String title=request.getParameter("notifyTitle");
			String content=request.getParameter("content");
			SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd hh:mm");
			String now=sm.format(new Date());
			//System.out.println("ntfId="+ntfId+",title="+title+",content="+content+",now="+now);
			NotifyManageBll bll=new NotifyManageBll();
			Notify notify=new Notify();
			notify.setNtfId(Integer.parseInt(ntfId));
			notify.setNtfTitle(title);
			notify.setNtfContent(content);
			notify.setNtfPublisher(request.getSession().getAttribute("adminName").toString());
			notify.setNtfPubDate(now);
			int result=bll.updateNotifyById(notify);
			if(result!=0){
				RequestDispatcher rd=request.getRequestDispatcher("ViewAllNotifyServlet");
				rd.forward(request, response);
			}else{
				response.getWriter().println("<script>alert('更新失败！')</script>");
				System.out.println("更新失败！");
				request.setAttribute("message", "更新失败！");
				return;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
