<%@ page contentType="text/html; charset=EUC-KR" buffer="8kb" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer - remainBuffer;
%>
��� Buffer�� ũ�� <% out.println(totalBuffer); %> <br>
���� Buffer�� ũ�� <% out.println(remainBuffer); %> <br>
��� Buffer�� ũ�� <% out.println(useBuffer); %> <br>