<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPhone" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID") !=null)
	{
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어 있습니다.')");
		script.println("location.href = 'HomepageForm.jsp'");
		script.println("</script>");
	}
	
	UserDAO userDAO = new UserDAO();
	
	String result = userDAO.IDfind(user.getUserName(), user.getUserPhone());
	
	if( result != null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('아이디:"+result+"')");
		script.println("location.href = 'idfind.jsp'");
		script.println("</script>");
		
	}
	
	else if( result == null)
	{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('회원 정보가 존재하지 않습니다.')");
		script.println("location.href = 'idfind.jsp'");
		script.println("</script>");
	}
	%>

</body>
</html>
