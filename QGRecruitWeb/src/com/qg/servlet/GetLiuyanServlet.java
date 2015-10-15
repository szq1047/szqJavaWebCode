package com.qg.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qg.Common.LiuyanPageDivide;
import com.qg.model.Admin;

@WebServlet("/GetLiuyan")
public class GetLiuyanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	public void service(){}
	
    public GetLiuyanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {	
        	String role = "";
        	if(request.getParameter("role")!=null)
        		role = request.getParameter("role").toString();
        	String sql = "select * from tb_message order by msg_PubDate desc";
        	LiuyanPageDivide pd = new LiuyanPageDivide(sql);
			String showPage = request.getParameter("page");
			int n;
			int totalPageNum = pd.getTotalPageNum();
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
			@SuppressWarnings("rawtypes")
			List list = pd.getData(n);
			if(!role.equals("")&&role.equals("admin")){
				request.setCharacterEncoding("utf-8");
				//Admin ad = null;
				//if(request.getSession().getAttribute("admin") != null)
					Admin ad = (Admin)request.getSession().getAttribute("admin");
				try{
					if(!ad.getAdminTop().equals("1")){
						response.getWriter().println("<script>alert('你没有权限进行此操作！');</script>");
						System.out.println("你没有权限进行此操作！");
						request.setAttribute("message", "你没有权限进行此操作！");
						return;
					}else{
						request.setAttribute("showPage", new Integer(n));
						request.setAttribute("totalPageNum", new Integer(totalPageNum));
						request.setAttribute("dataList", list);	
						request.getRequestDispatcher("/AdminStuff/ManageMsg/getMessage.jsp").forward(request, response);
					}
					}catch (Exception e) {
						e.printStackTrace();
					}					
			}else{
				request.setAttribute("showPage", new Integer(n));
				request.setAttribute("totalPageNum", new Integer(totalPageNum));
				request.setAttribute("dataList", list);	
				request.getRequestDispatcher("/indexStuff/message.jsp").forward(request, response);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
