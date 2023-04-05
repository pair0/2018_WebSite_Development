<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.mapDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>여행 가즈아~</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css1/portfolio-item.css" rel="stylesheet">
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
    
<!------ Include the above in your HEAD tag ---------->
    <HR>
<section id="contact">
  <div class="container">
    <div class="well well-sm">
      <h3><strong>세계 지도</strong></h3>
      <HR>
    </div>
	
	<div class="row">
	<center>
        <iframe src="https://www.google.com/maps/embed?pb=!2m10!1m8!1m3!1d3736489.7218514383!2d90.21589792292741!3d23.857125486636733!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1506502314230" width="395%" height="615" frameborder="0" style="border:0" allowfullscreen></iframe>
        </center>
        </div>
        <Hr>
     
	<div class="row">
	<div class="col-md-4">
	<form id="sform" name="sform" action="https://search.naver.com/search.naver" method="get">
          <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header">네이버</h5>
            <div class="card-body">
              <div class="input-group">
                <input id="query" name="query" type="text" title="검색어 입력"  placeholder="여행하고 싶은 나라 검색" maxlength="255" class="input_text" tabindex="1" accesskey="s" style="ime-mode:active;" autocomplete="off" onclick="document.getElementById('fbm').value=1;" value="" />
                <span class="input-group-btn">
                  <button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" onmouseover="this.className='sch_smit over'" onmousedown="this.className='sch_smit down'" onmouseout="this.className='sch_smit'" onclick="clickcr(this,'sch.action','','',event);"><span class="blind">검색</span><span class="ico_search_submit"></span></button>
                </span>
              </div>
            </div>
          </div>
         </form>
         </div>
     <div class="col-md-7">
	<div class="container">
		<table class="table table-hovor">
		<br>
			<thead>
				<th>번호</th>
				<th>작성자</th>
				<th>여행하고 싶은 나라</th>
				<th>작성일</th>
				</thead>
				<tbody>
				<%
					mapDAO bbsDAO = new mapDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i< list.size(); i++){
						if (userID!=null){
						if(userID.equals(list.get(i).getBbsName())==true) {
					
				%>
				<tr>
					<td><a href="view_map.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= -(i-list.size()) %> </a></td>
					<td><a href="view_map.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsName().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></a></td>
					<td><%= list.get(i).getBbsCountry().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
					<td><%= list.get(i).getBbsDate().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>")%></td>
				</tr>
				<%
						}
						}
					}
				%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {
			%>
				<a href="MapForm.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} 
				if(bbsDAO.nextPage(pageNumber+1)) {
			%>
				<a href="MapForm.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-success btn-arraw-right">다음</a>
			<%
				}
			%>
			<a href="map_input.jsp" class="btn btn-primary pull-right">메모</a>
			<br>
			<이 메모장은 자신한테만 보입니다.>
</div> 
</div>
</div>
</div>    
</section>

 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
