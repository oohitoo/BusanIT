<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	/* request.setCharacterEncoding("EUC-KR"); */
%>
<jsp:useBean id="bean" class="member.MemberBean" />
<jsp:useBean id="mgr" class="member.MemberMgr" />
<jsp:setProperty property="*" name="bean" />
<%
	boolean flag = mgr.UpdateMember(bean);

	if(flag){
		%>
		<script>
			alert("��������");
			location.href = "login.jsp";
		</script>
		<%
	}
	else{
		%>
		<script>
			alert("��������");
			history.back();
		</script>
		<%
	}
%>