<%@page import="ch07.ScopeBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="pBean" scope="page" class="ch07.ScopeBean" />
<jsp:useBean id="sBean" scope="session" class="ch07.ScopeBean" />

<%
	ScopeBean sBean1 =new ScopeBean();
	/* ����.�Ӽ�(Ű��, ������ �ִ� ��) */
	session.setAttribute("sBean1", sBean1);
%>

<jsp:setProperty property="num" name="pBean" value="<%= pBean.getNum()+10 %>"/>
pbean : <%= pBean.getNum()%>
<jsp:setProperty property="num" name="sBean" value="<%= sBean.getNum()+10 %>"/>
pbean : <%= sBean.getNum()%>