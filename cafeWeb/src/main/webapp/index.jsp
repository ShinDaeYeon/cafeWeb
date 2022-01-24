<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafeWeb.vo.*"%>
<%
	Member login = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트리아 전기 신미네르바</title>
<link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
<script>
	function goMember(){
		var login = "<%=login%>";
		
		if(login == null){
			alert("로그인후 이용하세요")
		}else{
			location.herf="member/list/jsp";
		}
	}
</script>
</head>
<body>
//
	<%@ include file="header.jsp" %>
	<p class="img01">
		<img src="<%=request.getContextPath()%>/image/vestria2.jpg" alt="베스트리아 전기">
	</p>
	<p class="img02">
		<img src="<%=request.getContextPath()%>/image/vestria.jpg" alt="베스트리아 전기">
	</p>
	<%if(login != null){ %>
		<h2><%=login.getNickname()%>님 어서오세요.</h2>
	<%}else{ %>
		<h2>방문자님 환영합니다.</h2>
	<%} %>
	<section>
		<a href="board/list.jsp">카페게시판으로</a>
		|
	<%if(login != null){ %>
		<a href="javascript:goMember()">길드원목록으로</a>
		|
	<%} %>
		<a href="https://open.kakao.com/o/gwFiQYBd">가입문의방</a>
		|
		<a href="https://open.kakao.com/o/gHXyHiGd">수다방</a>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>