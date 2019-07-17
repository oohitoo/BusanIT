<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.id != null}">
	<b>${param.id}</b>
</c:if>
<c:if test="${param.id == null}">
	<b>Guest</b>
</c:if>
<c:choose>
	<c:when test="${param.color=='yellow' }">
		<c:set var="c" value="노란색"/>
	</c:when>
	<c:when test="${param.color=='blue' }">
		<c:set var="c" value="블루"/>
	</c:when>
	<c:when test="${param.color=='orange' }">
		<c:set var="c" value="오렌지"/>
	</c:when>
	<c:when test="${param.color=='pink' }">
		<c:set var="c" value="핑크"/>
	</c:when>
	<c:otherwise>
		<c:set var="c" value="기타색"></c:set>
	</c:otherwise>
</c:choose>
님이 좋아하는 <font color="${param.color}">${c}</font>입니다.