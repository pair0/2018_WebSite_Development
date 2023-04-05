<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
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
	
		if(user.getUserID() == null || user.getUserPassword() == null ||
			user.getUserName() == null || user.getUserGender() == null
			|| user.getUserEmail1() == null || user.getUserEmail2() == null || user.getUserBirthdayy() == null
			|| user.getUserBirthdaym() == null || user.getUserBirthdayd() == null|| user.getUserPhone() == null 
			|| user.getUserAddress() == null|| user.getUserSurvey() == null)
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항이 모두 입력되지 않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if( result == -1)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if( result == 1)
			{
				session.setAttribute("userID", user.getUserID()); //현재 세션에 userID 세션을 저장하고 image_main.jsp 호출
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href = 'HomepageForm.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>