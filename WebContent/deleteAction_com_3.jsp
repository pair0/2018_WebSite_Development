<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.comDAO" %>
<%@ page import="bbs.Bbs" %>
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
		int bsID=0;
		if(request.getParameter("bsID") != null)
		{
			bsID = Integer.parseInt(request.getParameter("bsID"));
		}
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		if(bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			response.sendRedirect("view_3.jsp?bbsID="+bsID);
			script.println("</script>");
		}
		Bbs bbs = new comDAO().getBbs(bbsID);
		comDAO comDAO = new comDAO();
		int result = comDAO.delete(bbsID);
		if( result == -1)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('댓글 삭제에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else 
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			response.sendRedirect("view_3.jsp?bbsID="+bsID);
			script.println("</script>");
		}	
	%>

</body>
</html>