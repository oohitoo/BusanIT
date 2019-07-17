<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle var="note" basename="ch14.note" />
<fmt:message bundle="${note}" key="country" /><br>
<fmt:message bundle="${note}" key="siteName" /><br> 
<fmt:message bundle="${note}" key="msg">
	<fmt:param value="${param.msg}"/>
</fmt:message>