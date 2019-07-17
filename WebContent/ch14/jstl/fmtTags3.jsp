<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="daytime" value="<%= new Date() %>" />
<fmt:formatDate value="${daytime}" type="date" dateStyle="full"/>
<fmt:formatDate value="${daytime}" type="date" />

<fmt:timeZone value="Europe/London">
	Europe/London : <fmt:formatDate type="both" value="${daytime}" dateStyle="full" timeStyle="full"/><br>
</fmt:timeZone>

<fmt:setTimeZone value="America/New_York"/>
America/New_York : 
<fmt:formatDate value="${datetime}" type="both" dateStyle="full" timeStyle="full" /><br> 