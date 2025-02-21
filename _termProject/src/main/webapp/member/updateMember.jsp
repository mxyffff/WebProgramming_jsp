<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
	<link rel="stylesheet" href="style.css">
</head>

<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>

<jsp:setProperty property="*" name="bean"/>
<%
	request.setCharacterEncoding("utf-8");

    String pwd = bean.getPwd();
    String name = bean.getName();
    String birthday = bean.getBirthday();
    String email = bean.getEmail();

    bean.setPwd(pwd);
    bean.setName(name);
    bean.setBirthday(birthday);
    bean.setEmail(email);

    boolean result = mMgr.updateMember(bean);
    
    if (result) {
%>
    <p>회원수정 성공!</p>
<%
    } else {
%>
    <p>회원수정 실패!</p>
<%
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