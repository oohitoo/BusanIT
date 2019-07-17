<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="num" value="123456789" />
���� : <fmt:formatNumber type="number" value="${num}"/><br>
<!-- groupingUsed �ڸ��� �޸� ���ֱ� -->
�ۼ�Ʈ : <fmt:formatNumber type="percent" value="${num}" groupingUsed="flase"/><br>
<!-- currencySymbol :��ȭ ��ȣ ���¹� -->
�޷� : <fmt:formatNumber type="currency" value="${num}" currencySymbol="$" /><br>
���� : <fmt:formatNumber pattern="0.0000" value="${num}" groupingUsed="false"/><br>

<fmt:parseNumber var="i" integerOnly="true" value="123.456"/><br>
�Ǽ��� ������ ���� : <c:out value="${i}" />