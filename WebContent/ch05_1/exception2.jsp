<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- Error ���� ������ -->
<%@ page isErrorPage="true" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String msg= exception.getMessage();
	String objectMSG = exception.toString();
%>
���� �޽��� : <%= msg %> �� �߻��Ͽ�����<br>
�޼��� ������ ������ �����ϴ�. <%= objectMSG %>