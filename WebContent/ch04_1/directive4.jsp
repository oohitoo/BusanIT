<!-- directive4.jsp -->
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="true"
		 buffer="8kb"
		 autoFlush="true"
		 isThreadSafe="true"
 %>
<% 
	Date d = new Date();
%>
<%= d.toLocaleString() %>