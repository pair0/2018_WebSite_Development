<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.ABbsDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.ABbs" scope="page" />
<jsp:setProperty name="bbs" property="imageId" />
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
		int imageId=0;
		int result;
		if(request.getParameter("imageId") != null)
		{
			imageId = Integer.parseInt(request.getParameter("imageId"));
		}
			
		
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
			if(bbs.getImageFileName()==null){
				result = bbsDAO.update( imageId, request.getParameter("sampleText"));
			}
			else 
			{
				result = bbsDAO.update( imageId, request.getParameter("sampleText"), request.getParameter("imageFileName") );
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
				script.println("location.href = 'image_main.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>
