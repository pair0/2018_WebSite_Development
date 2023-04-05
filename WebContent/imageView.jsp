<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.ABbsDAO" %>
<%@ page import="bbs.ABbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 테스트</title>
</head>

<body>
	
	<%
		int imageId=1;
		if(request.getParameter("imageId") != null)
		{
			imageId = Integer.parseInt(request.getParameter("imageId"));
		}
		ABbsDAO bbsDAO = new ABbsDAO();	
	%>
	<%
	ABbsDAO AbbsDAO = new ABbsDAO();
	int result = bbsDAO.update1(imageId);
	if( result == -1)
	{
		PrintWriter script=response.getWriter();
	}
	else 
	{
		PrintWriter script=response.getWriter();
	}	
	%>
	
	<div class="container">
		<h3 align="center">이미지 보기</h3>
		<table class="table table-hover">
			<tbody>
				<%
				
					ABbs list = bbsDAO.getBbs(imageId);
				%>
				<tr>
					<td><%= list.getImageId() %></td>
				</tr>
				<tr>
					<td><%= list.getSampleText().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
				</tr>
				<tr>
					<td><img src="imageRead.jsp?imageId=<%=list.getImageId()%>" onerror="this.src='no_img.jpg'" > </td>
				</tr>
				<tr>
					<td><%= list.getImageAvailable() %></td>
				</tr>
			</tbody>		
		</table>
	</div>
	<a href="image_main.jsp" class="btn btn-primary">목록</a>
	<a href="imageUpdate.jsp?imageId=<%=list.getImageId() %>" class="btn btn-primary">수정</a>
	<a onClick="return confirm('정말로 삭제하겠습니까?')" href="imageDeleteAction.jsp?imageId=<%=list.getImageId() %>" class="btn btn-primary">삭제</a>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>