<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	pageContext.setAttribute("J", 31);
	pageContext.setAttribute("S", 8);
	pageContext.setAttribute("P", 22);
	
%>
<b>J = ${J}, S = ${S}, P = ${P}</b>
<b>산술연산자 </b> <hr width="250" align="left">
&#36;{J+S} : ${J+S}
&#36;{J-S} : ${J - S}
&#36;{J/S} : ${J / S}
&#36;{J*S} : ${J * S}
&#36;{J%S} : ${J % S}

<b>비교연산자</b> <hr width="250" align="left">
&#36;{J < S} : ${J lt S} <br> <!-- less than -->
&#36;{J > S} : ${J gt S} <br> <!-- greater than -->
&#36;{J <= S} : ${J le S} <br> 
&#36;{J >= S} : ${J ge S} <br>
&#36;{J >= S} : ${J eq S} <br>
&#36;{J >= S} : ${J ne S} <br> 

<b>논리 및 조건 연산자</b> <hr width="250" align="left">
&#36;{J > S & P < S} : ${J > P and P < S} <br>
&#36;{J > S || P < S} : ${J > P or P < S} <br>
&#36;{!(P == S)} : ${not(P==S)} <br>
&#36;{(J==S) ? "같다" : "다르다"} : ${(J==S)? "같다" : "다르다"} <br>