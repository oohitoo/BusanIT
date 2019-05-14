<%@page import="java.text.NumberFormat"%>
<%@page import="FileUpload.FileLoadBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="FileUpload.FileloadMgr" />
<%
	Vector<FileLoadBean> vlist = mgr.listFile();
	final String saveFolder = "filestorage";

%>
<html>
<head>
<!-- <link href="../guestbook/css/style.css" rel="stylesheet" type="text/css"> -->
<script type="text/javascript">
	function allChk() {
		var f = document.frm;
		if(f.allCh.checked){
			fch = document.getElementsByName('fch[]') ;
			for(i = 0; i < fch.length; ++i){
				fch[i].checked = true;
			}
			f.btn.disabled = false;
		}
		else{
			for(i = 0; i < fch.length; ++i){
				fch[i].checked = false;
			}
			f.btn.disabled = true;
		}
	}
	function chk() {
		f = document.frm;
		fch = document.getElementsByName('fch[]') ;
		for(i=0; i< fch.length; ++i){
			if(fch[i].checked){
				f.btn.disabled = false;
				return;
			}
		}
		f.btn.disabled = true;
	}
</script>
</head>
<body>
	<div align="center" id="">
		<h2>File List</h2>
		<form name="frm" action="fdeleteProc.jsp">
			<table border="1">
				<tr>
					<th><input type="checkbox" name="allCh" onclick="allChk()"></th>
					<th>번호</th>
					<th>파일이름</th>
					<th>크기</th>
				</tr>
				<%
					for (int i = 0; i < vlist.size(); ++i) {
						FileLoadBean bean = vlist.get(i);
						int num = bean.getNum();
						String upFile = bean.getUpFile();
						int size = bean.getSize();
				%>
				<tr>
					<td><input type="checkbox" name = "fch[]" value="<%= num %>" onclick="chk()"></td>
					<td><%= i+1 %></td>
					<td><a href="1.html" download><%= upFile %></td>
					<td><%= NumberFormat.getInstance().format(size) %> byte</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="4">
						<input type="submit" name="btn" value="DELETE" disabled>
						<a href="fupload.jsp">파일선택</a>
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
