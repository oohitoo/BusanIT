<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result =  mgr.checkId(id);
%>
<html>
<body bgcolor= "#FFFFCC ">
<div align="center"><br/>
<b style="font-weight: bold;"><%=id %></b>
	<%
	if(result) {
		%>
		<%="�� �̹� �����ϴ� ID�Դϴ�." %>
		<%
			}else {
		%>
		<%="�� ��� ���� �մϴ�." %>
		<%
			}
	%>
	<br/><br>
	<a href="javascript:window.close()" style="text-decoration:none; color : gray" >�ݱ�</a>
<!-- 	<input type="button" onclick="self.close()" value="�ݱ�" style="border: 0px; background-color: #FFFFCC; font-size: 15px; color: gray;"> -->
</div> 
</body>
</html>
