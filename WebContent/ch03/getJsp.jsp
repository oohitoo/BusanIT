<!-- getJsp.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<body>
<h1>Get Servlet ���</h1>
<form action="getServlet" method="get">
	msg : <input type="text" name="msg">
	<input type="submit" value="����">
</form>
</body>
</html>