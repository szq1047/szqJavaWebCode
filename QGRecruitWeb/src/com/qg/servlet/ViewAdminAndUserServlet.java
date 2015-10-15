package com.qg.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qg.model.*;
import com.qg.BLL.*;
import java.util.*;

/**
 * Servlet implementation class ViewAdminAndUserServlet
 */
@WebServlet("/ViewAdminAndUserServlet")
public class ViewAdminAndUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAdminAndUserServlet() {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin.getAdminMid().equals("1")) {
			Object[] params = { Integer.parseInt(admin.getAdminGroupId()) };
			AdminLoginBll adminbll = new AdminLoginBll();
			UserLoginBll userbll = new UserLoginBll();
			try {
				List<Admin> adminlist = adminbll.getAdminInfo(
						"select *from tb_admin where admin_GroupId=?", params);//查找对应组所有管理员的信息
				request.setAttribute("adminlist", adminlist);
				List<User> userlist = userbll.getUserInfo(
						"select *from tb_user where groupId=? and isJoin='1' and reg_ID not in(select user_ID from tb_admin_user)", params);
				//这句sql表示的意思是查询出那些未被分配导师的学员信息，并且是根据对应的组合已经可以参加QG训练营的。在sql的意思就是查询出不在tb_admin_user表中的剩余记录
				request.setAttribute("userlist", userlist);
				request.getRequestDispatcher("ViewAdminAndUser.jsp").forward(
						request, response);
			} catch (Exception e) {
				// TODO: handle exception
				response.getWriter().println("<script>alert('查询数据错误！');</script>");
				return;
			}
			
		}else{
			response.getWriter().println("<script>alert('你没有权限进行此操作！');</script>");
		}
	}

}
