package com.qg.resourceServlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.*;
import com.qg.model.*;

/**
 * Servlet implementation class ViewAllResServlet
 */
@WebServlet("/ViewAllResServlet")
public class ViewAllResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAllResServlet() {
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
		try {
			ResourceBll bll = new ResourceBll();
			GroupInfoBll groupBll=new GroupInfoBll();
			List<Resource> list = new ArrayList<Resource>();
			List<GroupInfo> grouplist=new ArrayList<GroupInfo>();
			list = bll.getAllResourceInfo();//根据登录管理员的角色，可以查到对应组的试题信息
			//System.out.println("list="+list);
			if(list.isEmpty()){
				//System.out.println("空数据集！");
				response.getWriter().println("<script>alert('没有数据集！')</script>");
				return;
			}
			request.setAttribute("list", list);
			for(int i=0;i<list.size();i++){
				GroupInfo group=new GroupInfo();
				String groupId=list.get(i).getInfoGroupId();
				group=groupBll.getGroupInfoById(groupId);
				grouplist.add(group);
			}
			request.setAttribute("grouplist", grouplist);
			RequestDispatcher rd = request
					.getRequestDispatcher("ViewAllRes.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			// response.getWriter().println("<script>alert('请登录！');</script>");
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
			
		}
		
	}

}
