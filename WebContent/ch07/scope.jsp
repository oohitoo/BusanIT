<%@page import="ch07.ScopeBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="pBean" scope="page" class="ch07.ScopeBean" />
<jsp:useBean id="sBean" scope="session" class="ch07.ScopeBean" />

<%
	ScopeBean sBean1 =new ScopeBean();
	/* 세션.속성(키값, 가지고 있는 값) */
	session.setAttribute("sBean1", sBean1);
%>

<jsp:setProperty property="num" name="pBean" value="<%= pBean.getNum()+10 %>"/>
pbean : <%= pBean.getNum()%>
<jsp:setProperty property="num" name="sBean" value="<%= sBean.getNum()+10 %>"/>
pbean : <%= sBean.getNum()%>