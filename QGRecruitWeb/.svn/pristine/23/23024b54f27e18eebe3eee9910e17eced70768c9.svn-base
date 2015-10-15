package com.qg.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.UserLoginBll;

/**
 * Servlet implementation class UpdateIsJoinStatusServlet
 */
@WebServlet("/UpdateIsJoinStatusServlet")
public class UpdateIsJoinStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateIsJoinStatusServlet() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		UserLoginBll bll=new UserLoginBll();
		String regId=request.getParameter("regId");
		String sql="update tb_user set isJoin='1' where reg_ID=?";
		Object[] params={Integer.parseInt(regId)};
		int result=bll.updateUserStatus(sql, params);
		if(result!=0){
			request.getRequestDispatcher("ViewPassTestInfoServlet").forward(request, response);
		}else{
			response.getWriter().println("<script>alert('数据更新失败！');</script>");
			return;
		}
	}

}
