<!-- for.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
1���� 10������ ����?(������)<br>
<br>1. ǥ�������� ���<br>
<%
	int sum = 0;
	for(int i =1; i<=10; i++){
		if(i < 10){
	%>
	<%=i+ "+" %>
<%
		}else{
		%>
	<%=i+ "=" %>
<%	
		}
		sum += i;
	}
%>
<%=sum%><br>
<br>2. out.println�� ����ؼ� ���<br>
<% sum = 0; 
	for(int i =1; i<=10; i++){
		if(i < 10){
			out.print(i + "+");
		}else{
			out.print(i + "=");
		}
		sum+=i;
	}
	out.println(sum);
%>