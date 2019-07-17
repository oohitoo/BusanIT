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
<!-- 1. 클래스 선언하고 메소드 만듬 -->
<!-- 2. TLD생성 -->
<!-- 3. TLD를 web.xml에 등록 -->
num3 : ${m:comma(123456789)}
