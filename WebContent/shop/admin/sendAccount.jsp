<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="shop.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	mMgr.sendAccount(id); 
%>
<script>
	alert("메일을 보냈습니다.");
	location.href = "memberMgr.jsp";
</script>