<%@page import="guestbook.commentBean"%>
<%@page import="guestbook.JoinBean"%>
<%@page import="guestbook.GuestBookMgr"%>
<%@page import="guestbook.guestbookBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="getSession.jsp"%>
<title>GuestBook</title>
</head>
<script type="text/javascript">
	function updateFn(num) {
		url = "updateGuestBook.jsp?num="+num;
		window.open(url, "update GuestBook", "width=520, height=300");
	}
	function commentPost(frm) {
		if(frm.comment.value == ""){
			alert("������ �Է��� �ּ���");
			frm.comment.focus();
			return;
		}
		frm.submit();
	}
	function disFn(num) {
		console.log("ȣ���");
		var txt = "cmt"+num;
		var e = document.getElementById(txt);
		if(e.style.display == 'none'){
			e.style.display = 'block';
		}
		else{
			e.style.display = 'none';
		}
	}
</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<body bgcolor="#996600">
	<div align="center">
		<%@ include file="postGuestBook.jsp"%>
		<%
			GuestBookMgr mgr = new GuestBookMgr();
			Vector<guestbookBean> vlist = mgr.listGuestBook(login.getId(), login.getGrade());
		%>
		<table width="520" cellspacing="0" cellpadding="3">
			<tr bgcolor="#F5F5F5">
				<td><font size="2"><b><%=login.getName()%> �� ȯ���մϴ�!</b></font></td>
				<td align="right"><a href="logout.jsp">�α׾ƿ�</a></td>
			</tr>
		</table>
		<!-- GuestBook List Start -->
		<%
			if (vlist.isEmpty()) {
		%>
		<table width="520" cellspacing="0" cellpadding="7">
			<tr>
				<td>��ϵ� ���� �����ϴ�.</td>
			</tr>
		</table>
		<%
			} else {
					for (int i = 0; i < vlist.size(); ++i) {
						// �Խñ�
						guestbookBean bean = vlist.get(i);
						// ���� �� ����� ����
						JoinBean writer = mgr.getJoin(bean.getId());
		%>
		<table width="520" border="1" bordercolor="#000000" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="100%">
					<table bgcolor="#F5F5F5">
						<tr>
							<td width="225">No. <%= vlist.size()-i %></td>
							<td width="225"><img src="img/face.bmp" alt="����"><%= writer.getName() %></td>
							<td width="150" align="center">
								<%
								if(writer.getHp() == null || writer.getHp().equals("")){
									out.print("Ȩ�������� ���׿�.");
								}
								else{
									%> <a href="http://<%= writer.getHp() %>"> <img
									src="img/hp.bmp" alt="�̹��� ����" border="1">
							</a> <%
								}
							%>
							
						</tr>
						<tr>
							<td colspan="3"><%= bean.getContents() %></td>
						</tr>
						<tr>
							<td>IP : <%= bean.getIp() %></td>
							<td><%= bean.getRegdate() +" "+ bean.getRegtime()%></td>
							<td>
								<%
									//�α��� id�� ���� �� ����� id�� ���� �ϴٸ� ���� ���� Ȱ��ȭ
									boolean chk = login.getId().equals(writer.getId());
								
									if(chk || login.getGrade().trim().equals("1")){
										if(chk){
											%> <a href="javascript:updateFn('<%= bean.getNum() %>')">[����]</a>
								<%
										}
										%> <a href="deleteGuestBook.jsp?num=<%= bean.getNum()%>">[����]</a>
								<%		
										if(bean.getSecret().trim().equals("1")){
											out.print("��б�");
										}
									}
								%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- ���� ����Ʈ, ��� �Է���, ��� ����Ʈ -->
		<!-- Comment List Start -->
		<div id="cmt<%=bean.getNum()%>">
			<%
			Vector<commentBean> cvlist = mgr.listComment(bean.getNum());
			if(!cvlist.isEmpty()){
				%>
			<table width="500" bgcolor="#F5F5F5">
				<%	
				for(int j = 0; j < cvlist.size(); ++j){
					commentBean cbean = cvlist.get(j);
					%>
				<tr>
					<td>
						<table width="500">
							<tr>
								<td><b><%= cbean.getCid() %></b></td>
								<td align="right">
									<% if(cbean.getCid().equals(login.getId())){ %> <a
									href="commentProc.jsp?flag=delete&cnum=<%= cbean.getCnum()%>">[����]</a>
									<% } %>
								</td>
							</tr>
							<tr>
								<td colspan="2"><%=cbean.getComment() %></td>
							</tr>
							<tr>
								<td><%=cbean.getCip() %></td>
								<td align="right"><%=cbean.getCregDate() %></td>
							</tr>
						</table>
					</td>
				</tr>
				<%
					
				}
				%>
			</table>
			<%
			}
		%>
		</div>
		<table width="500">
			<tr>
				<td><button onclick="disFn('<%=bean.getNum() %>')">
						���<%= cvlist.size() %></button></td>
			</tr>
		</table>
		<!-- Comment List End -->

		<!-- Comment From Start -->
		<form name="cFrm" action="commentProc.jsp">
			<table>
				<tr>
					<td><textarea name="comment" cols="72" rows="2"
							maxlength="1000" style="resize: none;"></textarea></td>
					<td><input type="button" value="���"
						onclick="javascript:commentPost(this.form)"> <input
						type="hidden" name="flag" value="insert"> <input
						type="hidden" name="num" value="<%=bean.getNum()%>"> <input
						type="hidden" name="cid" value="<%=login.getId()%>"> <input
						type="hidden" name="cip" value="<%=request.getRemoteAddr()%>">
					</td>
				</tr>
			</table>
		</form>
		<!-- Comment From End -->
		<%
					}
				}
		%>
		<!-- GuestBook List End -->
	</div>
</body>
<%
	}
%>
</html>