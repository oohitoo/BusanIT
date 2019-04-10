<!-- declarationTest.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<h1><%= getstr() %></h1>
<%!
	public String getstr(){
		str += "테스트 입니다.";
		return str;
	}
	private String str = "선언문";
%>
