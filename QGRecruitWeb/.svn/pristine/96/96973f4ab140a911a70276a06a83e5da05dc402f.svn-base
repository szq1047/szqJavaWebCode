package com.qg.testServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageDecoder;

/**
 * Servlet implementation class DownloadFileServlet
 */
@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");
		 request.setCharacterEncoding("utf-8");
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
	        javax.servlet.ServletOutputStream out = response.getOutputStream();
	        String filepath=request.getRealPath("/");//+ "test/";
	        String filename=new String(request.getParameter("filename").getBytes("ISO8859-1"),"utf-8").toString();
	        System.out.println("DownloadFile filepath:" + filepath);
	        System.out.println("DownloadFile filename:" + filename);
	        java.io.File file = new java.io.File(filepath + filename);
	        if (!file.exists()) {
	         System.out.println(file.getAbsolutePath() + " 文件不存在!");
	            return;
	        }
	        // 读取文件流
	        java.io.FileInputStream fileInputStream = new java.io.FileInputStream(file);
	            // 下载文件
	            // 设置响应头和下载保存的文件名
	            if (filename != null && filename.length() > 0) {
	                response.setContentType("application/x-msdownload");
	                response.setHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes("utf-8"),"ISO8859-1") + "");
	                if (fileInputStream != null) {
	                    int filelen = fileInputStream.available();
	                    //文件太大时内存不能一次读出,要循环
	                    byte a[] = new byte[filelen];
	                    fileInputStream.read(a);
	                    out.write(a);
	                }
	                fileInputStream.close();
	                out.close();
	            }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
		// TODO Auto-generated method stub
		/* response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 4.01 Transitional//EN>");
	        out.println("<HTML>");
	        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
	        out.println("  <BODY>");
	        out.print("    This is ");
	        out.print(this.getClass().getName());
	        out.println(", using the POST method");
	        out.println("  </BODY>");
	        out.println("</HTML>");
	        out.flush();
	        out.close();*/
	}

}
