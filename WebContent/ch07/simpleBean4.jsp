<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- 1. 빈즈 객체를 생성한다. -->
<jsp:useBean id="bean" class="ch07.SimpleBean2" />

<!-- 2. 값을 받아서 빈즈에 저장한다. -->
<!-- property = "*" 을 하면 가져오는걸 전부 한번에 가능 -->
<jsp:setProperty property="*" name="bean"/>
<!-- 3. 빈즈를 출력한다. -->
name2 : <jsp:getProperty property="name" name="bean"/>
age2 : <jsp:getProperty property="age" name="bean"/>
city2 : <jsp:getProperty property="city" name="bean"/>