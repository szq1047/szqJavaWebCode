package com.qg.testServlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.GroupInfoBll;
import com.qg.BLL.NotifyManageBll;
import com.qg.BLL.TestInfoBll;
import com.qg.BLL.TestTypeInfoBll;
import com.qg.model.Admin;
import com.qg.model.GroupInfo;
import com.qg.model.Notify;
import com.qg.model.TestInfo;
import com.qg.model.TestTypeInfo;

/**
 * Servlet implementation class ViewAllVoidTestServlet
 */
@WebServlet("/ViewAllVoidTestServlet")
public class ViewAllVoidTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAllVoidTestServlet() {
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
		Admin admin = null;
		try {
			admin = (Admin) request.getSession().getAttribute("admin");
			if (admin.getAdminTop().equals("1")) {
				TestInfoBll bll = new TestInfoBll();
				TestTypeInfoBll testTypeBll = new TestTypeInfoBll();
				GroupInfoBll groupBll = new GroupInfoBll();
				List<TestInfo> list = new ArrayList<TestInfo>();
				List<TestTypeInfo> testTypelist = new ArrayList<TestTypeInfo>();
				List<GroupInfo> grouplist = new ArrayList<GroupInfo>();
				Object[] params = { Integer.parseInt(admin.getAdminGroupId()),
						admin.getAdminName() };
				list = bll
						.getPartTestInfo(
								"select * from tb_test where test_GroupID=? and test_Publisher=?",
								params);// 根据登录管理员的角色，可以查到对应组的试题信息
				// System.out.println("list="+list);
				/*if (list.isEmpty()) {
					System.out.println("空数据集！");
					// response.getWriter().println("<script>alert('没有数据集！')</script>");
					// return;
				}*/
				request.setAttribute("list", list);
				if (!list.isEmpty()) {
					for (int i = 0; i < list.size(); i++) {
						TestTypeInfo testType = new TestTypeInfo();
						int id = list.get(i).getTesttypeId();
						testType = testTypeBll.getAllTestTypeInfoById(String
								.valueOf(id));
						testTypelist.add(testType);
					}
					request.setAttribute("testTypelist", testTypelist);
					for (int i = 0; i < list.size(); i++) {
						GroupInfo group = new GroupInfo();
						String groupId = list.get(i).getTestGroupId();
						group = groupBll.getGroupInfoById(groupId);
						grouplist.add(group);
					}
					request.setAttribute("grouplist", grouplist);
				}
				RequestDispatcher rd = request
						.getRequestDispatcher("ViewAllVoidTest.jsp");
				rd.forward(request, response);
			} else {
				response.getWriter().println(
						"<script>alert('你没有权限进行此操作！');</script>");
				System.out.println("你没有权限进行此操作！");
				request.setAttribute("message", "你没有权限进行此操作！");
				return;
			}
		} catch (Exception e) {
			// response.getWriter().println("<script>alert('请登录！');</script>");
			// request.getRequestDispatcher("login.jsp").forward(request,
			// response);
		}

	}
}
