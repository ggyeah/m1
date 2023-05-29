<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
SubjectDao subjectDao = new SubjectDao();
// 유효값 검사 
if (request.getParameter("subjectName")!= null
	&& request.getParameter("subjectTime") != null) {
	//폼에서 전달된 파라미터 값 가져오기
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));


	int row = subjectDao.insertSubject(subjectName,subjectTime);
}

response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");
%>
