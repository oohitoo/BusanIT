<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	request.setAttribute("siteName", "JSPStudy.co.kr");
%>
��ũ��Ʈ ���� :<%= request.getAttribute("siteName") %><br>
EL���� : ${siteName}