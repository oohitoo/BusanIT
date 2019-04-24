<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr" />
<%
	String num = request.getParameter("num");

	if (num == null || session.getId().equals("")) {
		response.sendRedirect("showGuestBook.jsp");
	} 
	else {
		mgr.deleteGuestBook(Integer.parseInt(num));
		response.sendRedirect("showGuestBook.jsp");
	}
%>