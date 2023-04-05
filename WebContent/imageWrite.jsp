<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
 <script type="text/javascript">
function gotrapboardlist2() {
            location.href="image_main.jsp";
        }
 </script>
</head>
<body>
  <div class="container">
		<div class="row">
<H2>사진 게시판 글쓰기</H2>
	<HR>
	[<a href=image_main.jsp?action=list>게시판 목록으로</a>] <p>
		<form action="imageWriteAction.jsp" method="post" >
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
  <tr>
   <tr>
                    <td>이미지 설명 : </td>
                     <td><textarea class="form-control" placeholder="이미지 설명" name="sampleText" maxlength="9000" style="height:350px;"></textarea></td>
                </tr>
                <tr>
                    <td>Photo : </td>
                    <td><input type="file" name="imageFileName" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="저장">
                    </td>
                </tr>
            </table>
        </form>
    </center>
    </div>
</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.js"></script> <!--이러한 코드를 만들면 bootstrap을 쓸 수 있다-->
</body>
</html>