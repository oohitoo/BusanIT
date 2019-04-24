<!-- getJsp.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<body>
<h1>Post Servlet 방식</h1>
<form action="postServlet" method="post">
	id : <input name="id"><br>
	pwd : <input type = "password"name="pwd"><br>
	email : <input type="email" name="email"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>