<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	
	if(id == null){
		StringBuffer url = request.getRequestURL();
		response.sendRedirect("login.jsp?url="+url);
	}
	else{ // 닫는 중괄호는 이페이지를 include하는 페이지 구현
%>