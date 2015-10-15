package com.qg.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qg.Common.BMTablePageDivide;
import com.qg.model.Admin;

@WebServlet("/BMTableManage")
public class BMTableManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BMTableManageServlet() {
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
				String sqlStr = "SELECT * FROM tb_bm where form_path not like ''";
				try {
					BMTablePageDivide dd = new BMTablePageDivide(sqlStr);
					String showPage = request.getParameter("page");
					int n;
					int totalPageNum = dd.getTotalPageNum();
					if(showPage == null || showPage.equals("")){
						n=1;
					}
					else{
						if(Integer.parseInt(showPage)>totalPageNum){
							n = totalPageNum;
						}
						else{
							n = Integer.parseInt(showPage);
						}
					}
					List list = dd.getData(n);
					request.setAttribute("showPage", new Integer(n));
					request.setAttribute("totalPageNum", new Integer(totalPageNum));
					request.setAttribute("dataList", list);	
					request.getRequestDispatcher("/AdminStuff/ManageBM/getBMTable.jsp").forward(request, response);	
				} catch (Exception e) {
					e.printStackTrace();
				}
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
