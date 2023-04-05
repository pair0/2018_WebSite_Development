<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.ABbsDAO" %>
<%@ page import="bbs.ABbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
	
		int imageId=0;
		if(request.getParameter("imageId") != null)
		{
			imageId = Integer.parseInt(request.getParameter("imageId"));
		}

		ABbs bbs = new ABbsDAO().getBbs(imageId);
		ABbsDAO bbsDAO = new ABbsDAO();
		int result = bbsDAO.delete(imageId);
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href = 'image_main.jsp'");
			script.println("</script>");
		}
	
	%>

</body>
</html>