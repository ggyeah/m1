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
<form action="<%=request.getContextPath()%>/subject/updateSubjectAction.jsp?subjectNo=<%=subject.getSubjectNo()%>" method="post">
<h2>상세보기</h2>
	<table class="table table-bordered">
		<tr>
              <th></th>
              <td><%=subject.getSubjectNo()%></td>
           </tr>
		 <tr>
		 <tr>
              <th>name</th>
              <td><input type= "text" name = "subjectName" value ="<%=subject.getSubjectName()%>"></td>
           </tr>
		 <tr>
		 <tr>
              <th>time</th>
              <td><input type= "text" name = "subjectTime" value ="<%=subject.getSubjectTime()%>"></td>
           </tr>
		 <tr>
              <th>생성일</th>
              <td><%=subject.getCreatedate()%></td>
           </tr>
           <tr>
              <th>수정일</th>
              <td><%=subject.getUpdatedate()%></td>
           </tr>
	<tr>
		<th>수정하시겠습니까?</th>
		<td><button type="submit" class="btn btn-danger"> 수정</button></td>
	</tr>
</table>
</form>

</body>
</html>