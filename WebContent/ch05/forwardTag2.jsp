<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd"); 
%>
<%-- forward �Ŀ� ������ �Դϴ�<br>
id / pwd : <%=id + "/" +pwd %> --%>
<jsp:include page="forwardTag3.jsp" />
