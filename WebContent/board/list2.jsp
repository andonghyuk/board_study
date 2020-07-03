<%@page import="common.Connector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>

</head>
<body>
<%
	Connection conn = Connector.getConnection();	
	String search = request.getParameter("search");
	String searchStr = request.getParameter("searchStr");
	
	String sql = "SELECT  num, title, credat, cretim, creusr FROM board";
	if(search!=null && !"".equals(search)){
		
		sql += " where ";
		if("1".equals(search)){
			sql += " num like concat('%',?,'%')";
			sql += " or creusr like concat('%',?,'%')";
		}else if("2".equals(search)){
			sql += " title like concat('%',?,'%')";
		}else if("3".equals(search)){
			sql += " credat like concat('%',?,'%')";
		}else if("4".equals(search)){
			 sql += " title like concat('%',?,'%')";
			 sql += " or content like concat('%',?,'%')";
		}else if("5".equals(search)){
			sql += " creusr like concat('%',?,'%')";
		}
		
		
	}
	
	PreparedStatement ps = conn.prepareStatement(sql);
	if(search!=null && !"".equals(search)){
		ps.setString(1,searchStr);
		if("4".equals(search)){
			ps.setString(2,searchStr);
		}else if("1".equals(search)){
			ps.setString(2,searchStr);
		}
	}
	ResultSet rs = ps.executeQuery();

%>
	<form>
		<select name="search">
			<option value="1">번호 + 작성자</option>
			<option value="2">제목</option>
			<option value="3">등록일</option>
			<option value="4">제목 + 내용</option>
			<option value="5">작성자</option>			
		</select>
		<input type="text" name="searchStr">
		<button class="but">검색</button>

		
		
	</form>
	<a href = "/board/board_insert.jsp"><button>게시물 작성</button></a>
	<form action="/board/board_delete_ok.jsp">
	<table border="1">
		<tr>
			<th><input type="checkbox" id="chk_all" onclick="checkAll()"></th>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>시간</th>
			<th>작성자</th>
		</tr>
	

<%
	while(rs.next()){
%>
		<tr>
			<td><input type="checkbox" name="chk" value="<%=rs.getInt("num")%>"></td>
			<td><%=rs.getInt("num")%></td>
			<td><%=rs.getString("title")%></td>
			<td><%=rs.getString("credat") %></td>
			<td><%=rs.getString("cretim") %></td>
			<td><%=rs.getString("creusr") %></td>
		</tr>
<%
	}
%>
	</table>
	<button>삭제</button>
	</form>

<script>
	function checkAll(){
		var obj = document.getElementById('chk_all');
		var objs = document.getElementsByName('chk');
		
		for(var i = 0; i<objs.length; i++){
			objs[i].checked = obj.checked;
		}
		
	}
</script>

</body>
</html>