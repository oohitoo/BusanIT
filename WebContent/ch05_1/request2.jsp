<!-- request2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	/*
		1. ��������
		2. ���� �̸�
		3. ��Ʈ��ȣ
		4. ��ǻ�� �ּ�
		5. ��ǻ�� �̸�
		6. �޼ҵ�
		7. ��û URL
		8. ��û URI
		9. ���� ��� ������
		10. �Ķ���Ͱ� �����ͼ� �����ֱ�
	*/
	String protocal = request.getProtocol();
	String serverName = request.getServerName();
	int serverPort = request.getServerPort();
	String remoteAddrs = request.getRemoteAddr();
	String hostAddrs = request.getRemoteHost();
	String method = request.getMethod();
	StringBuffer requestURL = request.getRequestURL();
	String requestURI = request.getRequestURI();
	String useBrower = request.getHeader("User-Agent");
	String query = request.getQueryString();
%>

�������� : <%=protocal%><p/>
������ �̸� : <%=serverName%><p/>
������ ��Ʈ ��ȣ :<%=serverPort%><p/>
����� ��ǻ���� �ּ� : <%=remoteAddrs%><p/>
����� ��ǻ���� �̸� : <%=hostAddrs%><p/>
��� method : <%=method%><p/>
��û ���(URL) : <%=requestURL%><p/>
��û ���(URI) : <%=requestURI%><p/>
���� ����ϴ� ������ : <%=useBrower%><p/>
query : <%= query %>