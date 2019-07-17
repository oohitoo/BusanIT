<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
id : ${param.id}<br>
pwd : ${param.pwd}<br>
<hr>
id : ${param["id"]}<br>
id : ${param["pwd"]}<br>