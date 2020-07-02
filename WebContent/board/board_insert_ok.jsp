<%@page import="common.Connector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String creusr = request.getParameter("creusr");
Connection conn = Connector.getConnection();
String sql = "insert into board(title, content, creusr) ";

sql += "values(?,?,?)";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, title);
ps.setString(2, content);
ps.setString(3, creusr);

int result = ps.executeUpdate();
 %>