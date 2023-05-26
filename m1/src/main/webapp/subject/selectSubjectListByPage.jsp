<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*" %>

<%
	SubjectDao subjectDao = new SubjectDao();
	 
	int beginRow = 0; // 시작 행
	int rowPerPage = 10; // 페이지당 행 수

    ArrayList<Subject> list = subjectDao.selectSubjectListByPage(beginRow, rowPerPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
    <tr>
        <th>SubjectNo</th>
        <th>SubjectName</th>
        <th>SubjectTime</th>
        <th>수정일자</th>
        <th>생성일자</th>
    </tr>
    <% for (Subject subject : list) { %>
    <tr>
        <td><%= subject.getSubjectNo()%></td>
        <td><%= subject.getSubjectName()%></td>
        <td><%= subject.getSubjectTime()%></td>
        <td><%= subject.getUpdatedate()%></td>
        <td><%= subject.getCreatedate()%></td>
    </tr>
    <% } %>
</table>
</body>
</html>