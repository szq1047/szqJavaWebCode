package com.qg.testServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.TestInfoBll;

/**
 * Servlet implementation class DeleteTestServlet
 */
@WebServlet("/DeleteTestServlet")
public class DeleteTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteTestServlet() {
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
		String testId = request.getParameter("TestId");
		PrintWriter out = response.getWriter();
		// System.out.println("testId="+testId);
		String filepath = request.getRealPath("/");// + "test/";
		String filename = new String(request.getParameter("TestPath").getBytes(
				"ISO8859-1"), "utf-8").toString();
		String action = request.getParameter("action");
		java.io.File file = new java.io.File(filepath + filename);
		// 删除存放在项目中对应的文件
		if (file.exists()) {
			file.delete();
		}
		if (testId == "" || testId.equals(null)) {
			out.println("<script>alert('没有获得试题编号！');</script>");
		} else {
			TestInfoBll bll = new TestInfoBll();
			int result = bll.deleteTestInfoById(testId);// 删除数据表中的记录
			if (result != 0) {
				if (action.equals("usertest")) {
					RequestDispatcher rd = request
							.getRequestDispatcher("ViewAllTestServlet");
					rd.forward(request, response);
				}else if(action.equals("voidtest")){
					RequestDispatcher rd = request
							.getRequestDispatcher("ViewAllVoidTestServlet");
					rd.forward(request, response);
				}
				
			} else {
				out.println("<script>alert('删除失败！');</script>");
			}
		}

	}

}
