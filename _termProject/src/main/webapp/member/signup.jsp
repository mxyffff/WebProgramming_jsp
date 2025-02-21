<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="style.css">
	<title> 회원 가입 </title>
</head>
<body>
<ul>
	<li><a href="main.jsp">홈</a></li>
	<li><a href="signup.jsp">회원가입</a></li>
	<li><a href="membersList.jsp">회원목록보기</a></li>
	<li><a href="update.jsp">회원수정</a></li>
	<li><a href="withdraw.jsp">회원탈퇴</a></li>
</ul>
<div style="position:absolute; left:55px; top:100px;">
	Home > Signup the Membership

	<hr>
	<form action="signup_process.jsp" name="user_info" method="post">
		<fieldset style="width:200px">
			<legend> 회원 가입 </legend><p>
	
			아이디 : <br>
			<input type="text" name="id"><br><br>
		
			비밀번호 : <br> 
			<input type="password" name="pwd"><br><br>
			
			이름 : <br> 
			<input type="text" name="name"><br><br>
			
			생년월일 : <br> 
			<input type="text" name="birthday"><br><br>
			
			이메일 : <br>
			<input type="email" name="email"><br><br>	
			<hr>
			
		<div align="center">
			<input type="submit" value=" 가입하기 "> &nbsp;&nbsp;
			<input type="reset" value=" 다시작성 ">
		</div><br>
		</fieldset>
	</form>
</div>	
</body>
</html>