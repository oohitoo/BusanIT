<!-- el2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- el���� �����ϴ� �ڵ� -->
<%@ page isELIgnored="true" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	request.setAttribute("siteName", "JSPStudy.co.kr");
%>
��ũ��Ʈ ���� :<%= request.getAttribute("siteName") %><br>
EL���� : ${siteName}