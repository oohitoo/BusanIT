<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- ���ڵ� ���� ����ִ°� -->
<!-- setLocale : (����_����ڵ�) -->
<fmt:requestEncoding value="EUC-KR"/>
<fmt:setLocale value="ko_kr"/>
name : <%= request.getParameter("name")%>
<form method="post">
	name : <input name="name" value="aaa">
	<input type="submit">
</form>