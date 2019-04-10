<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
		
	boolean result = true;
	if(result == true){
		// 로그인 성공
		// 세션 객체에 로그인 정보를 저장 (키, 전달받은값)
		session.setAttribute("idKey", id);
		// 3분뒤에 자동으로 세션 삭제
		session.setMaxInactiveInterval(60*3); 
	}else{
		// 로그인 실패
		%>
		<script>
			alert("로그인 실패입니다.");
			location.href = "session1.html";
		</script>
		<%
	}
%>
<h1>Session Example1</h1>
<FORM METHOD=POST ACTION="session2.jsp">
    1.가장 좋아하는 계절은?<br>
	<INPUT TYPE="radio" NAME="season" VALUE="봄">봄
	<INPUT TYPE="radio" NAME="season" VALUE="여름">여름
	<INPUT TYPE="radio" NAME="season" VALUE="가을">가을
	<INPUT TYPE="radio" NAME="season" VALUE="겨울">겨울<p>

	2.가장 좋아하는 과일은?<br>
	<INPUT TYPE="radio" NAME="fruit" VALUE="watermelon">수박
	<INPUT TYPE="radio" NAME="fruit" VALUE="melon">멜론
	<INPUT TYPE="radio" NAME="fruit" VALUE="apple">사과
	<INPUT TYPE="radio" NAME="fruit" VALUE="orange">오렌지<p>
	<INPUT TYPE="submit" VALUE="결과보기">
</FORM>