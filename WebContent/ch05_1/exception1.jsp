<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page errorPage="exception2.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	out.println(10/0);
%>