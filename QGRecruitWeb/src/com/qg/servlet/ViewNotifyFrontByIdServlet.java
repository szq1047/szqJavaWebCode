package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.NotifyManageBll;
import com.qg.model.Notify;

/**
 * Servlet implementation class ViewNotifyFrontById
 */
@WebServlet("/ViewNotifyFrontByIdServlet")
public class ViewNotifyFrontByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewNotifyFrontByIdServlet() {
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
		PrintWriter out=response.getWriter();
		String ntfId=request.getParameter("ntfId");
		System.out.println("ntfId="+ntfId);
		NotifyManageBll bll=new NotifyManageBll();
		Notify notify=null;
		try {
			notify=bll.getSingle(ntfId);
			request.setAttribute("notify", notify);
			RequestDispatcher rd=request.getRequestDispatcher("ViewNotifyFrontById.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			out.println("<script>alert('查询错误！')</script>");
			return;
		}
		
	}

}
