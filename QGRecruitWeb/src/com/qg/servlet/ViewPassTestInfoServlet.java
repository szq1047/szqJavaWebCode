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
 * Servlet implementation class ViewPassTestInfoServlet
 */
@WebServlet("/ViewPassTestInfoServlet")
public class ViewPassTestInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewPassTestInfoServlet() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		
		//System.out.println("admin.getAdminMid()=="+admin.getAdminMid());
		if (admin.getAdminMid().equals("1")) {
			UserLoginBll userbll = new UserLoginBll();
			GroupInfoBll groupbll=new GroupInfoBll();
			Object[] userparams = { Integer.parseInt(admin.getAdminGroupId()) };
			try {
				List<User> userlist = userbll.getUserInfo(
						"select * from tb_user where groupId=? and testPass='1'",
						userparams);
				GroupInfo groupInfo=groupbll.getGroupInfoById(admin.getAdminGroupId());
				request.setAttribute("userlist", userlist);
				request.setAttribute("groupInfo", groupInfo);
				request.getRequestDispatcher("ViewPassTestInfo.jsp").forward(
						request, response);
			} catch (Exception e) {
				// TODO: handle exception
				response.getWriter().println("<script>alert('获取数据失败！');</script>");
				return;
			}
		} else {
			response.getWriter().println("<script>alert('你没有权限进行操作！');</script>");
			return;
		}

	}

}
