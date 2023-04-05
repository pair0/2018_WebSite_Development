<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.comDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
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
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
		}
		
		comDAO bbsDAO = new comDAO();
		int result = bbsDAO.update2(bbsID);
	   
		PrintWriter script=response.getWriter();
		script.println("<script>");
		response.sendRedirect("view_3.jsp?bbsID="+bsID);
		script.println("</script>");
	%>

</body>
</html>