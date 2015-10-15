package com.qg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.qg.BLL.NotifyManageBll;
import com.qg.model.Notify;

/**
 * Servlet implementation class PageDivideServlet
 */
@WebServlet("/PageDivideServlet")
public class PageDivideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageDivideServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String curPage=request.getParameter("curPage");
		System.out.println("curPage====="+curPage);
		try {
			NotifyManageBll bll=new NotifyManageBll();
			List<Notify> list=new ArrayList<Notify>();
			list=bll.getPageDivideInfo(curPage);
			JSONArray jsonArray=JSONArray.fromObject(list);
			String json=jsonArray.toString();
			//System.out.println(json);
			out.println(json);
		} catch (Exception e) {
			out.println("<script>alert('获取数据失败！')</script>");
		}
	}
	

}
