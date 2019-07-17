<!-- el2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- el문법 무시하는 코드 -->
<%@ page isELIgnored="true" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	request.setAttribute("siteName", "JSPStudy.co.kr");
%>
스크립트 문법 :<%= request.getAttribute("siteName") %><br>
EL문법 : ${siteName}