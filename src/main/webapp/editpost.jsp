<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.bin.PoketmonVO"%>
<%@ page import="com.example.bin.PoketmonDAO" %>
<%@ page import="com.example.util.PoketmonFileUpload" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.bin.PoketmonVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	request.setCharacterEncoding("utf-8");
	PoketmonDAO poketmonDAO = new PoketmonDAO();
	PoketmonFileUpload upload = new PoketmonFileUpload();
	PoketmonVO u = upload.uploadPhoto(request);

	int i = poketmonDAO.updatePoketmon(u);
	String msg = "데이터 수정 성공";
	if(i==0) msg = "[에러] 데이터 수정 실패";
%>
<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>