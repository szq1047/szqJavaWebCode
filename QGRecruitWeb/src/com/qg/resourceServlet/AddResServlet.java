package com.qg.resourceServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.*;
import com.qg.model.*;

/**
 * Servlet implementation class AddResServlet
 */
@WebServlet("/AddResServlet")
public class AddResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddResServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		Admin admin=new Admin();
		admin=(Admin)request.getSession().getAttribute("admin");
		String infoTitle=request.getParameter("InfoTitle").toString();
		int adminId=admin.getAdminId();
		String adminName=request.getSession().getAttribute("adminName").toString();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String now=format.format(new Date());
		String groupId=admin.getAdminGroupId();
		String path=request.getParameter("filepath1");
		System.out.println("infoTitle="+infoTitle+",adminId="+adminId+",adminName="+adminName+",now="+now+",groupId="+groupId+",path="+path);
		Resource res=new Resource();
		try {
			ResourceBll bll=new ResourceBll();
			res.setInfoTitle(infoTitle);
			res.setAdminId(adminId);
			res.setAdminName(adminName);
			res.setInfoPubDate(now);
			res.setInPath("information/"+path);
			res.setInfoGroupId(groupId);
			int result=bll.AddResInfo(res);
			if(result!=0){
				RequestDispatcher rd=request.getRequestDispatcher("ViewAllResServlet");
				rd.forward(request, response);
			}else{
				response.getWriter().println("<script>alert('添加失败！');</script>");
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().println("<script>alert('添加失败！');</script>");
		}
		
	}

}
