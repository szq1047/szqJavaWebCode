package com.qg.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DownLoadFile")
public class DownloadFileServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		      throws ServletException, IOException {
		
		// 服务器相对路径
		String path = req.getParameter("url");
		// 服务器绝对路径
		path = getServletContext().getRealPath("/") + path;
		// 检查文件是否存在
		File obj = new File(path);
		if (!obj.exists()) {
			res.setContentType("text/html;charset=UTF-8");
		    res.getWriter().print("指定文件不存在！");
		    return;
		}

		// 读取文件名：用于设置客户端保存时指定默认文件名
		int index = path.lastIndexOf("\\"); // 前提：传入的path字符串以“\”表示目录分隔符
		String fileName = path.substring(index+1);

		// 写流文件到前端浏览器
		ServletOutputStream out = res.getOutputStream();
		//解决下载时出现中文文件名显示错误
		res.setContentType("application/x-msdownload");
		res.setHeader("Content-disposition", "attachment;filename=" + new String(fileName.getBytes("utf-8"),"ISO-8859-1"));
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(path));
		    bos = new BufferedOutputStream(out);
		    byte[] buff = new byte[2048];
		    int bytesRead;
		    while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
		        bos.write(buff, 0, bytesRead);
		    }
		}catch (IOException e) {
			throw e;
		} finally {
		    if (bis != null)
		    	bis.close();
		    if (bos != null)
		        bos.close();
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request,response); 
	}
}
