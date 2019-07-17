<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	session.setAttribute("id", "aaa");
	application.setAttribute("siteName", "JSPstudy.com");
%>
<jsp:forward page="scope4.jsp"></jsp:forward>