<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*" %>
<%
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">
<form action="<%=request.getContextPath()%>/teacher/insertTeacherAction.jsp" method="post">
<table class="table table-bordered">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="teacherId"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="teacherName"></td>
	</tr>
	<tr>
		<td>연혁</td>
		<td><input type="text" name="teacherHistory"></td>
	</tr>
	<tr>
		<td>
		<button type="submit" class="btn btn-danger"> 추가 </button>
		</td>
	</tr>
</table>
</form>
</body>
</html>