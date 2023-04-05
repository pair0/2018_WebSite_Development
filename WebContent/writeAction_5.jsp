<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO_5" %>
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
		int result=0;
		String userID=null;
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
			BbsDAO_5 bbsDAO_5 = new BbsDAO_5();
			if(bbs.getBbsFileName()!= null)
			{
				result = bbsDAO_5.write(userID, bbs.getBbsCountry(), bbs.getBbsTitle(), bbs.getBbsMemo(), bbs.getBbsFileName(), 0);
			}
			else
			{
				result = bbsDAO_5.write(userID, bbs.getBbsCountry(), bbs.getBbsTitle(), bbs.getBbsMemo(), 0);
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
				script.println("location.href = 'trap_board_list_5.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>