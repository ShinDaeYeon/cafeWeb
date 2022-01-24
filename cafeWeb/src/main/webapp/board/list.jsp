<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="cafeWeb.vo.*" %> 
<%@ page import="cafeWeb.util.*" %> 
<%

	Member login = (Member)session.getAttribute("loginUser");


	request.setCharacterEncoding("UTF-8");

	String searchValue = request.getParameter("searchValue");
	String searchType = request.getParameter("searchType");
	
	String nowPage = request.getParameter("nowPage");
	int nowPageI = 1;
	if(nowPage != null){
		nowPageI = Integer.parseInt(nowPage);
	}

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	PagingUtil paging = null;
	
	try{
		conn = DBManager.getConnection();
		
		String sql = "select count(*) as total from boardWeb ";
		if(searchValue != null && !searchValue.equals("") && !searchValue.equals("null")){
			if(searchType.equals("subject")){
				sql += " where subject like '%"+searchValue+"%'";
			}else if(searchType.equals("writer")){
				sql += " where writer = '"+searchValue+"'";
			}
			
		}
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		int total = 0;
		
		if(rs.next()){
			total = rs.getInt("total");
		}
		
		paging = new PagingUtil(total,nowPageI,5);
				
		sql = " select * from ";
		sql += " (select rownum r, b.* from ";		
		sql += " (select * from boardWeb";
		
		if(searchValue != null && !searchValue.equals("") && !searchValue.equals("null")){
			if(searchType.equals("subject")){
				sql += " where subject like '%"+searchValue+"%'";
			}else if(searchType.equals("writer")){
				sql += " where writer = '"+searchValue+"'";
			}
			
		}
		
		sql += " order by bidx desc ) b)";
		sql += " where r>= "+paging.getStart()+" and r <="+paging.getEnd();
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		
		
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="/header.jsp" %>
	<section>
		<h2>게시글 목록</h2>
		<article>
			<div class="searchArea">
				<form action="list.jsp">
					<select name="searchType">
						<option value="subject" <%if(searchType != null && searchType.equals("subject")) out.print("selected"); %>>제목</option>
						<option value="writer"<%if(searchType != null && searchType.equals("writer")) out.print("selected"); %>>작성자</option>
					</select>
					<input type="text" name="searchValue"
					<%if(searchValue != null && !searchValue.equals("")&& !searchValue.equals("null")) 
						out.print("value='"+searchValue+"'");%>>
					<input type="submit" value="검색">
				</form>
			</div>
			<table border="1" class="table table-hover">
				<thead>
					<tr>
						<th colspan="2">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
				<%
					while(rs.next()){
				%>
					<tr>
						<td><input type="hidden" name="bidx" value="<%= rs.getInt("bidx")%>"></td>
						<td><a href="view.jsp?bidx=<%= rs.getInt("bidx") %>&searchType=<%=searchType%>&searchValue=<%=searchValue%>"><%= rs.getString("subject") %></a></td>
						<td><%= rs.getString("writer") %></td>
						<td><%= rs.getDate("writeday") %></td>
						<td><%= rs.getInt("hit") %></td>
					</tr>
				<%
					}
				%>				
				</tbody>
			</table>
			<div id="pagingArea">
			<%
			if(paging.getStartPage() >1){ 
			%>
				<a href="list.jsp?nowPage=<%=paging.getStartPage()-1%>&searchType=<%=searchType%>&searchValue=<%=searchValue%>">&lt;</a>	
			<%
			}
			
			for(int i= paging.getStartPage(); i<= paging.getEndPage(); i++){
				if(i == paging.getNowPage()){
			%>
				<b><%= i %></b>
			
			<%
				}else{
			%>
				<a href="list.jsp?nowPage=<%=i%>&searchType=<%=searchType%>&searchValue=<%=searchValue%>"><%= i %></a>
			<%
				}
			}
			if(paging.getEndPage() != paging.getLastPage()){ 
			%>
				<a href="list.jsp?nowPage=<%=paging.getEndPage()+1%>&searchType=<%=searchType%>&searchValue=<%=searchValue%>">&gt;</a>	
			<%
			} 
			%>
			</div>
			
			
			
			<% if(login != null){ %>
			
			<button onclick="location.href='insert.jsp'">등록</button>
			
			<% } %>
		</article>
	</section>
	<%@include file="/footer.jsp" %>
</body>
</html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBManager.close(psmt,conn,rs);
	}
%>