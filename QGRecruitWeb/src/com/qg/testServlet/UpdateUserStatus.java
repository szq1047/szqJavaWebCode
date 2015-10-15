package com.qg.testServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qg.BLL.*;

/**
 * Servlet implementation class UpdateUserStatus
 */
@WebServlet("/UpdateUserStatus")
public class UpdateUserStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserStatus() {
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
		String userName=new String(request.getParameter("userName").getBytes("ISO8859-1"),"utf-8");
		UserLoginBll userbll=new UserLoginBll();
		//System.out.println("userName==================="+userName);
		int result=userbll.updateUserStatus(userName);
		if(result!=0){
			request.getRequestDispatcher("ViewAllTestServlet").forward(request, response);
		}else{
			response.getWriter().println("<script>alert('修改失败');</script>");
			return;
		}
		
	}

}
