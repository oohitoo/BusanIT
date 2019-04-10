<!-- teamUpdate.jsp -->
<%@page import="ch07.TeamBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class = "ch07.TeamMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = 0;
	if(request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
	}
	else{
		response.sendRedirect("teamList.jsp");
	}
	
%>
<%
	TeamBean bean = mgr.getTeam(num);
%>
<link href="style.css" rel="stylesheet" type="text/css">
<body>
	<div align="center">
		<h1>Team Update</h1>
		<form method="post" action="teamUpdateProc.jsp">
			<table border="1">
				<tr>
					<td width="50" align="center">번호</td>
					<td width="150"><input name="num" readonly value="<%= num %>"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input name="name" value="<%= bean.getName() %>" required></td>
				</tr>
				<tr>
					<td align="center">사는곳</td>
					<td><input name="city" value="<%= bean.getCity() %>" required></td>
				</tr>
				<tr>
					<td align="center">나이</td>
					<td><input name="age" value="<%= bean.getAge() %>" required></td>
				</tr>
				<tr>
					<td align="center">팀명</td>
					<td><input name="team" value="<%= bean.getTeam() %>" required></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="UPDATE"></td>
				</tr>
			</table>
			<p />
		</form>
		<a href="teamSelect.jsp?num=<%= num %>">SELECT</a>
	</div>
</body>
