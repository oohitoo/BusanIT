<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
%>
include ActionTag의 입니다. </p>
<%= name %>
<hr color="red" width="300" align="left"/>
