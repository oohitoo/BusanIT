<%@page import="java.util.TimeZone"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String tzArr[] = TimeZone.getAvailableIDs();
	for(int i =0; i < tzArr.length; ++i){
		out.print(tzArr[i]);
		out.print("<br>");
	}
%>