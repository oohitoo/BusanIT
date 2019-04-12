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
	alert("로그아웃 되었습니다.");
	location.href = "cookieLogin.jsp";
</script>