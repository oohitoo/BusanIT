<%@ page contentType="text/html; charset=EUC-KR" %>
<%
	pageContext.setAttribute("J", 31);
	pageContext.setAttribute("S", 8);
	pageContext.setAttribute("P", 22);
	
%>
<b>J = ${J}, S = ${S}, P = ${P}</b>
<b>��������� </b> <hr width="250" align="left">
&#36;{J+S} : ${J+S}
&#36;{J-S} : ${J - S}
&#36;{J/S} : ${J / S}
&#36;{J*S} : ${J * S}
&#36;{J%S} : ${J % S}

<b>�񱳿�����</b> <hr width="250" align="left">
&#36;{J < S} : ${J lt S} <br> <!-- less than -->
&#36;{J > S} : ${J gt S} <br> <!-- greater than -->
&#36;{J <= S} : ${J le S} <br> 
&#36;{J >= S} : ${J ge S} <br>
&#36;{J >= S} : ${J eq S} <br>
&#36;{J >= S} : ${J ne S} <br> 

<b>�� �� ���� ������</b> <hr width="250" align="left">
&#36;{J > S & P < S} : ${J > P and P < S} <br>
&#36;{J > S || P < S} : ${J > P or P < S} <br>
&#36;{!(P == S)} : ${not(P==S)} <br>
&#36;{(J==S) ? "����" : "�ٸ���"} : ${(J==S)? "����" : "�ٸ���"} <br>