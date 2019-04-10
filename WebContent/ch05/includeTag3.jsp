<!-- includeTag3.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<% 
	request.setCharacterEncoding("EUC-KR"); 
	String name = request.getParameter("name");
%>
<!-- includeTag2.html -> siteName 정보값도 같이 요청 -->
<jsp:include page="includeTag4.jsp">
	<jsp:param value="홍길동" name="name" />
</jsp:include>