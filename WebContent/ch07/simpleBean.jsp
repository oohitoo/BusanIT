<%@page import="ch07.SimpleBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	//message 받고
	String message = request.getParameter("message");
	//객체만들기
	SimpleBean bean = new SimpleBean();
	// 저장하고
	bean.setMessage(message);
%>
<!-- 빈에서 가져오기 -->
message : <%= bean.getMessage() %>