package com.qg.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.UserLoginBll;
import com.qg.model.*;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String regname=request.getParameter("regname");
		String stuno=request.getParameter("stuno");
		String realName=request.getParameter("realname");
		String pwd=request.getParameter("pwd");
		String regGender=request.getParameter("sex");
		System.out.println("sex=="+regGender);
		String regBomDate=request.getParameter("date");
		String[] date=regBomDate.split("/");
		String bomDate=date[2]+"-"+date[0]+"-"+date[1];
		String telNumber=request.getParameter("phone");
		String qq=request.getParameter("QQ");
		String eMail=request.getParameter("email");
		String major=request.getParameter("major");
		String college=request.getParameter("colloge");
		String className=request.getParameter("class");
		User model=null;
		UserLoginBll bll=null;
		try {
			model=new User();
			model.setRegName(regname);
			model.setStuId(stuno);
			model.setRealName(realName);
			model.setRegPwd(pwd);
			model.setRegGender(regGender);
			model.setRegBomDate(bomDate);
			model.setTelNumber(telNumber);
			model.setQq(qq);
			model.seteMail(eMail);
			model.setMajor(major);
			model.setCollege(college);
			model.setClassName(className);
			bll=new UserLoginBll();
			if(bll.Add(model)){
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}else{
				request.setAttribute("message", "注册失败！");
				RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
