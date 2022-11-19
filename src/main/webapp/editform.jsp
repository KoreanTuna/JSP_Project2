<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.bin.PoketmonDAO, com.example.bin.PoketmonVO"%>
<%@ page import="com.example.util.PoketmonFileUpload" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>Edit Form</title>
	<style>
		@import url("./css/poketmon.css");
	</style>
</head>
<body>

<%
	PoketmonDAO poketmonDAO = new PoketmonDAO();
	String id = request.getParameter("id");
	PoketmonVO u = poketmonDAO.getPoketmon(Integer.parseInt(id));
%>

<h1>수정하기</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="pid" value="<%=u.getPid() %>"/>
<table>
	<tr><td>포켓몬 번호</td><td><input type="text" name="pnumber" value="<%=u.getPnumber()%>"></td></tr>
	<tr><td>포켓몬 이름 </td><td><input type="text" name="pname" value="<%=u.getPname()%>"></td></tr>
	<tr><td>사진</td><td><input type="file" name="photo" value="<%=u.getPhoto()%>"><c:if test="${u.photo ne ''}"><br><img src="${pageContext.request.contextPath}/upload/<%=u.getPhoto()%>" class ="photo"></c:if></td></tr>
	<tr><td>타입 </td><td><input type="text" name="type" value="<%=u.getType()%>"></td></tr>
	<tr><td>분류</td><td><input type="text" name="pclass" value="<%=u.getPclass()%>"></td></tr>
	<tr><td>특성</td><td><input type="text" name="spcial" value="<%=u.getSpcial()%>"></td></tr>
	<tr><td>포획률</td><td><input type="number" name="catch_rate" value="<%=u.getCatch_rate()%>"></td></tr>

	<tr><td>키</td><td><input type="text" name="height" value="<%=u.getHeight()%>"></td></tr>
	<tr><td>몸무게</td><td><input type="number"step=0.1 name="weight" value="<%=u.getWeight()%>"></td></tr>
	<tr><td>친밀도</td><td><input type="number" name="familiar" value="<%=u.getFamiliar()%>"></td></tr>


	<tr><td>도감설명</td><td><input type="text" name="detail" value="<%=u.getDetail()%>"></td></tr>
	<tr><td colspan="2"><input type="submit" value="Edit Post"/>
	<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>
</body>
</html>