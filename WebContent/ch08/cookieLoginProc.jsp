<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class ="ch08.RegisterMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean result = mgr.getlogin(id, pwd); //DB����

	if (result) {
		 Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie); 
		%>
		<script>
			alert("�α����� �Ǿ����ϴ�.");
			location.href = "cookieLoginOk.jsp";
		</script>
		<%
	}
	else{
		%>
		<script>
			alert("�α����� ���� �Ͽ����ϴ�."); 			
			location.href = "cookieLogin.jsp";
		</script>
		<%
	}
	
%>
