package com.qg.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.Common.ZJDownPageDivide;
import com.qg.model.Admin;

@WebServlet("/ZJManage")
public class ZJManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ZJManageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		Admin ad = null;
		int ad_groupid = 0;
		if(request.getSession().getAttribute("admin") != null){
			ad = (Admin)request.getSession().getAttribute("admin");
			ad_groupid = Integer.parseInt(ad.getAdminGroupId());
		}
		String sqlStr = "SELECT * FROM tb_zj where wr_groupID = ?";
		try {
			ZJDownPageDivide dd = new ZJDownPageDivide(sqlStr,ad_groupid); 
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
			request.setAttribute("ZJList", list);	
			request.getRequestDispatcher("/AdminStuff/ManageZJ/ManageFinishedZJ.jsp").forward(request, response);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
