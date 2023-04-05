<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.comDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
 <script type="text/javascript">
 function gotrapboardlist() {
     location.href="trap_board_list_5.jsp";
 }
 </script>
<title>게시판 테스트</title>
</head>

<body>
	
	<%
		int bsID=1;
		if(request.getParameter("bsID") != null)
		{
			bsID = Integer.parseInt(request.getParameter("bsID"));
		}
		int bbsID=0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		comDAO comDAO = new comDAO();	
	%>
	<div class="container">
		<div class="row">
		<form method="post" action="UpdateAction_com_5.jsp?bbsID=<%=bbsID%>&bsID=<%=bsID%>">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">댓글 수정</th>
						</tr>
					</thead>
				<tbody>
				<%
				
					Bbs list = comDAO.getBbs(bbsID);
				%>
                <tr>
					<th>댓 글</th>
    				 <td><textarea type="text" class="form-control" placeholder="댓 글" name="bbsMemo" maxlength="80" rows=2 cols=85></textarea></td>
 				 </tr>
             		<tr>
			</tbody>
			<td colspan=2 align=center><input type=submit class="btn btn-primary" value="저장"><input type=reset value="취소" class="btn btn-primary" onclick="gotrapboardlist()" /></td>
			</tr>
		</table>
		</form>
	</div>
	</div>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script> <!--이러한 코드를 만들면 bootstrap을 쓸 수 있다-->
</body>
</html>