<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- Error 전담 페이지 -->
<%@ page isErrorPage="true" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String msg= exception.getMessage();
	String objectMSG = exception.toString();
%>
에러 메시지 : <%= msg %> 가 발생하였으며<br>
메세지 에러는 다음과 같습니다. <%= objectMSG %>