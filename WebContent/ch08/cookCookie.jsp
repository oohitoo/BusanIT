<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String cookieName = "myCookie";
	Cookie cookie = new Cookie(cookieName, "apply");
	// 60 �� �����ֱ�
	cookie.setMaxAge(60);
	cookie.setValue("Melone");
	
	response.addCookie(cookie);
%>

��Ű�� ����ϴ�. <br>
��Ű ������ <a href="tasteCookie.jsp">�����</a>!!!