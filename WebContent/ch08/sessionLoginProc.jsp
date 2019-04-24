<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch08.RegisterMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	//id, pwd 를 요청받아서 loginRegister 메소드를 호출하여
	//성공이면 sessionLoingOK.jsp 보내고
	//실패면 sessionLogin.jsp 돌아간다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");	
	
	boolean result = mgr.getlogin(id, pwd);
	
	if(result){
		session.setAttribute("idKey", id);
		session.setAttribute("pwdKey", pwd);
		%>
		<script>
			location.href = ("sessionLoginOK.jsp");
		</script>
		<%
	}
	else{
		%>
		<script>
			alert("실패");
			location.href = ("sessionLogin.jsp");
		</script>
		<%	
	}
%>