<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	if(request.getParameter("name") != null){
		out.print(request.getParameter("name"));
	}
%>
name �� ��û���� : ${empty param.name}<br>
<a href="empty.jsp?name=aaa">name���� �ִ¿�û</a>
<a href="empty.jsp">name���� �ִ¿�û</a>