<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int sum = 0;
	for(int i=1; i <11; ++i){
		sum += i;
	}
	request.setAttribute("sum", sum);
%>
<jsp:forward page ="scope2.jsp" />