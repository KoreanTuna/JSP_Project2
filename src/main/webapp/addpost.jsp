<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.bin.PoketmonDAO"%>
<%@ page import="com.example.util.PoketmonFileUpload" %>
<%@ page import="com.example.bin.PoketmonVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.bin.PoketmonVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	request.setCharacterEncoding("utf-8");
	PoketmonDAO poketmonDAO = new PoketmonDAO();

	PoketmonFileUpload fileUpload = new PoketmonFileUpload();
	PoketmonVO u = fileUpload.uploadPhoto(request);

	int i = poketmonDAO.insertPoketmon(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>