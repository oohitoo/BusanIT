<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="memberbean" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean flag = memberbean.insertMember(bean);
	String msg = "���Կ� ���� �Ͽ����ϴ�.";
	String location = "member.jsp";
	if(flag){
		msg = "���Կ� �����Ͽ����ϴ�.";
		/* session.setAttribute("idKey", bean.getId()); */ 
		location = "login.jsp?id="+ bean.getId();
	}
%>
<script>
	alert("<%= msg %>");
	location.href = "<%= location %>";
</script>