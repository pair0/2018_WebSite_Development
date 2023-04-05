<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.ABbsDAO" %>
<%@ page import="bbs.ABbs" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.ABbs" scope="page" />
<jsp:setProperty name="bbs" property="sampleText" />
<jsp:setProperty name="bbs" property="imageFileName" />


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
		ABbsDAO bbsDAO = new ABbsDAO();
		
		if(bbs.getSampleText() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			if(bbs.getImageFileName() != null)
			{
				result = bbsDAO.write( bbs.getSampleText(), bbs.getImageFileName(),0);
			}
			else {
				result = bbsDAO.write( bbs.getSampleText(),0);
			}
			
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
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
		}
	%>
</body>
</html>
