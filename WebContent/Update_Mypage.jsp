<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
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
function goMypageForm() {
            location.href="MypageForm.jsp";
        }
function checkValue()
{
	 // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.userInfo.userPassword.value != document.userInfo.userPasswordcheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
}
 </script>
<title>게시판 테스트</title>
</head>

<body>
	
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null)
		{
			userID = (String) session.getAttribute("userID");
			session.setAttribute("userID", userID);
		}
		UserDAO bbsDAO = new UserDAO();
	%>
	
	<div id="container"style="margin-top:100px;">
	
  <div class="container">
    <center>
    
    <table border="1" width="1000"  height="600">
     <tr><td align = "middle">
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">마이페이지 수정</font></b>
        <br><br><br>
        
        
        <form method="post" action="UpdateAction_Mypage.jsp?userID=<%=userID%>" name="userInfo" onsubmit="return checkValue()">
            <table>
            <%
				
					User list = bbsDAO.getBbs(userID);
			%>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text"  placeholder="아이디" name="userID" maxlength="50" value ="<%= list.getUserID().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>"> 
                        <input type="button" value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" placeholder="비밀번호"  name="userPassword" maxlength="50" value ="<%= list.getUserPassword().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>"> 
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="userPasswordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" placeholder="이름" name="userName" maxlength="50" value ="<%= list.getUserName().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                    	<%
                    	if(list.getUserGender().equals("남")){
                    	%>
                        <input type="radio"  name="userGender" value="남" checked>남
                        <input type="radio"  name="userGender" value="여" >여
                        <%
                        }else {
                        %>
                        <input type="radio"  name="userGender" value="남" >남
                        <input type="radio"  name="userGender" value="여" checked>여
                        <%
                        }
                        %>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생년월일</td>
                    <td>
                        <input type="text"  name="userBirthdayy" maxlength="4" placeholder="년(4자)" size="6" value ="<%= list.getUserBirthdayy().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>">
                        <select name="userBirthdaym" >
                            <option value="<%= list.getUserBirthdaym().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>"><%= list.getUserBirthdaym().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="userBirthdayd" maxlength="2" placeholder="일" size="4" value ="<%= list.getUserBirthdayd().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" placeholder="이메일" name="userEmail1" maxlength="50" value ="<%= list.getUserEmail1().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>">@
                        <select name="userEmail2">
                        	<option><%= list.getUserEmail2().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %></option>
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" placeholder="휴대전화" name="userPhone" value ="<%= list.getUserPhone().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>" />
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" placeholder="주소" size="50" name="userAddress" value ="<%= list.getUserAddress().replaceAll("<","&lt").replaceAll(">","&lt").replaceAll(" ","&nbsp").replaceAll("\n","<br>") %>"/>
                    </td>
                </tr>
                
                
          
                <tr>
                	<td id="title">설문조사</td>
                	<td>
                		<%
                    	if(list.getUserSurvey().equals("해외여행 경험이 있다")){
                    	%>
                        <input type="radio" name="userSurvey" value="해외여행 경험이 있다" checked>해외여행 경험이 있다
                        <input type="radio" name="userSurvey" value="해외여행 경험이 없다" >해외여행 경험이 없다
                        <%
                        }else {
                        %>
                        <input type="radio" name="userSurvey" value="해외여행 경험이 있다" >해외여행 경험이 있다
                        <input type="radio" name="userSurvey" value="해외여행 경험이 없다" checked>해외여행 경험이 없다
                        <%
                        }
                        %>
                    </td>
                 </tr> 
            </table>
            <br>
            <input type="submit"  value="수정"/>  
            <input type="button" value="취소" onclick="goMypageForm()">
            </form>
</div>
</td>
</tr>
</table>
</center>
</div>
</div>
</body>
</html>