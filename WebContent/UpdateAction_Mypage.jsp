<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userBirthdayy" />
<jsp:setProperty name="user" property="userBirthdaym" />
<jsp:setProperty name="user" property="userBirthdayd" />
<jsp:setProperty name="user" property="userEmail1" />
<jsp:setProperty name="user" property="userEmail2" />
<jsp:setProperty name="user" property="userPhone" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userSurvey" />


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
			
		UserDAO bbsDAO = new UserDAO();
		
		if(user.getUserID() == null || user.getUserPassword()== null || user.getUserName() == null
				|| user.getUserGender()== null || user.getUserBirthdayy() == null || user.getUserBirthdaym()== null
				|| user.getUserBirthdayd()== null || user.getUserEmail1()== null
				|| user.getUserEmail2()== null || user.getUserPhone() == null || user.getUserAddress()== null
				|| user.getUserSurvey()== null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			
			result = bbsDAO.update(request.getParameter("userID"), request.getParameter("userPassword"), request.getParameter("userName"), request.getParameter("userGender"), request.getParameter("userBirthdayy"), request.getParameter("userBirthdaym"), request.getParameter("userBirthdayd"), request.getParameter("userEmail1"), request.getParameter("userEmail2"), request.getParameter("userPhone"), request.getParameter("userAddress"), request.getParameter("userSurvey"));

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
				script.println("location.href = 'MypageForm.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>
