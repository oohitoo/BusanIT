<!-- includeTag4.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String siteName = request.getParameter("siteName");
%>
이름 : <%= name %><br>
사이트 이름 : <%= siteName %><br>
<hr color="blue"/>