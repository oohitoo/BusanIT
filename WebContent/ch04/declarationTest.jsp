<!-- declarationTest.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<h1><%= getstr() %></h1>
<%!
	public String getstr(){
		str += "�׽�Ʈ �Դϴ�.";
		return str;
	}
	private String str = "����";
%>
