<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="FileUpload.FileloadMgr" />
<%
	boolean flag = mgr.updateFile(request);
	if(flag){
		response.sendRedirect("flist.jsp");
	}
	else{
	response.sendRedirect("fupload.jsp");
	}
%>