<!-- teamInsertProc.jsp -->
<!-- �׼��±� ���� ����. -->
<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	//DB������ ���� mgr��ü�� ����
	TeamMgr mgr = new TeamMgr();
	//��û�� ������ �����ϱ� ���� ��� ����
	TeamBean bean = new TeamBean();
	// �Ѿ�� ������ ����.
	String name = request.getParameter("name");
	String city = request.getParameter("city");
	int age = Integer.parseInt(request.getParameter("age"));
	String team = request.getParameter("team");

	//bean�� ��ƾ���
	bean.setName(name);
	bean.setCity(city);
	bean.setAge(age);
	bean.setTeam(team);
	
	boolean result = mgr.insertTeam(bean);
	String str = "���Խ���";
	String location = "teamInsert.html";
	if(result){
		str = "���Լ���";
		location = "teamList.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= str %>");
	location.href = "<%= location %>";
</script>