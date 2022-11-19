<%@ page import="com.example.bin.PoketmonDAO" %>
<%@ page import="com.example.bin.PoketmonVO" %><%--
  Created by IntelliJ IDEA.
  User: minwoo
  Date: 2022/11/19
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>포켓몬 개별 페이지</title>
  <link rel="stylesheet" href="./css/poketmon.css">

</head>
<body>
  <%
    PoketmonDAO poketmonDAO = new PoketmonDAO();
    String id = request.getParameter("id");
    PoketmonVO u = poketmonDAO.getPoketmon(Integer.parseInt(id));
    request.setAttribute("vo", u);
  %>
<h1>포켓몬 정보 보기</h1>
<table id="edit">
  <tr>
    <td>포켓몬 번호</td><td>${vo.pnumber}</td>
  </tr>
  <tr>
    <td>포켓몬 이름 </td><td>${vo.pname}</td>
  </tr>
  <tr>
    <td>사진 </td><td><c:if test="${vo.photo} ne ''"><br/><img src="${pageContext.request.contextPath}/upload/${vo.photo}" class ="photo"></c:if></td>
  </tr>
  <tr>
    <td>타입 </td><td>${vo.type}</td>
  </tr>
  <tr>
    <td>분류</td><td>${vo.pclass}</td>
  </tr>
  <tr>
    <td>포획률</td><td>${vo.catch_rate}</td>
  </tr>
  <tr>
    <td>도감설명</td><td>${vo.detail}</td>
  </tr>

</table>

</body>
</html>
