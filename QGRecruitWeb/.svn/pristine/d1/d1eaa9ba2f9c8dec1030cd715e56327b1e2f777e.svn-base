package com.qg.testServlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 获取WebRoot下upload文件夹在磁盘上的绝对路径
		String path = request.getSession().getServletContext()
				.getRealPath("/test/");

		System.out.println("上传路径是 :" + path);
		// 设置当上传文件大小超过默认直接写到硬盘大小(该大小由DiskFileItemFactory对象的setSizeThrehold()指定大小)时的缓存的路径
		factory.setRepository(new File(path));
		factory.setSizeThreshold(1024 * 1024);

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		String fileName="";
		try {

			List<FileItem> list = upload.parseRequest(request);

			for (FileItem fileItem : list) {
				// 获取表单域的名字<input type = "XXX" name = "XXX">中的第二个XXX值
				String name = fileItem.getFieldName();
				
				if (fileItem.isFormField()) {// 是一个表单文本域，不是上传的文件

					String value = fileItem.getString("utf-8");
					request.setAttribute(name, value);
				} else {// 上传的文件
					//获取上传文件的名字，不包括路径;只是文件名
					String value = fileItem.getName();
					int start = value.lastIndexOf("\\");
					//在用户上传的实际文件名前加上当前系统时间毫秒数
					fileName = System.currentTimeMillis() + value.substring(start + 1);
					
					// 将文件写入磁盘
					fileItem.write(new File(path, fileName));
					System.out.println(fileName + "文件上传成功");
				}
			}
		} catch (Exception e) {
			out.write("fail");
			e.printStackTrace();
		}
		out.write(fileName);
	}
}
