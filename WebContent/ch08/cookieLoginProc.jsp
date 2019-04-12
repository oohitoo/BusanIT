<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class ="ch08.RegisterMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean result = mgr.getlogin(id, pwd); //DB연동

	if (result) {
		 Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie); 
		%>
		<script>
			alert("로그인이 되었습니다.");
			location.href = "cookieLoginOk.jsp";
		</script>
		<%
	}
	else{
		%>
		<script>
			alert("로그인을 실패 하였습니다."); 			
			location.href = "cookieLogin.jsp";
		</script>
		<%
	}
	
%>
