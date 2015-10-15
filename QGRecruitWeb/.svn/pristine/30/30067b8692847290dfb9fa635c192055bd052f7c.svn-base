package com.qg.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qg.BLL.*;
import com.qg.model.*;
import java.util.*;

/**
 * Servlet implementation class ViewAllAllocateServlet
 */
@WebServlet("/ViewAllAllocateServlet")
public class ViewAllAllocateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAllAllocateServlet() {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Admin admin=(Admin)request.getSession().getAttribute("admin");
		AdminAndUserBll bll=new AdminAndUserBll();
		List<AdminAndUser> list=bll.getAllInfo(admin.getAdminGroupId());
		request.setAttribute("list",list);
		//Admin admin=(Admin)request.getSession().getAttribute("admin");
		GroupInfoBll groupbll=new GroupInfoBll();
		GroupInfo groupInfo=new GroupInfo();
		groupInfo=groupbll.getGroupInfoById(admin.getAdminGroupId());
		request.setAttribute("groupInfo", groupInfo);
		request.getRequestDispatcher("ViewAllAllocate.jsp").forward(request,response);
	}

}
