package com.qg.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.model.*;
import com.qg.BLL.*;

/**
 * Servlet implementation class AddAdminAndUserServlet
 */
@WebServlet("/AddAdminAndUserServlet")
public class AddAdminAndUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdminAndUserServlet() {
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
		String adminId=request.getParameter("adminInfo");
		String[] userIds=request.getParameterValues("userInfo");
		
		AdminAndUser aduser=new AdminAndUser();
		AdminLoginBll adminbll=new AdminLoginBll();
		UserLoginBll userbll=new UserLoginBll();
		Object[] adminparams={Integer.parseInt(adminId)};
		AdminAndUserBll bll=new AdminAndUserBll();
		
		int n=0;
		for(int i=0;i<userIds.length;i++)
		{
			aduser.setAdminId(Integer.parseInt(adminId));
			aduser.setAdminName(adminbll.getAdminNameInfo("select admin_Name from tb_admin where admin_ID=?", adminparams));
			aduser.setUserId(Integer.parseInt(userIds[i]));
			Object[] userparams={Integer.parseInt(userIds[i])};
			aduser.setUserName(userbll.getUserNameInfo("select real_Name from tb_user where reg_ID=?",userparams));
			aduser.setGroupId(Integer.parseInt(admin.getAdminGroupId()));
			int result=bll.AddAdminAndUser(aduser);
			if(result!=0){
				n++;
			}else{
				response.getWriter().println("<script>alert('添加失败！');</script>");
				return;
			}
		}
		if(n==userIds.length){
			request.getRequestDispatcher("ViewAllAllocateServlet").forward(request, response);
		}
	}

}
