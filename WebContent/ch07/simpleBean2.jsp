<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- SimpleBean ��ü�� �����Ѵ�. -->
<jsp:useBean id="bean" class="ch07.SimpleBean" />
<!-- ��û�� message�� �ް� message�� ����(set) -->
<jsp:setProperty property="message" name="bean"/>
<!-- ����� message�� �����´�.(get) -->
message2 : <jsp:getProperty property="message" name="bean"/>