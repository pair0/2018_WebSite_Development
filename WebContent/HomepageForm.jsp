<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <script type="text/javascript">
    
        function goLoginForm()
        {
        	location.href="LoginForm.jsp";
        }
        
        function goJoinForm() {
            location.href="JoinForm.jsp";
        }
        function gologout(){
        	location.href="logoutAction.jsp";
        }
        function goMypage(){
        	location.href="MypageForm.jsp";
        }
    </script>
    
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
      <!-- Portfolio Item Heading -->
      <h1 class="my-4">Page Heading
        <small>Secondary Text</small>
      </h1>
      
      <!-- Portfolio Item Row -->
      <div class="row">
        <div class="col-md-8">
        <a href="trap_board_list.jsp">
           <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">      
                <img class="d-block img-fluid" src="images_700x500/USA_5.jpg" alt="First slide">               
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images_700x500/USA_2.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images_700x500/USA_4.jpg" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="images_700x500/USA_3.jpg" alt="Fourth slide">
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
          </a>
        </div>
        
        <div class="col-md-4">
        <h3 class="my-3">
        <%
			if( userID != null) {
		%>
			<div class="card my-4">
            <h5 class="card-header"><font color="blue"><%= userID %></font> 님 로그인되었습니다.</h5>
            <div class="card-body">
              <div class="input-group">
                <span class="input-group-btn">
                  <button style="width:150px;" class="btn btn-default btn-sm" onclick="gologout();" >로그아웃</button>
                  <button style="width:150px;" class="btn btn-default btn-sm" onclick="goMypage();">마이페이지</button>
                </span>
              </div>  
              </div>
              </div>
		<%
			}
			else {
		%>
		<div class="card my-4">
            <h5 class="card-header">로그인이 필요합니다.</h5>
            <div class="card-body">
              <div class="input-group">
                <span class="input-group-btn">
                  <button style="width:150px;" class="btn btn-default btn-sm" onclick="goLoginForm();" >로그인</button>
                  <button style="width:150px;" class="btn btn-default btn-sm" onclick="goJoinForm();">회원가입</button>
                </span>
              </div>  
              </div>
              </div>
		<%
			}
		%>
		
		<h3></h3>
          <h3 class="my-3">북아메리카</h3>
          <p>북아메리카 대륙과 그에 딸린 많은 섬들로 구성되어 있다. 북아메리카 대륙은 대체로 멕시코 남부를 가로지르는 테우안테펙 지협(地峽)을 남쪽 한계로 하고 있으며, 그 이남을 중앙아메리카로서 구별한다. 그러나 경우에 따라서는 중앙아메리카와 그 동쪽에 가로 놓인 서인도제도를 북아메리카에 포함해서 다루는 경우도 있다. </p>
          <h3 class="my-3">여행 지역</h3>
          <ul>
            <li>유럽</li>
            <li>아시아/오세아니아</li>
            <li>남아메리카</li>
            <li>아프리카</li>
          </ul>
          </h3>
        </div>
      </div>

      <!-- /.row -->
      <!-- Related Projects Row -->
      <h3 class="my-4">Related Projects</h3>
      <div class="row">
        <div class="col-md-3 col-sm-6 mb-4">
          <a href="HomepageForm_2.jsp">
            <img class="img-fluid" src="images_500x300/유럽2.jpg" alt="">
          </a>
        </div>
        <div class="col-md-3 col-sm-6 mb-4">
          <a href="HomepageForm_3.jsp">
            <img class="img-fluid" src="images_500x300/아시아4.jpg" alt="">
          </a>
        </div>
        <div class="col-md-3 col-sm-6 mb-4">
          <a href="HomepageForm_4.jsp">
            <img class="img-fluid" src="images_500x300/남아메리카3.jpg" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="HomepageForm_5.jsp">
            <img class="img-fluid" src="images_500x300/아프리카1.jpg" alt="">
          </a>
        </div>
      </div>
      
      <!-- /.row -->
    </div>
    <!-- /.container -->
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>