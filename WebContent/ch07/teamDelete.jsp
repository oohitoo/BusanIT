<%@page import="ch07.TeamBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.TeamMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = 0;
	if(request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
		mgr.deleteTeam(num);
	}
	response.sendRedirect("teamList.jsp");
%>
