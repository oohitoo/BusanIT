<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch08.RegisterMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	//id, pwd �� ��û�޾Ƽ� loginRegister �޼ҵ带 ȣ���Ͽ�
	//�����̸� sessionLoingOK.jsp ������
	//���и� sessionLogin.jsp ���ư���.
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
			alert("����");
			location.href = ("sessionLogin.jsp");
		</script>
		<%	
	}
%>