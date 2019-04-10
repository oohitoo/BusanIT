<%@ page contentType="text/html; charset=EUC-KR" buffer="8kb" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer - remainBuffer;
%>
출력 Buffer의 크기 <% out.println(totalBuffer); %> <br>
남음 Buffer의 크기 <% out.println(remainBuffer); %> <br>
사용 Buffer의 크기 <% out.println(useBuffer); %> <br>