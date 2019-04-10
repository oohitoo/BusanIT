<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	//Object로 반환이니깐 String 형변환 하기
	String id = (String)session.getAttribute("idKey");
	String seeionID = session.getId();
	int intervalTime = session.getMaxInactiveInterval();
	
	if(id != null){
		%>
		<%= id %>님이 좋아하는 계절은  <b><%= season %></b> 이며 좋아하는 과일은 <%= fruit %> 입니다.
		세션 ID = <%= seeionID %> <br>
		세션 유지 시간 = <%= intervalTime %>
		<%
	}
	else{
		out.println("세션이 만료 되었거나 다른 이우로 연결을 할 수가 없습니다.");	
	}
%>