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
	<div class="container">
		<h3 align="center">이미지 보기</h3>
		<form method="post" action="imageUpdateAction.jsp?imageId=<%=imageId%>">
		<table class="table table-hover">
			<tbody>
				<%
				
					ABbs list = bbsDAO.getBbs(imageId);
				%>
				<tr>
                    <td>이미지 설명 : </td>
                </tr>
                <tr>
                    <td><textarea name="sampleText" cols="80" rows="7"><%= list.getSampleText() %> </textarea></td>
                </tr>
                <tr>
					<td><img src="imageRead.jsp?imageId=<%=list.getImageId()%>" onerror="this.src='no_img.jpg'"> </td>
				</tr>
                <tr>
                    <td>Photo : </td>
                </tr>
                <tr>
                    <td><input type="file" name="imageFileName" size="80"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="btn btn-primary" value="저장">
                        <a href="image_main.jsp" class="btn btn-primary">목록</a>
                    </td>
                </tr>
			</tbody>		
		</table>
		</form>
	</div>
	

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>