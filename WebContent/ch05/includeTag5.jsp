<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	String name = "강호동";
%>
혈액형으로 보는 나의 성격?<hr color="red" width="50%" align="left">
<!-- bloodType에 맞게 실행하기 위함 include 를 사용  -->
<jsp:include page='<%= bloodType + ".jsp" %>'>
	<jsp:param value="<%= name %>" name="name"/>
</jsp:include>