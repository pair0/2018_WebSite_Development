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
function gotrapboardlist2() {
            location.href="MapForm.jsp";
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
<H2>메모</H2>
	<HR>
	[<a href=MapForm.jsp?action=list>게시판 목록으로</a>] <p>
		<form action="writeAction_map.jsp" method="post" >
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
  <tr>
   <tr>
    <th>여행하고 싶은 나라</th>
    <td><textarea type="text" class="form-control" placeholder="여행하고 싶은 나라" name="bbsCountry" maxlength="20" rows=2 cols=115></textarea></td>
  </tr> 
  <tr>
  </tbody>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소" onclick="gotrapboardlist2()" /></td>
</table>
</form>
</div>
</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script> <!--이러한 코드를 만들면 bootstrap을 쓸 수 있다-->
</body>
</html>