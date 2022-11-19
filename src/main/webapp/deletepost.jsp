<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.bin.PoketmonDAO, com.example.bin.PoketmonVO"%>
<%@ page import="com.example.util.PoketmonFileUpload" %>

<%
	String pid = request.getParameter("id");
	if (pid != ""){
		int id = Integer.parseInt(pid);
		PoketmonVO u = new PoketmonVO();
		u.setPid(id);
		PoketmonDAO poketmonDAO = new PoketmonDAO();
		String filename = poketmonDAO.getPhotoFilename(id);
		if(filename != null) PoketmonFileUpload.deleteFile(request, filename);
 		poketmonDAO.deletePoketmon(u);
	}
	response.sendRedirect("posts.jsp");
%>