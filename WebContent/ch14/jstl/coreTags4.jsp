<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3>Core Tags4</h3>
<hr width="150" align="left">
<c:import url="http://localhost/myapp/ch14/jstl/coreTags2.jsp">
	<c:param name="id" value="aaa"/>
	<c:param name="color" value="yellow"/>
</c:import>
<hr width="150" align="left">
<c:url var="url1" value="http://www.google.com">
	<c:param name="q" value="JAVA" />
	<c:param name="safe" value="off" />
</c:url>
<a href="${url1}">구글에서 JAVA 검색</a>