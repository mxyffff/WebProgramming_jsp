<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="style.css">
</head>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>

<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mMgr.insertMember(bean);
	if ( result ){
		out.println("회원가입 성공!");
	}
	else { 
		out.println("회원가입 실패!");
	}
%>


<ul>
	<li><a href="main.jsp">MAIN</a></li>
	<li><a href="signup.jsp">회원가입</a></li>
	<li><a href="membersList.jsp">회원목록보기</a></li>
	<li><a href="update.jsp">회원수정</a></li>
	<li><a href="withdraw.jsp">회원탈퇴</a></li>
</ul>

</html>