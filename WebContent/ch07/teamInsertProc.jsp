<!-- teamInsertProc.jsp -->
<!-- 액션태그 없이 만듬. -->
<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	//DB연동을 위해 mgr객체를 생성
	TeamMgr mgr = new TeamMgr();
	//요청한 값들을 저장하기 위해 빈즈를 생성
	TeamBean bean = new TeamBean();
	// 넘어온 값들을 받음.
	String name = request.getParameter("name");
	String city = request.getParameter("city");
	int age = Integer.parseInt(request.getParameter("age"));
	String team = request.getParameter("team");

	//bean에 담아야함
	bean.setName(name);
	bean.setCity(city);
	bean.setAge(age);
	bean.setTeam(team);
	
	boolean result = mgr.insertTeam(bean);
	String str = "가입실패";
	String location = "teamInsert.html";
	if(result){
		str = "가입성공";
		location = "teamList.jsp";
	}
%>
<script type="text/javascript">
	alert("<%= str %>");
	location.href = "<%= location %>";
</script>