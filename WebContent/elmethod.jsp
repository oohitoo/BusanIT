<%@ page import="ch14.ELMethod"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="m" uri="/WEB-INF/tlds/Funcation.tld" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int num = 123456789;
%>
num1 : <%=num%>
num2 : <%=ELMethod.comma(num)%>
<!-- TLD (Tag Librarie Date)-->
<!-- 1. Ŭ���� �����ϰ� �޼ҵ� ���� -->
<!-- 2. TLD���� -->
<!-- 3. TLD�� web.xml�� ��� -->
num3 : ${m:comma(123456789)}
