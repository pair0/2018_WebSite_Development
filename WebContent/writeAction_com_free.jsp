<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO_free" %>
<%@ page import="bbs.comDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> 
<jsp:setProperty name="bbs" property="bbsID" />
<jsp:setProperty name="bbs" property="bbsName" />
<jsp:setProperty name="bbs" property="bbsMemo" />
<jsp:setProperty name="bbs" property="bbsDate" />


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
  
	 int bbsID=0;
 
	  if(request.getParameter("bbsID") != null)
	  {
		  bbsID = Integer.parseInt(request.getParameter("bbsID"));
	  }
  
 	if(userID==null){
   		PrintWriter script=response.getWriter();
   		script.println("<script>");
   		script.println("alert('로그인 후 댓글 작성이 가능합니다.')");
   		script.println("location.href = 'LoginForm.jsp'");
   		script.println("</script>");
   	 }
 	
  	if(bbs.getBbsMemo() == null)
  	{
   		PrintWriter script=response.getWriter();
   		script.println("<script>");
   		script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
   		script.println("history.back()");
   		script.println("</script>");
  	}
  	
  else
  { 
	   comDAO bbsDAO = new comDAO();
	   result = bbsDAO.write(bbsID, 0, 0, 0,userID, bbs.getBbsMemo());
   

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
  	 	 response.sendRedirect("view_free.jsp?bbsID="+bbsID);
  	 }
  }
%>

</body>
</html> 
