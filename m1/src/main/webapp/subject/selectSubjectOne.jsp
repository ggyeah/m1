<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="vo.*" %>
<%
SubjectDao subjectDao = new SubjectDao();

Subject subject = new Subject();

if (request.getParameter("subjectNo") != null){
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	subject = subjectDao.selectSubjectOne(subjectNo);
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
              <th></th>
              <td><%=subject.getSubjectNo()%></td>
           </tr>
		 <tr>
		 <tr>
              <th>name</th>
              <td><%=subject.getSubjectName()%></td>
           </tr>
		 <tr>
		 <tr>
              <th>time</th>
              <td><%=subject.getSubjectTime()%></td>
           </tr>
		 <tr>
		 <tr>
              <th>생성일</th>
              <td><%=subject.getCreatedate()%></td>
           </tr>
           <tr>
              <th>수정일</th>
              <td><%=subject.getUpdatedate()%></td>
           </tr>
	</table>

	<div>
		<a href="<%=request.getContextPath()%>/subject/updateSubject.jsp?subjectNo=<%=subject.getSubjectNo()%>">수정</a>
		<a href="<%=request.getContextPath()%>/subject/deleteSubject.jsp?subjectNo=<%=subject.getSubjectNo()%>">삭제</a>
	</div>	
</body>
</html>