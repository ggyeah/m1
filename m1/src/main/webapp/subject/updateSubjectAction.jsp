<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*"%>
<% 
request.setCharacterEncoding("utf-8");

SubjectDao subjectDao = new SubjectDao();
//유효값 검사 
if (request.getParameter("subjectNo")!= null
	&&request.getParameter("subjectName")!= null
	&& request.getParameter("subjectTime") != null) {
	//폼에서 전달된 파라미터 값 가져오기
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));

	
	//입력받은 값으로 Subject 객체 생성
	Subject subject = new Subject();
	subject.setSubjectNo(subjectNo);
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	int row = subjectDao.updateSubject(subject); 
	
	System.out.println(subjectName);
}



response.sendRedirect(request.getContextPath() + "/subject/selectSubjectListByPage.jsp");

%>
