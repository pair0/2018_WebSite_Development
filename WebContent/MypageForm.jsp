<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
      <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css1/portfolio-item.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
		User bbs = new UserDAO().getBbs(userID);
	%>
	 <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="HomepageForm.jsp">여행 가즈아~</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="HomepageForm.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	 게시판
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              	<a class="dropdown-item" href="free_board_list.jsp">자유 게시판</a>
                <a class="dropdown-item" href="image_main.jsp">사진 게시판</a>
                <a class="dropdown-item" href="trap_board_list.jsp">북아메리카 게시판</a>
                <a class="dropdown-item" href="trap_board_list_4.jsp">남아메리카 게시판</a>
                <a class="dropdown-item" href="trap_board_list_2.jsp">유럽 게시판</a>
                <a class="dropdown-item" href="trap_board_list_3.jsp">아시아/오세아니아 게시판</a>
                <a class="dropdown-item" href="trap_board_list_5.jsp">아프리카 게시판</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="MapForm.jsp">세계지도</a>
            </li>
           <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	 비행기표 예매
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="https://kr.koreanair.com/korea/ko.html">대한 항공</a>
              	<a class="dropdown-item" href="http://flyasiana.com/CW/ko/common/main.do">아시아나 항공</a>
              	<a class="dropdown-item" href="https://flyairseoul.com/CW/ko/main.do">에어 서울</a>
                <a class="dropdown-item" href="https://www.airbusan.com/content/individual/">에어 부산</a>
                <a class="dropdown-item" href="https://www.jinair.com/booking/index">진 에어</a>
              </div>
            </li>
             <li class="nav-item">
             <%
			if( userID == null) {
			%>
              <a class="nav-link" href="LoginForm.jsp">로그인</a>
              <%}else{ %>
              <a class="nav-link" href="logoutAction.jsp">로그아웃</a>
              <%} %>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	
<div id="container"style="margin-top:100px;">
  <div class="container">
    <center>
    
    <table border="1" width="1000"  height="600">
     <tr><td align = "middle">
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">마이페이지</font></b>
        <br><br><br>
        
        
            <table>
                <tr>
                    <td id="title">아이디 : </td>
                    <td>
                       <%=bbs.getUserID().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호 : </td>
                    <td>
                        <%=bbs.getUserPassword().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">이름 : </td>
                    <td>
                        <%=bbs.getUserName().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별 : </td>
                    <td>
                        <%=bbs.getUserGender().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생년월일 : </td>
                    <td>
                        <%=bbs.getUserBirthdayy().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>년 <%=bbs.getUserBirthdaym().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>월<%=bbs.getUserBirthdayd().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>일
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일 : </td>
                    <td>
                       <%=bbs.getUserEmail1().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>@<%=bbs.getUserEmail2().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화 : </td>
                    <td>
                        <%=bbs.getUserPhone().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">주소 : </td>
                    <td>
                        <%=bbs.getUserAddress().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
                <tr>
                    <td id="title">설문조사 : </td>
                    <td>
                        <%=bbs.getUserSurvey().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>
                    </td>
                </tr>
            </table>
            <br>
            <a href="Update_Mypage.jsp?bbsID=<%=userID%>" class="btn btn-primary">회원수정</a>
			<a onClick="return confirm('정말로 탈퇴하겠습니까?')" href="deleteAction_Mypage.jsp?bbsID=<%=userID%>" class="btn btn-primary">회원탈퇴</a>
			<a href="HomepageForm.jsp" class="btn btn-primary">홈페이지</a>
</div>
</td>
</tr>
</table>
</center>
</div>
</div>
<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>