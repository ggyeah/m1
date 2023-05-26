<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import="java.util.*" %>
<%
TeacherDao teacherDao = new TeacherDao();

int totalRow = teacherDao.selectTeacherCnt();
//현재페이지
int currentPage = 1;
if (request.getParameter("currentPage") != null){
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
 }

//페이지당 출력할 행의 수
int rowPerPage = 5;
// 시작 행번호
int beginRow = (currentPage-1)*rowPerPage;

//하단 페이징 숫자를 나타내는 변수로, 한 번에 표시되는 페이지 숫자의 개수
int pagePerPage = 5;
//시작 페이지
int beginPage = (((currentPage - 1) / pagePerPage) * pagePerPage) + 1;
//마지막 페이지
int endPage = beginPage + pagePerPage - 1;

//총 페이지 수
int lastPage = totalRow/rowPerPage;

//마지막 페이지가 나머지가 0이 아니면 페이지수 1추가
if(totalRow%rowPerPage!=0){
	lastPage++;
}



if(currentPage > lastPage){
	currentPage = lastPage;
}

if(endPage > lastPage){
	endPage = lastPage;
}
ArrayList<HashMap<String, Object>> teacherList = teacherDao.selectTeacherListByPage(beginRow, rowPerPage);

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
 <h2 class="text-center">Teacher List</h2>
 <a href="<%=request.getContextPath()%>/teacher/insertTeacher.jsp">직원추가</a>
<table  class="table table-bordered">
    <tr>
        <th> </th>
        <th>아이디</th>
        <th>이름</th>
        <th>담당과목</th>
    </tr>
    <% for (HashMap<String, Object> t : teacherList) { %>
        <tr>
            <td><%= t.get("teacher_no") %></td>
            <td><%= t.get("teacher_id") %></td>
            <td><a href="<%=request.getContextPath()%>/teacher/selectTeacherOne.jsp?teacherNo=<%= t.get("teacher_no") %>"><%= t.get("teacher_name")%></a></td>
            <td><%= t.get("subject_names") %></td>
        </tr>
    <% } %>
 </table>
 <!--   페이징   -->
		
	<% 
   			 if(beginPage > 1) {
 			%>	
		<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=beginPage - pagePerPage%>">이전</a>
   	<%
   			} 
		for(int i = beginPage; i <= endPage; i++){
      		if(i==currentPage){
    %>
       		<span><%=i%></span>
    <%
        	}else{
   	%>  
   		<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>"><%=i%></a>
   	 <% 
      			}
      		} 
     if(endPage < lastPage) {  
  	 %>
		<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=beginPage + pagePerPage%>">다음</a>
	 <%
    			}
 	 %>
 			

</body>
</html>