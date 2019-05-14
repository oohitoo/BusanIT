<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="FileUpload.FileloadMgr" />
<%
	String fch[] = request.getParameterValues("fch[]");
	
	int num[] = new int[fch.length];
	
	for(int i = 0; i < fch.length; ++i){	
		num[i] = Integer.parseInt(fch[i]);
	}
	mgr.deleteFile(num);
	response.sendRedirect("flist.jsp");
%>