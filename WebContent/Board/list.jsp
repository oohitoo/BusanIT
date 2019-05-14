<%@page import="Board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0; //�� �Խù� ��	
	int numPerpage = 10; //�������� ���ڵ� �� 5, 10, 15, 30
	int pagePerBlock = 15; // ���� ������ �� -> �ؿ� 15�� ǥ�����ִ°�
	int totalPage = 0; // �������� �� = (�ø�) �� ������ �� / �������� ���ڵ� ��
	int totalBlock = 0; // �� �� �� = (�ø�)�� ������ �� / ���� ������ ��
	int nowPage = 1; // ���� ������
	int nowBlock = 1; // ���� ��
		
	//page�� ������ �Խù� ���� ��
	if (request.getParameter("numPerpage") != null &&
		!request.getParameter("numPerpage").equals("null")) {
		numPerpage = Integer.parseInt(request.getParameter("numPerpage"));		
	}

	/* Limit �� ���� ������ */
	int start = 0; //tblBoard �� select ���۹�ȣ
	int end = numPerpage;
	/* Limit �� ���� ������ �� */

	//�˻��� �ʿ��� ��
	String KeyField = "", KeyWord = "";

	//�˻� �϶�
	if (request.getParameter("KeyWord") != null) {
		KeyField = request.getParameter("KeyField");
		KeyWord = request.getParameter("KeyWord");
	}

	//�˻� �� �ٽ� �˻� �ȵ� ������ ��û
	if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
		KeyField = "";
		KeyWord = "";
	}

	totalRecord = mgr.getTotalTitle(KeyField, KeyWord);

	//nowPage�� ��û�� ���, ���� ��û���� ������ default ���� 0 �̴�.
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerpage) - numPerpage; // (1 * 10) - 10 = 0 || (2 * 10) - 10 = 10

	//��ü ������ ��
	totalPage = (int) Math.ceil((double) totalRecord / numPerpage);
	//��ü �� ��
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
	//������� 
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

	// �������� �� = (�ø�) �� ������ �� / �������� ���ڵ� ��
	totalPage = (int) Math.ceil((double) totalRecord / numPerpage);
%>
<html>
<head>
<title>JSPBoard</title>
</head>
<link href="../guestbook/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function paging(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value = <%=pagePerBlock%> * (block - 1) + 1;
		document.readFrm.submit();
	}
	function check() {
		if(document.searchFrm.KeyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			return;
		}
		document.searchFrm.submit();
	}
	
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function numPerFn(numPerpage) {
		document.readFrm.numPerpage.value = numPerpage;
		console.log(document.readFrm.numPerpage.value = numPerpage);
		document.readFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = 'read.jsp';
		document.readFrm.submit();
	}
</script>
<body bgcolor="#FFFFCC">
	<div align="center">
		<p />
		<h2>JSPBoard</h2>
		<table width=700>
			<tr>
				<td width="700">Total : <%=totalRecord%> Articles (<font
					color="red"><%=nowPage + "/" + totalPage%></font>)
				</td>
				<td align="right">
					<form name="npFrm" method="post">
						<select name="numPerpage" size="1" onchange="numPerFn(this.form.numPerpage.value)">
							<option value="5">5�� ����</option>
							<option value="10" selected>10�� ����</option>
							<option value="15">15�� ����</option>
							<option value="30">30�� ����</option>
						</select>
					</form>
					
					<script>
						document.npFrm.numPerpage.value="<%=numPerpage%>";
					</script>
					
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td align="center" colspan="2">
					<%
					Vector<BoardBean> vlist = mgr.getBoardList(KeyField, KeyWord, start, end);
					int listSize = vlist.size(); //������ ȭ�鿡 ������ �Խù� ��ȣ
					if (vlist.isEmpty()) {
						out.println("��ϵ� �Խù��� �����ϴ�.");
					}
					else {
				%>
					<table cellspacing="0">
						<tr align="center" bgcolor="#D0D0D0">
							<td width="100">�� ȣ</td>
							<td width="250">�� ��</td>
							<td width="100">�� ��</td>
							<td width="150">�� ¥</td>
							<td width="100">��ȸ��</td>
						</tr>
						<%
							for (int i = 0; i < numPerpage; ++i) {
									if (listSize == i) break;
									BoardBean bean = vlist.get(i);
									int num = bean.getNum();
									String subject = bean.getSubject();
									String name = bean.getName();
									String regdate = bean.getRegdate();
									int depth = bean.getDepth();
									int count = bean.getCount();
									String filename = bean.getFilename();
						%>
						<tr align="center">
							<td><%= totalRecord-((nowPage-1) * numPerpage)-i %></td>
							<td align="left">
								<!-- ��� �ϴ� �κ� -->
								<% 
									if(depth > 0){
										for(int j =0; j < depth; j++){
											out.println("&nbsp;&nbsp;");
										}
								}%>
								<a href="javascript:read('<%= num%>')"><%= subject %></a>
								<!-- ÷������ �������°� �ϴ� �̹��� �κ� -->
								<% if(filename != null && !filename.equals("")){%>
								<img alt="���Ͼ���" src="img/icon_file.gif" align="middle">
								<%}%>
							</td>
							<td><%= name %></td>
							<td><%= regdate %></td>
							<td><%= count %></td>
						</tr>
						<% } %>
					</table> <%
					}
				%>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br><br></td>
			</tr>
			<tr>
				<td>
					<%
						// ����¡�� ǥ�õ� ���ۺ��� �� ������ ����
						int pageStart = (nowBlock - 1) * pagePerBlock + 1;
						int pageEnd = ((pageStart+pagePerBlock)<=totalPage)?(pageStart+pagePerBlock):totalPage+1;
						if (totalPage != 0) {
					%>
					<!-- ������ -->
					<% 		if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock + -1%>)">prev...</a>
					<% 		} %>
					<!-- ����¡ -->
					<%
							for (; pageStart<pageEnd;pageStart++) {
					%>
								<a href="javascript:paging(<%= pageStart %>)">
								<% if (nowPage == pageStart) { %><font color="red"> <%} %>
								[<%= pageStart %>]</a>
								<% if(nowPage == pageStart) {%></font><%} %>
					<%  	} %>&nbsp;
					
					<!-- ������ -->
					<% 		if (totalBlock > nowBlock) { %>
								<a href="javascript:block(<%= nowBlock + 1%>)">...next</a>
					<% 		} %>
					<% } %>
				</td>
				<td align="right">
					<a href="post.jsp">[�۾���]</a>
					<a href="javascript:list()">[ó������]</a>
				</td>
			</tr>
		</table>

		<hr width="750">
		
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>

		<form name="searchFrm" method="post" action="list.jsp">
			<table width="527" align=center cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom">
						<select name="KeyField" size="1">
							<option value="name">�� ��</option>
							<option value="subject">�� ��</option>
							<option value="content">�� ��</option>
						</select>
						
						<input size="16" name="KeyWord">
						<input type="button" value="ã��" onClick="javascript:check()">
						<input type="hidden" name="nowPage" value="1">
					</td>
				</tr>
			</table>
		</form>

		<form name="readFrm">
			<input type="hidden" name="num" />
			<input type="hidden" name="nowPage" value="<%= nowPage %>" />
			<input type="hidden" name="KeyField" value="<%= KeyField %>" />
			<input type="hidden" name="KeyWord" value="<%= KeyWord %>" />
			<input type="hidden" name="numPerpage" value="<%= numPerpage %>" />
		</form>

	</div>
</body>
</html>