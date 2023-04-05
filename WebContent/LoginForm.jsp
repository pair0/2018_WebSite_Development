<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>로그인</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css1/portfolio-item.css" rel="stylesheet">
    
    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.userID.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.userPassword.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="JoinForm.jsp";
        }
        // 취소 버튼 클릭시 홈 화면으로 이동
        function goHomepageForm() {
            location.href="HomepageForm.jsp";
        }
        //아이디 비밀번호 찾기로 이동
        function goidfind() {
            location.href="idfind.jsp";
        }
    </script>
    
</head>

<body class="bg-dark">
  <div class="container">
  <form id="" name="" method="post" action="loginAction.jsp">
    <div class="card card-5 mx-5 mt-0">
      <div class="card-header">Login</div>
      <div class="card-body">
          <div class="form-group">
            <label for="exampleInputEmail1">ID</label>
            <input class="form-control" name="userID" id="exampleInputEmail1" type="text" aria-describedby="emailHelp" placeholder="ID...">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" name="userPassword" id="exampleInputPassword1" type="password" placeholder="Password...">
          </div>
          <div class="form-group">
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Remember Password</label>
            </div>
          </div>
         <input type="submit" class="btn btn-primary btn-block" value="로그인"/>
        <div class="text-center">
          <a class="d-block small mt-3" href="JoinForm.jsp">회원가입</a>

          <a class="d-block small" href="idfind.jsp">아이디</a>
          <a class="d-block small" href="passwordfind.jsp">/비밀번호 찾기</a>
          <a class="d-block small" href="HomepageForm.jsp">홈페이지</a>
    </div>
  </div>
  </div>
  </form>
  </div>

  

  
  <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
