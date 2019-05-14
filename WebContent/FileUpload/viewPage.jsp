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
		//������ ������ ���ε� �Ǵ� ������
		// MultipartRequest ��ü�� ����� �����̴�.
		MultipartRequest mult = new MultipartRequest(request , saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
		// ���� �̸��� �����ö�
		String fileName= mult.getFilesystemName("uploadFile");
		// ���� ���� �̸��� �����ö�
		String orginal = mult.getOriginalFileName("uploadFile");
		// Type �� �����ö�
		String type = mult.getContentType("uploadFile");
		
		File f =  mult.getFile("uploadFile");
		int len = 0;
		if(f != null){
			len = (int)f.length();
		}
		String user = mult.getParameter("user");
		String title = mult.getParameter("title");
				
		%>

			����� ���� : <%= fileName %> <br>
			���� ���� : <%= orginal %> <br>
			Ÿ�� ���� : <%= type %> <br>
			���� ũ�� : <%= len %> byte <br>
			user : <%= user %> <br>
			title : <%= title %> <br>
			<a href="fileSelect.jsp">���ϼ���</a>
		<%
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>