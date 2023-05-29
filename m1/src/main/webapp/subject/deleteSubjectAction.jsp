<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*"%>
<%
SubjectDao subjectDao = new SubjectDao();

if (request.getParameter("subjectNo") != null){
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	int row = subjectDao.deleteSubject(subjectNo); 
}

response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
%>