<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>회원정보출력__자바빈즈</title>
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
	Home > MemberList
	<hr>
	<table border=1 width=500>
		<tr>
		<th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>생년월일</th><th>이메일</th>
		</tr>
	
		<jsp:useBean id="mMgr" class="member.MemberMgr"/>
		<%
			Vector<MemberBean> vlist = mMgr.getMembersList();
			for ( int i = 0; i < vlist.size(); i++ ){
				MemberBean mBean = vlist.get(i);
		%>
			<tr align=center><td><%=i+1 %></td>
			<td><%=mBean.getId() %></td>
			<td><%=mBean.getPwd() %></td>
			<td><%=mBean.getName() %></td>
			<td><%=mBean.getBirthday() %></td>
			<td><%=mBean.getEmail() %></td>			
			</tr>
		<%
			}
		%>
	</table>
</div>
</body>
</html>