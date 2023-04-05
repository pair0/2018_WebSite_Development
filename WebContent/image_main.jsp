<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.ABbsDAO" %>
<%@ page import="bbs.ABbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>

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
<title>게시판 테스트</title>
</head>

<body>
<!-- username -->
  	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
	%>
<%
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		ABbsDAO bbsDAO = new ABbsDAO();	
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
            <a href="trap_board_list_3.jsp" class="list-group-item">아시아/오세아니아 게시판</a>
            <a href="trap_board_list_5.jsp" class="list-group-item">아프리카 게시판</a>
          </div>
        </div>
        
<div class="col-lg-9">
<hr>
<H2>사진 게시판</H2>
<hr>
	<div class="container">
		<table class="table table-hovor">
			<thead>
				<tr>
					<th>번호</th>
					<th>이미지설명</th>
					<th>이미지</th>
					<th>유효</th>
					<th>조회수</th>
				</tr>	
			</thead>	
			<tbody>
				<%
					ArrayList<ABbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
				%>
				<tr>
					<td><%= list.get(i).getImageId() %></td>
					<td><a href="imageView.jsp?imageId=<%=list.get(i).getImageId()%>"> <%= list.get(i).getSampleText().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> </a></td>
					<td><a href="imageView.jsp?imageId=<%=list.get(i).getImageId()%>"> <img src="imageRead.jsp?imageId=<%=list.get(i).getImageId()%>" width="70" onerror="this.src='no_img.jpg'" > </a></td>
					<td><%= list.get(i).getImageAvailable() %></td>
					<td><%= list.get(i).getImageCount()%></td>
				</tr>
				<%
					}
				%>
			</tbody>		
		</table>
		<%
			if(pageNumber != 1) {
		%>
			<a href="image_main.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arraw-left">이전</a>
		<%
			} 
			if(bbsDAO.nextPage(pageNumber+1)) {
		%>
			<a href="image_main.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-right">다음</a>
		<%
			}
		%>
		<a href="imageWrite.jsp" class="btn btn-primary pull-right">이미지 올리기</a>
</div> 
</div>
</div>
</div>
	<!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>