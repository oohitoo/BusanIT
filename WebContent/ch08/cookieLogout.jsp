<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Cookie[] cookie = request.getCookies();
	
	for(int i = 0; i < cookie.length; i++){
		if(cookie[i].getName().equals("idKey")){
			cookie[i].setMaxAge(0);
			response.addCookie(cookie[i]);
		}
	}
%>
<script>
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.href = "cookieLogin.jsp";
</script>