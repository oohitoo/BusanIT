<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String cookieName = "myCookie";
	Cookie cookie = new Cookie(cookieName, "apply");
	// 60 초 생명주기
	cookie.setMaxAge(60);
	cookie.setValue("Melone");
	
	response.addCookie(cookie);
%>

쿠키를 만듭니다. <br>
쿠키 내용은 <a href="tasteCookie.jsp">여기로</a>!!!