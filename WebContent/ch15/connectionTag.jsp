<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ch15.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tlds/ConnectionTag.tld" %>
<h1>스크립트 변수 생성하기</h1>
<tag:db id="db"/>
<%
	Connection conn = db.getConnection();
	String sql = "select * from tblMember";
	PreparedStatement psmt = conn.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	
	while(rs.next()){
%>		
	name : <%= rs.getString("name") %>
	id : <%= rs.getString("id") %>
<%}%>
<c:set var="rs" value="<%= rs.next() %>"></c:set>
<c:forEach var="i" items="${rs}">

</c:forEach>
