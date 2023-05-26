<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*"%>
<%
TeacherDao teacherDao = new TeacherDao();

if (request.getParameter("teacherNo") != null){
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	int row = teacherDao.deleteTeacher(teacherNo); 
}
response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>