<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO_2" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
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

<title>여행 리뷰 게시판(유럽)</title>
</head>
<body>
<%
		int pageNumber=1;
		if(request.getParameter("pageNumber") != null)
		{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
%>
<!-- username -->
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
              	<a class="dropdown-item" href="free_board_list.jsp">자유 게이판</a>
                <a class="dropdown-item" href="image_main.jsp">사진 게이판</a>
                <a class="dropdown-item" href="trap_board_list.jsp">북아메리카 게이판</a>
                <a class="dropdown-item" href="trap_board_list_4.jsp">남아메리카 게이판</a>
                <a class="dropdown-item" href="trap_board_list_2.jsp">유럽 게이판</a>
                <a class="dropdown-item" href="trap_board_list_3.jsp">아시아/오세아니아 게이판</a>
                <a class="dropdown-item" href="trap_board_list_5.jsp">아프리카 게이판</a>
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
                <a class="dropdown-item" href="https://www.airbusan.com/content/individual/">에어 붓싼</a>
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
<H2>여행 리뷰 게시판(유럽)</H2>
<hr>

		<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">      
                <img class="d-block img-fluid" src="images_900x500/유럽2.jpg" alt="First slide">               
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images_900x500/유럽4.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images_900x500/유럽3.jpg" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images_900x500/유럽1.jpg" alt="Fourth slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
              </a>
            </div>
	
 <div class="row">
<hr>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<th>번호</th>
				<th>작성자</th>
				<th>여행한 나라</th>
				<th>제목</th>
				<th>내룡</th>
				<th>작성이</th>
				<th>조회수</th>
				</thead>
				<tbody>
				<%
					BbsDAO_2 bbsDAO = new BbsDAO_2();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
					
				%>
				<tr>
					<td><a href="view_2.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsID()+2 %> </a></td>
					<td><a href="view_2.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsName().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></a></td>
					<td><%= list.get(i).getBbsCountry().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
					<td><%= list.get(i).getBbsTitle().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></td>
					<td><%= list.get(i).getBbsMemo().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
					<td><%= list.get(i).getBbsDate().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
					<td><%= list.get(i).getBbsCount()%></td>
				</tr>
				<%
					}
				%>
				</tbody>
			</table>
			
			
			<div class="row">
			<div class="col-md-6">
			<a href="trap_input_2.jsp" class="btn btn-primary pull-right">글쓰기</a>
			<%
				if(pageNumber != 1) {
			%>
				<a href="trap_board_list_2.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} 
				if(bbsDAO.nextPage(pageNumber+1)) {
			%>
				<a href="trap_board_list_2.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-right">다음</a>
			<%
				}
			%>
			</div>
			
			
			<div class="col-md-6">
			<form method="post" action="trap_board_list_2-1.jsp">
			<div class="input-group">
			<select name="bbsSearchoption">  
                            <option>여행한 나라</option>
                            <option>작성자</option>
                            <option>제목</option>
                            <option>내용</option>
                        </select>
              <input class="form-control" type="text" name="bbsSearch" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="submit">확인
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
            </form>
			</div>
			</div>

</div> 
</div>
</div>
	 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>