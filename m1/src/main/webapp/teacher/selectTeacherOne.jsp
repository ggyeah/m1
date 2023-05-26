<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="vo.*" %>
<%
TeacherDao teacherDao = new TeacherDao();

Teacher teacher = new Teacher();

if (request.getParameter("teacherNo") != null){
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	teacher = teacherDao.selectTeacherOne(teacherNo);
 }



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
<h2>상세보기</h2>
	<table class="table table-bordered">
		<tr>
              <th>번호</th>
              <td><%=teacher.getTeacherNo()%></td>
           </tr>
		 <tr>
		 <tr>
              <th>아이디</th>
              <td><%=teacher.getTeacherId()%></td>
           </tr>
		 <tr>
		 <tr>
              <th>이름</th>
              <td><%=teacher.getTeacherName()%></td>
           </tr>
		 <tr>
		<tr>
              <th>히스토리</th>
              <td><%=teacher.getTeacherHistory()%></td>
           </tr>
		 <tr>
              <th>생성일</th>
              <td><%=teacher.getCreatedate()%></td>
           </tr>
           <tr>
              <th>수정일</th>
              <td><%=teacher.getUpdatedate()%></td>
           </tr>
	</table>

	<div>
		<a href="<%=request.getContextPath()%>/teacher/updateTeacher.jsp?teacherNo=<%=teacher.getTeacherNo()%>">수정</a>
		<a href="<%=request.getContextPath()%>/teacher/deleteTeacher.jsp?teacherNo=<%=teacher.getTeacherNo()%>">삭제</a>
	</div>	
</body>
</html>