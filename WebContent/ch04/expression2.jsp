<!-- expression2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>

<%!
	/* int a = Math.max(one, two); */	
	public int max1(int a, int b){
		return (a >= b) ? a : b;
	}
%>
<%
	java.util.Date d = new java.util.Date();
	int hour = d.getHours();
	int one = 10;
	int two = 12;
%>
지금은 오전 일까요? 오후 일까요? <%=(hour <12)? "오전":"오후" %><br>
one 과 two 중 둘중 큰 숫자는? <%= max1(one, two) %>