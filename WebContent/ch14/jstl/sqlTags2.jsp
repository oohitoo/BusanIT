<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:update dataSource="${db}">
	update tblMember set name = ? where id = ?
	<sql:param value="${'9999'}" />
	<sql:param value="${'123a'}" />
</sql:update>
수정되었습니다. <br>
<a href="sqlTags1.jsp">SELECT</a>