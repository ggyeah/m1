<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*"%>
<% 
request.setCharacterEncoding("utf-8");
TeacherDao teacherDao = new TeacherDao();
// 유효값 검사 
if (request.getParameter("teacherNo")!= null
	&& request.getParameter("teacherId")!= null
	&& request.getParameter("teacherName") != null
	&& request.getParameter("teacherHistory")!= null) {
	//폼에서 전달된 파라미터 값 가져오기
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	//입력받은 값으로 Teacher 객체 생성
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	int row = teacherDao.updateTeacher( teacher); 
}



response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>
