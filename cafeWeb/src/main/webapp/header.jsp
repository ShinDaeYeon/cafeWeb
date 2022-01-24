<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafeWeb.vo.*" %>

<%
	Member m = (Member)session.getAttribute("loginUser");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<header>
	<%if(m == null) {%>
	<div class="container">
		<img src="<%=request.getContextPath()%>/image/vestria.gif" alt="베스트리아 전기">
	</div>
	<div class="loginArea">
			<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a>
			|
			<a href="<%=request.getContextPath()%>/login/join.jsp">회원가입</a>
	</div>
	<%}else{ %>
	<div class="loginArea">
		<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
		|
		<a href="<%=request.getContextPath()%>/login/mypage.jsp">마이페이지</a>
	</div>
	<%} %>
</header>