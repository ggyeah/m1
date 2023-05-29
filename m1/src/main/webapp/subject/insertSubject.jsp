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
<form action="<%=request.getContextPath()%>/subject/insertSubjectAction.jsp" method="post">
<table class="table table-bordered">
	<tr>
		<td>subjectName</td>
		<td><input type="text" name="subjectName"></td>
	</tr>
	<tr>
		<td>subjectTime</td>
		<td><input type="number" name="subjectTime"></td>
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