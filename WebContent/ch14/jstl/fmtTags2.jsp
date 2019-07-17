<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="num" value="123456789" />
숫자 : <fmt:formatNumber type="number" value="${num}"/><br>
<!-- groupingUsed 자리수 콤마 없애기 -->
퍼센트 : <fmt:formatNumber type="percent" value="${num}" groupingUsed="flase"/><br>
<!-- currencySymbol :통화 기호 쓰는법 -->
달러 : <fmt:formatNumber type="currency" value="${num}" currencySymbol="$" /><br>
패턴 : <fmt:formatNumber pattern="0.0000" value="${num}" groupingUsed="false"/><br>

<fmt:parseNumber var="i" integerOnly="true" value="123.456"/><br>
실수를 제외한 정수 : <c:out value="${i}" />