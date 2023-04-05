<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.mapDAO" %>

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

	<%
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		Bbs bbs = new mapDAO().getBbs(bbsID);
	%>
	
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
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
    
    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-3">
          <h1 class="my-4">게시판</h1>
          <div class="list-group">
            <a href="free_board_list.jsp" class="list-group-item">자유 게시판</a>
            <a href="image_main.jsp" class="list-group-item">사진 게시판</a>
            <a href="trap_board_list.jsp" class="list-group-item">북아메리카 게시판</a>
            <a href="trap_board_list_4.jsp" class="list-group-item">남아메리카 게시판</a>
            <a href="trap_board_list_2.jsp" class="list-group-item">유럽 게시판</a>
            <a href="trap_board_list_3.jsp" class="list-group-item">아시아 게시판</a>
            <a href="trap_board_list_5.jsp" class="list-group-item">아프리카 게시판</a>
          </div>
        </div>
        
	<div class="col-lg-9">
	<hr>
	<H2>게시글</H2>
	<hr>
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">작성자</td>
							<td colspan="2"><%=bbs.getBbsName().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">여행한 나라/총 비용</td>
							<td colspan="2"><%=bbs.getBbsCountry().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">작성일자</td>
							<td colspan="2"><%=bbs.getBbsDate()%></td>
						</tr>
					</tbody>
				</table>
				<a href="MapForm.jsp" class="btn btn-primary">목록</a>
				<%if (userID!=null){ %>
				<%
				if(userID.equals(bbs.getBbsName())==true){
				%>
				<a href="Update_map.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
				<a onClick="return confirm('정말로 삭제하겠습니까?')" href="deleteAction_map.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
				<%} %>
				<%} %>
				
		</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>
