<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- TeamMgr mgr = new TeamMgr(); -->
<jsp:useBean id="mgr" class = "ch07.TeamMgr"/>
<!-- TeamBean bean = new TeamBean(); -->
<jsp:useBean id="bean" class = "ch07.TeamBean"/>
<!-- ������ �ٹڰ� / bean���� �� �ްڴ�. -->
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.insertTeam(bean);
	String str = "���Խ���";
	String location = "teamInsert.html";
	if(result){
		str = "���Լ���";
		location = "teamList.jsp";
	}
%>
<script>
	alert("<%= str %>");
	location.href = "<%= location %>";
</script>