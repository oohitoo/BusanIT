<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class = "ch07.TeamMgr"/>
<jsp:useBean id="bean" class = "ch07.TeamBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.updateTeam(bean);
	String str = "��������";
	String location = "teamList.jsp";
	if(result){
		str = "��������";
		location = "teamList.jsp";
	}
%>
<script>
	alert("<%= str %>");
	location.href = "<%= location %>";
</script>