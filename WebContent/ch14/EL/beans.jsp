<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="ch14.ELBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("siteName");
%>
����Ʈ�� : <%=name%><br>
����Ʈ�� : <%=bean.getSiteName() %><br>
����Ʈ�� : ${param.siteName}<br>
����Ʈ�� : ${bean.siteName}<br>

