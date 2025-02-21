<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="style.css">
</head>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userID");

	if (id != null && !id.isEmpty()) {
		bean = mMgr.getMember(id);
	} else {
		bean = null;
	}
	
	if (bean == null) {
		out.println("회원 정보 읽어오기 실패!");
	}else{
		
%>	
	<ul>
		<li><a href="main.jsp">홈</a></li>	
		<li><a href="signup.jsp">회원가입</a></li>
		<li><a href="membersList.jsp">회원목록보기</a></li>
		<li><a href="update.jsp">회원수정</a></li>
		<li><a href="withdraw.jsp">회원탈퇴</a></li>
	</ul>
	<div style="position:absolute; left:55px; top:100px;">
		Home > Member Info
		<hr> 
		<form action="updateMember.jsp" method="post">
		<table border=1>
			<tr><td>아이디</td><td><input type=text name=id value=<%=bean.getId() %> readonly></td></tr>
			<tr><td>비밀번호</td><td><input type=text name=pwd value=<%=bean.getPwd() %>></td></tr>
			<tr><td>이름</td><td><input type=text name=name value=<%=bean.getName() %>></td></tr>
			<tr><td>생년월일</td><td><input type=text name=birthday value=<%=bean.getBirthday() %>></td></tr>
			<tr><td>이메일</td><td><input type=text name=email value=<%=bean.getEmail() %>></td></tr>
		</table><br>
		<input type=submit value=수정하기>
		</form>
	</div>
<%	
	}
%>




</html>
