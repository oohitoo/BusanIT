<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr" />
<jsp:useBean id="bean" class="guestbook.guestbookBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	//���� �����ϴ� ip��	
	bean.setIp(request.getRemoteAddr());
	
	//��б� üũ�� ���� ����
	if(bean.getSecret() == null){
		bean.setSecret("0");
	}
	mgr.insertGuest(bean);
	response.sendRedirect("showGuestBook.jsp");
%>