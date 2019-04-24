<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionId = session.getId();
	session.invalidate();
%>
<script>
	alert("<%= sessionId + "·Î±×¾Æ¿ô"%>");
	location.href = ("sessionLogin.jsp");
</script>