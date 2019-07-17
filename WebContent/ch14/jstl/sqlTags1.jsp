<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR"
	driver="org.gjt.mm.mysql.Driver"
	user="root" password="1234" var="db"
	scope="application"
></sql:setDataSource>

<sql:query var = "lists" dataSource="${db}">
	select id, pwd, name from tblMember
</sql:query>

<c:forEach var="member" items="${lists.rows}">
	${member}<br>
</c:forEach>