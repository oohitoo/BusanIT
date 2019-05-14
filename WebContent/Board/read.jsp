<%@page import="Board.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="Board.BoardBean"%>
<jsp:useBean id="mgr" class="Board.BoardMgr" />

<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("KeyField");
	  String keyWord = request.getParameter("KeyWord");
	  String numPerPage = request.getParameter("numPerpage");

	  //조회수 증가
	  mgr.upConut(num);
	  
	  //게시물 읽어오기
	  BoardBean bean = mgr.getBoard(num);
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  
	  session.setAttribute("bean", bean);
%>
<html>
<head>
<title>JSP Board</title>
<link href="../guestbook/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function down(filename){
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
  <td bgcolor="#FFFFE8"><%= name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%">등록날짜</td>
  <td bgcolor="#FFFFE8"><%= regdate %></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 제 목</td>
    <td bgcolor="#FFFFE8" colspan="3"><%= subject %></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
     	<%
     		if(filename != null && !filename.equals("")){
     		%>
     			<a href="javascript:down('<%= filename%>')"><%=filename %></a>&nbsp;&nbsp;
     			<font color="blue">(<%= UtilMgr.getKBytes(filesize) %>Bytes)</font>
     		<%}	

     		else{
     			out.print("등록된 파일이 없습니다.");	
     		}
     	%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%= content %></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
    	<%= ip %>로 부터 글을 남기셨습니다. / 조회수 <%= count %>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <a href="update2.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정2</a> |
 <a href="reply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
  </td>
 </tr>
</table>
	<form name ="downFrm" action="download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	<form name ="listFrm">
		<input type="hidden" name="nowPage" value="<%= nowPage %>">
		<input type="hidden" name="numPerPage" value="<%= numPerPage %>">
		<% if(!(keyWord == null || keyWord.equals(""))){ %>
			<input type="hidden" name="keyField" value="<%= keyField %>">
			<input type="hidden" name="numPerPage" value="<%= numPerPage %>">	
		<%} %>
	</form>
</body>
</html>