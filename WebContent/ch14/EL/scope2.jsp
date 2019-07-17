<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	pageContext.setAttribute("msg", "꿈은 이루어 진다.");
%>
msg : ${pageScope.msg}<br/>
sum : <%= request.getAttribute("sum")%><br>
sum : ${requestScope.sum}