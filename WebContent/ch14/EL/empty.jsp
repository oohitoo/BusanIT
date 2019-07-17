<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	if(request.getParameter("name") != null){
		out.print(request.getParameter("name"));
	}
%>
name 의 요청여부 : ${empty param.name}<br>
<a href="empty.jsp?name=aaa">name값이 있는요청</a>
<a href="empty.jsp">name값이 있는요청</a>