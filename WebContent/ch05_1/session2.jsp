<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	//Object�� ��ȯ�̴ϱ� String ����ȯ �ϱ�
	String id = (String)session.getAttribute("idKey");
	String seeionID = session.getId();
	int intervalTime = session.getMaxInactiveInterval();
	
	if(id != null){
		%>
		<%= id %>���� �����ϴ� ������  <b><%= season %></b> �̸� �����ϴ� ������ <%= fruit %> �Դϴ�.
		���� ID = <%= seeionID %> <br>
		���� ���� �ð� = <%= intervalTime %>
		<%
	}
	else{
		out.println("������ ���� �Ǿ��ų� �ٸ� �̿�� ������ �� ���� �����ϴ�.");	
	}
%>