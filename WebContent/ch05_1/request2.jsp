<!-- request2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	/*
		1. 프로토콜
		2. 서버 이름
		3. 포트번호
		4. 컴퓨터 주소
		5. 컴퓨터 이름
		6. 메소드
		7. 요청 URL
		8. 요청 URI
		9. 현재 사용 브라우저
		10. 파라미터값 가져와서 보여주기
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

프로토콜 : <%=protocal%><p/>
서버의 이름 : <%=serverName%><p/>
서버의 포트 번호 :<%=serverPort%><p/>
사용자 컴퓨터의 주소 : <%=remoteAddrs%><p/>
사용자 컴퓨터의 이름 : <%=hostAddrs%><p/>
사용 method : <%=method%><p/>
요청 경로(URL) : <%=requestURL%><p/>
요청 경로(URI) : <%=requestURI%><p/>
현재 사용하는 브라우저 : <%=useBrower%><p/>
query : <%= query %>