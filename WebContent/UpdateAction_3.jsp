<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO_3" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsID" />
<jsp:setProperty name="bbs" property="bbsName" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsCountry" />
<jsp:setProperty name="bbs" property="bbsMemo" />
<jsp:setProperty name="bbs" property="bbsFileName" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload to Database Demo</title>
</head>
<body>
	<%
		int result=0;
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
			
		BbsDAO_3 bbsDAO = new BbsDAO_3();
		
		if( request.getParameter("bbsCountry") == null || request.getParameter("bbsTitle") == null || request.getParameter("bbsMemo") == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			if(bbs.getBbsFileName() == null)
			{
				result = bbsDAO.update(bbsID, request.getParameter("bbsCountry"), request.getParameter("bbsTitle"), request.getParameter("bbsMemo"));
			}
			else
			{
				result = bbsDAO.update(bbsID, request.getParameter("bbsCountry"), request.getParameter("bbsTitle"), request.getParameter("bbsMemo"), request.getParameter("bbsFileName"));
			}
			
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else 
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href = 'trap_board_list_3.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>
