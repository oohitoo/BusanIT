<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	String name = "��ȣ��";
%>
���������� ���� ���� ����?<hr color="red" width="50%" align="left">
<!-- bloodType�� �°� �����ϱ� ���� include �� ���  -->
<jsp:include page='<%= bloodType + ".jsp" %>'>
	<jsp:param value="<%= name %>" name="name"/>
</jsp:include>