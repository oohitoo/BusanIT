<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="memberbean" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean flag = memberbean.insertMember(bean);
	String msg = "가입에 실패 하였습니다.";
	String location = "member.jsp";
	if(flag){
		msg = "가입에 성공하였습니다.";
		/* session.setAttribute("idKey", bean.getId()); */ 
		location = "login.jsp?id="+ bean.getId();
	}
%>
<script>
	alert("<%= msg %>");
	location.href = "<%= location %>";
</script>