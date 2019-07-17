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
			alert("내용을 입력해 주세요");
			frm.comment.focus();
			return;
		}
		frm.submit();
	}
	function disFn(num) {
		console.log("호출됨");
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
				<td><font size="2"><b><%=login.getName()%> 님 환영합니다!</b></font></td>
				<td align="right"><a href="logout.jsp">로그아웃</a></td>
			</tr>
		</table>
		<!-- GuestBook List Start -->
		<%
			if (vlist.isEmpty()) {
		%>
		<table width="520" cellspacing="0" cellpadding="7">
			<tr>
				<td>등록된 글이 없습니다.</td>
			</tr>
		</table>
		<%
			} else {
					for (int i = 0; i < vlist.size(); ++i) {
						// 게시글
						guestbookBean bean = vlist.get(i);
						// 방명록 쓴 사람의 정보
						JoinBean writer = mgr.getJoin(bean.getId());
		%>
		<table width="520" border="1" bordercolor="#000000" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="100%">
					<table bgcolor="#F5F5F5">
						<tr>
							<td width="225">No. <%= vlist.size()-i %></td>
							<td width="225"><img src="img/face.bmp" alt="없냐"><%= writer.getName() %></td>
							<td width="150" align="center">
								<%
								if(writer.getHp() == null || writer.getHp().equals("")){
									out.print("홈페이지가 없네요.");
								}
								else{
									%> <a href="http://<%= writer.getHp() %>"> <img
									src="img/hp.bmp" alt="이미지 없다" border="1">
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
									//로그인 id와 방명록 쓴 사람의 id와 동일 하다면 수정 삭제 활성화
									boolean chk = login.getId().equals(writer.getId());
								
									if(chk || login.getGrade().trim().equals("1")){
										if(chk){
											%> <a href="javascript:updateFn('<%= bean.getNum() %>')">[수정]</a>
								<%
										}
										%> <a href="deleteGuestBook.jsp?num=<%= bean.getNum()%>">[삭제]</a>
								<%		
										if(bean.getSecret().trim().equals("1")){
											out.print("비밀글");
										}
									}
								%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- 방명록 리스트, 댓글 입력폼, 댓글 리스트 -->
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
									href="commentProc.jsp?flag=delete&cnum=<%= cbean.getCnum()%>">[삭제]</a>
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
						댓글<%= cvlist.size() %></button></td>
			</tr>
		</table>
		<!-- Comment List End -->

		<!-- Comment From Start -->
		<form name="cFrm" action="commentProc.jsp">
			<table>
				<tr>
					<td><textarea name="comment" cols="72" rows="2"
							maxlength="1000" style="resize: none;"></textarea></td>
					<td><input type="button" value="댓글"
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