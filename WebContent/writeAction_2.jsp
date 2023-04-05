<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO_2" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsName" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsCountry" />
<jsp:setProperty name="bbs" property="bbsMemo" />
<jsp:setProperty name="bbs" property="bbsFileName" />


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%
		String userID=null;
		int result=0;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
		}
	    
		if(bbs.getBbsTitle() == null || bbs.getBbsCountry()== null || bbs.getBbsMemo() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{	
			BbsDAO_2 bbsDAO_2 = new BbsDAO_2();
			if(bbs.getBbsFileName()!= null)
			{
				result = bbsDAO_2.write(userID, bbs.getBbsCountry(), bbs.getBbsTitle(), bbs.getBbsMemo(), bbs.getBbsFileName(), 0);
			}
			else
			{
				result = bbsDAO_2.write(userID, bbs.getBbsCountry(), bbs.getBbsTitle(), bbs.getBbsMemo(), 0);
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
				script.println("location.href = 'trap_board_list_2.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>