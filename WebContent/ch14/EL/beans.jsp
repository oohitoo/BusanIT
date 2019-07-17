<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="bean" class="ch14.ELBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("siteName");
%>
사이트명 : <%=name%><br>
사이트명 : <%=bean.getSiteName() %><br>
사이트명 : ${param.siteName}<br>
사이트명 : ${bean.siteName}<br>

