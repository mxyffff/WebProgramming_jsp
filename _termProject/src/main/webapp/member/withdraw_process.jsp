<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="style.css">
</head>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userID");
	boolean result = mMgr.withdrawMember(id);
	
	if ( result ) {
		out.println("회원 탈퇴 성공!");
	} else{
		out.println("회원 탈퇴 실패!");
	}
%>

<ul>
	<li><a href="main.jsp">홈</a></li>
	<li><a href="signup.jsp">회원가입</a></li>
	<li><a href="membersList.jsp">회원목록보기</a></li>
	<li><a href="update.jsp">회원수정</a></li>
	<li><a href="withdraw.jsp">회원탈퇴</a></li>
</ul>

</html>
