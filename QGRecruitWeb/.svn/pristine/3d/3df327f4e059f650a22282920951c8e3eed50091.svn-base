package com.qg.resourceServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.BLL.*;

/**
 * Servlet implementation class DeleteResServlet
 */
@WebServlet("/DeleteResServlet")
public class DeleteResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteResServlet() {
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
		String resId=request.getParameter("ResId");
		PrintWriter out=response.getWriter();
		//System.out.println("testId="+testId);
		String filepath = request.getRealPath("/");// + "test/";
		String filename = new String(request.getParameter("ResPath").getBytes(
				"ISO8859-1"), "utf-8").toString();
	    java.io.File file = new java.io.File(filepath + filename);
	    //删除存放在项目中对应的文件
	    if(file.exists()){
	    	file.delete();
	    }
		if(resId=="" || resId.equals(null)){
			out.println("<script>alert('没有获得资料编号！');</script>");
		}else{
			ResourceBll bll=new ResourceBll();
			int result=bll.deleteResInfoById(resId);//删除数据表中的记录
			if(result!=0){
				RequestDispatcher rd=request.getRequestDispatcher("ViewAllResServlet");
				rd.forward(request, response);
			}else{
				out.println("<script>alert('删除失败！');</script>");
			}
		}
	}

}
