<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		public String randomColor(){
			Random r = new Random();
			String rgb = Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		return "#"+rgb;
		}
%>
<%
	request.setCharacterEncoding("EUC-KR");

	// msg�� number�� form �� name�� �ݵ�� ��ġ
	String msg = request.getParameter("msg");
	int number = Integer.parseInt(request.getParameter("number"));

	int count = 0;
	while (count < number) {
		++count;
%>
<h3>
	<font color="<%= randomColor()%>"><%=msg%></font>
</h3>
<%
	}
%>