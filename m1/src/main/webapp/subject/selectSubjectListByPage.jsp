<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%@ page import="java.util.*" %>

<%
	SubjectDao subjectDao = new SubjectDao();

int totalRow = subjectDao.selectSubhectCnt();
//현재페이지
int currentPage = 1;
if (request.getParameter("currentPage") != null){
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
 }

//페이지당 출력할 행의 수
int rowPerPage = 2;
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
    ArrayList<Subject> list = subjectDao.selectSubjectListByPage(beginRow, rowPerPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2 class="text-center">Subject List</h2>
 <a href="<%=request.getContextPath()%>/subject/insertSubject.jsp">강의추가</a>
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
        <td><a href="<%=request.getContextPath()%>/subject/selectSubjectOne.jsp?subjectNo=<%= subject.getSubjectNo()%>"><%= subject.getSubjectName()%></td>
        <td><%= subject.getSubjectTime()%></td>
        <td><%= subject.getUpdatedate()%></td>
        <td><%= subject.getCreatedate()%></td>
    </tr>
    <% } %>
</table>
 <!--   페이징   -->
		
	<% 
   			 if(beginPage > 1) {
 			%>	
		<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp?currentPage=<%=beginPage - pagePerPage%>">이전</a>
   	<%
   			} 
		for(int i = beginPage; i <= endPage; i++){
      		if(i==currentPage){
    %>
       		<span><%=i%></span>
    <%
        	}else{
   	%>  
   		<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp?currentPage=<%=i%>"><%=i%></a>
   	 <% 
      			}
      		} 
     if(endPage < lastPage) {  
  	 %>
		<a href="<%=request.getContextPath()%>/subject/selectSubjectListByPage.jsp?currentPage=<%=beginPage + pagePerPage%>">다음</a>
	 <%
    			}
 	 %>
 		
</body>
</html>