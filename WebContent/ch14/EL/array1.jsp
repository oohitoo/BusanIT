<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String study[] = {"Java","JSP","Android","Spring"};
	pageContext.setAttribute("study", study);
	
	ArrayList<String> family = new ArrayList<>();
	String names[] = {"이재필","박용민","최경주","전승진"};
	
	for(int i =0; i <names.length; ++i){
		family.add(names[i]);
	}
	pageContext.setAttribute("Family", family);
%>
<h3>Java의 프로그램 과목</h3>
${study[0]}<br>
${study[1]}<br>
${study[2]}<br>
${study[3]}<br>

<h3>가족리스트</h3>
${family[0]}<br>
${family[1]}<br>
${family[2]}<br>
${family[3]}<br>