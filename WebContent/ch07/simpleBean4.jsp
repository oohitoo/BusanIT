<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- 1. ���� ��ü�� �����Ѵ�. -->
<jsp:useBean id="bean" class="ch07.SimpleBean2" />

<!-- 2. ���� �޾Ƽ� ��� �����Ѵ�. -->
<!-- property = "*" �� �ϸ� �������°� ���� �ѹ��� ���� -->
<jsp:setProperty property="*" name="bean"/>
<!-- 3. ��� ����Ѵ�. -->
name2 : <jsp:getProperty property="name" name="bean"/>
age2 : <jsp:getProperty property="age" name="bean"/>
city2 : <jsp:getProperty property="city" name="bean"/>