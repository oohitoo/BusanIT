<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String str1[] = {"simba","rorod","tina","poli"};
	String str2 = "Java,JSP,Spring,Android";
%>
<c:set var="arr" value="<%= str1 %>" />
<c:forEach var="i" items="${arr}" begin="0" step="1" end="3">
	${i}<br>
</c:forEach>

<hr width="220px;" color="blue" align="left">

<c:set var="st" value="<%= str2 %>" />
<%-- delims 나눌 구분자 지정하는거임 --%>
<c:forTokens var="st" items="${st}" delims=",;">
	<b>${st}<br></b>
</c:forTokens>