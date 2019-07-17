<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	request.setAttribute("siteName", "JSPStudy.co.kr");
%>
스크립트 문법 :<%= request.getAttribute("siteName") %><br>
EL문법 : ${siteName}