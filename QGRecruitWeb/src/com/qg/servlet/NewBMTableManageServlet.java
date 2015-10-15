package com.qg.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.NewBMTableBLL;
import com.qg.model.Admin;
import com.qg.model.NewBMTable;

@WebServlet("/NewBMTableManage")
public class NewBMTableManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NewBMTableManageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Admin ad = null;
		if(request.getSession().getAttribute("admin") != null)
			ad = (Admin)request.getSession().getAttribute("admin");
		try{
			if(Integer.parseInt(ad.getAdminTop()) != 1){
				response.getWriter().println("<script>alert('你没有权限进行此操作！');</script>");
				System.out.println("你没有权限进行此操作！");
				request.setAttribute("message", "你没有权限进行此操作！");
				return;
			}else{
				NewBMTableBLL bmtbBll = new NewBMTableBLL();
				List<NewBMTable> list = new ArrayList<NewBMTable>();
				try {
					list = bmtbBll.getAllNewBMTableinfo();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("NewBMTableList", list);
				request.getRequestDispatcher("AdminStuff/ManageBM/NewBMTable.jsp").forward(request, response);	
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
