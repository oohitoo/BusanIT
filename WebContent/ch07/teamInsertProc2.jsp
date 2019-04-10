<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- TeamMgr mgr = new TeamMgr(); -->
<jsp:useBean id="mgr" class = "ch07.TeamMgr"/>
<!-- TeamBean bean = new TeamBean(); -->
<jsp:useBean id="bean" class = "ch07.TeamBean"/>
<!-- 모든것을 다박고 / bean으로 다 받겠다. -->
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.insertTeam(bean);
	String str = "가입실패";
	String location = "teamInsert.html";
	if(result){
		str = "가입성공";
		location = "teamList.jsp";
	}
%>
<script>
	alert("<%= str %>");
	location.href = "<%= location %>";
</script>