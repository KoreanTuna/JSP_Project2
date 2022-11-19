<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="./css/poketmon.css">

    <title>포켓몬 추가 페이지</title>
    <style>
        @import url("./css/poketmon.css");
    </style>
</head>
<body>

<h1>포켓몬 추가하기</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr><td>포켓몬사진 : </td><td><input type="file" name="photo"></td></tr>
        <tr><td>포켓몬번호 : </td><td><input type="text" name="pnumber"></td></tr>
        <tr><td>이름 : </td><td><input type="text" name="pname"></td></tr>
        <tr><td>타입 :</td><td><input type="text" name="type"></td></tr>
        <tr><td>분류 :</td><td><input type="text" name="pclass"></td></tr>
        <tr><td>특성</td><td><input type="text" name="spcial"></td></tr>
        <tr><td>포획률 :</td><td><input type="number" step=0.1 name="catch_rate"></td></tr>
        <tr><td>키 :</td><td><input type="text" name="height"></td></tr>
        <tr><td>몸무게 :</td><td><input type="number" name="weight"></td></tr>
        <tr><td>친밀도 :</td><td><input type="number" name="familiar"></td></tr>
        <tr><td>도감설명 :</td><td><input type="text" name="detail"></td></tr>
        <td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
    </table>
</form>
</body>
</html>
