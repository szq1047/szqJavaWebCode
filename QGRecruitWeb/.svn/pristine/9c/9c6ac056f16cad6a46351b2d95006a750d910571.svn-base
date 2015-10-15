package com.qg.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.Common.NewWorkPageDivide;

//
//@WebServlet("/NewWorkManage")
public class NewWorkManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NewWorkManageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String sqlStr = "SELECT * FROM tb_hw";
		try {
			NewWorkPageDivide dd = new NewWorkPageDivide(sqlStr);
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
			request.setAttribute("HWList", list);	
			request.getRequestDispatcher("/AdminStuff/ManageWork/ManageNewWork.jsp").forward(request, response);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
