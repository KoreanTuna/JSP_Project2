<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.bin.PoketmonDAO, com.example.bin.PoketmonVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	PoketmonDAO poketmonDAO = new PoketmonDAO();
	List<PoketmonVO> list = poketmonDAO.getPoketmonList();
	request.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<%--	<link rel="stylesheet" href="./css/poketmon.css">--%>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>포켓몬 도감</title>
<style>
	@import url("./css/poketmon.css");

</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>포켓몬도감</h1>
<table id="list" width="90%">
<tr>
	<th>사진</th>
	<th>포켓몬번호</th>
	<th>이름</th>>
	<th>타입</th>
	<th>특성</th>
	<th>분류</th>
	<th>포획률</th>

	<th>키</th>
	<th>몸무게</th>
	<th>친밀도</th>

	<th>도감정보</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td><img src="${pageContext.request.contextPath}/upload/${u.photo}" class="photo" alt="no Image"></td>
		<td>${u.pnumber}</td>
		<td>${u.pname}</td>
		<td>${u.type}</td>
		<td>${u.spcial}</td>
		<td>${u.pclass}</td>
		<td>${u.catch_rate}</td>
		<td>${u.height}</td>
		<td>${u.weight}</td>
		<td>${u.familiar}</td>
		<td>${u.detail}</td>
		<td><a href="editform.jsp?id=${u.pid}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.pid}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Post</a>
</body>
</html>