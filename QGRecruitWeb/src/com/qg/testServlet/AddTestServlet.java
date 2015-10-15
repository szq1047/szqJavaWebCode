package com.qg.testServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.TestInfoBll;
import com.qg.model.*;

/**
 * Servlet implementation class AddTestServlet
 */
@WebServlet("/AddTestServlet")
public class AddTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestServlet() {
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
		String testtypeId=request.getParameter("testTypeID");
		String publisher=request.getSession().getAttribute("adminName").toString();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String now=format.format(new Date());
		String path=request.getParameter("filepath1");
		String groupId=admin.getAdminGroupId();
		//System.out.println("testtypeId="+testtypeId+",publisher="+publisher+",now="+now+",path="+path+",groupId="+groupId);
		TestInfo testInfo=new TestInfo();
		try {
			TestInfoBll bll=new TestInfoBll();
			testInfo.setTesttypeId(Integer.parseInt(testtypeId));
			testInfo.setTestPublisher(publisher);
			testInfo.setTestPubDate(now);
			testInfo.setTestPath("test/"+path);
			testInfo.setTestGroupId(groupId);
			int result=bll.AddTestInfo(testInfo);
			if(result!=0){
				RequestDispatcher rd=request.getRequestDispatcher("ViewAllVoidTestServlet");
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
