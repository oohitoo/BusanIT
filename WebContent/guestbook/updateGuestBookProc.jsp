<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr" />
<jsp:useBean id="bean" class="guestbook.guestbookBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	if(bean.getSecret() == null){
		bean.setSecret("0");
	}
	mgr.updateGuestBook(bean);
%>
<script>
	opener.location.reload();
	self.close();
</script>