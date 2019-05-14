<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	final String saveFolder = "C:/Jsp/eclipse-workspace/myapp/WebContent/FileUpload/filestorage";
	final String encType = "EUC-KR";
	final int maxSize = 10 * 1024 * 1024;
	
	try{
		//파일이 서버에 업로드 되는 시점은
		// MultipartRequest 객체가 만들어 시점이다.
		MultipartRequest mult = new MultipartRequest(request , saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
		// 파일 이름을 가져올때
		String fileName= mult.getFilesystemName("uploadFile");
		// 원래 파일 이름을 가져올때
		String orginal = mult.getOriginalFileName("uploadFile");
		// Type 을 가져올때
		String type = mult.getContentType("uploadFile");
		
		File f =  mult.getFile("uploadFile");
		int len = 0;
		if(f != null){
			len = (int)f.length();
		}
		String user = mult.getParameter("user");
		String title = mult.getParameter("title");
				
		%>

			저장된 파일 : <%= fileName %> <br>
			실제 파일 : <%= orginal %> <br>
			타입 파일 : <%= type %> <br>
			파일 크기 : <%= len %> byte <br>
			user : <%= user %> <br>
			title : <%= title %> <br>
			<a href="fileSelect.jsp">파일선택</a>
		<%
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>