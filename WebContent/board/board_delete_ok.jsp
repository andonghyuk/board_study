<%@page import="common.Connector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] nums = request.getParameterValues("chk");

Connection conn = Connector.getConnection();
String sql = "delete from board where num=?";
PreparedStatement ps = conn.prepareStatement(sql);

	for(String num:nums){
		ps.setInt(1, Integer.parseInt(num));
		ps.executeUpdate();
	}

%>

<script>
	location.href="/board/list.jsp";
</script>