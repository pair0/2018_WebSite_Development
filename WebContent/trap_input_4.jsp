<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
 <script type="text/javascript">
function gotrapboardlist4() {
            location.href="trap_board_list_4.jsp";
        }
</script>
</head>
<body>
<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null)	
		{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기를 위해서는 로그인 하세요.')");
			script.println("location.href = 'LoginForm.jsp'");
			script.println("</script>");
		}
	%>
<div class="container">
		<div class="row">
<H2>여행 리뷰 글쓰기(남아메리카)</H2>
<HR>
	[<a href=trap_board_list_4.jsp?action=list>게시판 목록으로</a>] <p>
		<form action="writeAction_4.jsp" method="post" >
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
  <tr>
   <tr>
    <th>여행한 나라</th>
    <td><textarea type="text" class="form-control" placeholder="여행한 나라/총 경비" name="bbsCountry" maxlength="20" rows=2 cols=115></textarea></td>
  </tr>
  <tr>
    <th>제 목</th>
    <td><textarea type="text" class="form-control" placeholder="제목" name="bbsTitle" maxlength="100" rows=2 cols=115></textarea></td>
  </tr>
  <tr>
    <th>내 용</th>
    <td><textarea class="form-control" placeholder="글 내용" name="bbsMemo" maxlength="9000" style="height:350px;"></textarea></td>
  </tr>
  <tr>
  	<div class="form-group">        
    <tr><td>파일 첨부</td><td> 
    <label class="checkbox-inline">
    <input type="file" name="bbsFileName"> 
    </label></td></tr>
   </div>
  </tr> 
  <tr>
  </tbody>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소" onclick="gotrapboardlist4()" /></td>
</tr>
</table>
</form>
</div>
</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script> <!--이러한 코드를 만들면 bootstrap을 쓸 수 있다-->
</body>
</html>