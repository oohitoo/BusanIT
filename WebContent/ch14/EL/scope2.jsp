<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	pageContext.setAttribute("msg", "���� �̷�� ����.");
%>
msg : ${pageScope.msg}<br/>
sum : <%= request.getAttribute("sum")%><br>
sum : ${requestScope.sum}