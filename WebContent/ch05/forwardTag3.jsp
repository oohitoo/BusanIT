<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	
%>
<jsp:include page='<%= bloodType + ".jsp" %>'>
	<jsp:param value="simba222" name="name"/>
</jsp:include>
