<%@page import="ch07.SimpleBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	//message �ް�
	String message = request.getParameter("message");
	//��ü�����
	SimpleBean bean = new SimpleBean();
	// �����ϰ�
	bean.setMessage(message);
%>
<!-- �󿡼� �������� -->
message : <%= bean.getMessage() %>