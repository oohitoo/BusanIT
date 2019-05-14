<%@page import="Board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	
	int totalRecord = 0; //총 게시물 수	
	int numPerpage = 10; //페이지당 레코드 수 5, 10, 15, 30
	int pagePerBlock = 15; // 블럭당 페이지 수 -> 밑에 15개 표시해주는거
	int totalPage = 0; // 총페이지 수 = (올림) 총 페이지 수 / 페이지당 레코드 수
	int totalBlock = 0; // 총 블럭 수 = (올림)총 페이지 수 / 블럭당 페이지 수
	int nowPage = 1; // 현재 페이지
	int nowBlock = 1; // 현재 블럭
		
	//page에 보여질 게시물 갯수 값
	if (request.getParameter("numPerpage") != null &&
		!request.getParameter("numPerpage").equals("null")) {
		numPerpage = Integer.parseInt(request.getParameter("numPerpage"));		
	}

	/* Limit 에 들어가는 숫자임 */
	int start = 0; //tblBoard 에 select 시작번호
	int end = numPerpage;
	/* Limit 에 들어가는 숫자임 끝 */

	//검색에 필요한 값
	String KeyField = "", KeyWord = "";

	//검색 일때
	if (request.getParameter("KeyWord") != null) {
		KeyField = request.getParameter("KeyField");
		KeyWord = request.getParameter("KeyWord");
	}

	//검색 후 다시 검색 안된 페이지 요청
	if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
		KeyField = "";
		KeyWord = "";
	}

	totalRecord = mgr.getTotalTitle(KeyField, KeyWord);

	//nowPage를 요청한 경우, 만약 요청하지 않으면 default 값이 0 이다.
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerpage) - numPerpage; // (1 * 10) - 10 = 0 || (2 * 10) - 10 = 10

	//전체 페이지 수
	totalPage = (int) Math.ceil((double) totalRecord / numPerpage);
	//전체 블럭 수
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
	//현재블럭값 
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

	// 총페이지 수 = (올림) 총 페이지 수 / 페이지당 레코드 수
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
			alert("검색어를 입력하세요.");
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
							<option value="5">5개 보기</option>
							<option value="10" selected>10개 보기</option>
							<option value="15">15개 보기</option>
							<option value="30">30개 보기</option>
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
					int listSize = vlist.size(); //브라우저 화면에 보여질 게시물 번호
					if (vlist.isEmpty()) {
						out.println("등록된 게시물이 없습니다.");
					}
					else {
				%>
					<table cellspacing="0">
						<tr align="center" bgcolor="#D0D0D0">
							<td width="100">번 호</td>
							<td width="250">제 목</td>
							<td width="100">이 름</td>
							<td width="150">날 짜</td>
							<td width="100">조회수</td>
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
								<!-- 답글 하는 부분 -->
								<% 
									if(depth > 0){
										for(int j =0; j < depth; j++){
											out.println("&nbsp;&nbsp;");
										}
								}%>
								<a href="javascript:read('<%= num%>')"><%= subject %></a>
								<!-- 첨부파일 보여지는게 하는 이미지 부분 -->
								<% if(filename != null && !filename.equals("")){%>
								<img alt="파일없음" src="img/icon_file.gif" align="middle">
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
						// 페이징에 표시될 시작변수 및 마지막 변수
						int pageStart = (nowBlock - 1) * pagePerBlock + 1;
						int pageEnd = ((pageStart+pagePerBlock)<=totalPage)?(pageStart+pagePerBlock):totalPage+1;
						if (totalPage != 0) {
					%>
					<!-- 이전블럭 -->
					<% 		if (nowBlock > 1) { %>
								<a href="javascript:block(<%= nowBlock + -1%>)">prev...</a>
					<% 		} %>
					<!-- 페이징 -->
					<%
							for (; pageStart<pageEnd;pageStart++) {
					%>
								<a href="javascript:paging(<%= pageStart %>)">
								<% if (nowPage == pageStart) { %><font color="red"> <%} %>
								[<%= pageStart %>]</a>
								<% if(nowPage == pageStart) {%></font><%} %>
					<%  	} %>&nbsp;
					
					<!-- 다음블럭 -->
					<% 		if (totalBlock > nowBlock) { %>
								<a href="javascript:block(<%= nowBlock + 1%>)">...next</a>
					<% 		} %>
					<% } %>
				</td>
				<td align="right">
					<a href="post.jsp">[글쓰기]</a>
					<a href="javascript:list()">[처음으로]</a>
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
							<option value="name">이 름</option>
							<option value="subject">제 목</option>
							<option value="content">내 용</option>
						</select>
						
						<input size="16" name="KeyWord">
						<input type="button" value="찾기" onClick="javascript:check()">
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