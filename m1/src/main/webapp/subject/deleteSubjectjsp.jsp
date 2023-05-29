<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	//디버깅
	System.out.println(subjectNo+"<- deleteSubjectNoteacherNo");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/subject/deleteSubjectAction.jsp?subjectNo=<%=subjectNo%>" method="post">
<table>
	<tr>
		<th>삭제하시겠습니까?</th>
		<td><button type="submit" class="btn btn-danger"> 삭제 </button></td>
	</tr>
</table>
</form>
</body>
</html>