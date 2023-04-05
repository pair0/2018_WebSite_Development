<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO_5" %>
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
		int bbsID=1;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		BbsDAO_5 bbsDAO = new BbsDAO_5();	
	%>
	<div class="container">
		<div class="row">
		<form method="post" action="UpdateAction_5.jsp?bbsID=<%=bbsID%>">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정</th>
						</tr>
					</thead>
				<tbody>
				<%
				
					Bbs list = bbsDAO.getBbs(bbsID);
				%>
				<tr>
				<tr>
                    <th>여행한 나라/총 경비</th>
                   <td><textarea type="text" class="form-control" placeholder="여행한 나라/총 경비" name="bbsCountry" maxlength="20" rows=2 cols=115><%= list.getBbsCountry().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> </textarea></td>
                </tr>
                </tr>      
                 <tr>
                    <th>제 목</th>
                     <td><textarea type="text" class="form-control" placeholder="제목" name="bbsTitle" maxlength="100" rows=2 cols=115><%= list.getBbsTitle().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %> </textarea></td>
                </tr>
                <tr>
					<th>내 용</th>
    				 <td><textarea class="form-control" placeholder="글 내용" name="bbsMemo" maxlength="9000" style="height:350px;"><%= list.getBbsMemo().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></textarea></td>
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