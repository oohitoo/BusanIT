<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<head>
<meta http-equiv="refresh" content="1">
</head>
<h1>Table 을 이용하여 구구단을 만들어 봅시다.</h1>
<%!
		public String randomColor(){
			Random r = new Random();
			String rgb = Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		rgb += Integer.toHexString(r.nextInt(256));
	 		return "#"+rgb;
		}
%>
<style>
      table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
      }
      th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align: center;
      }
    </style>
<table border="1">
	<%
			for(int i=0; i<=9; i++){
				%><tr bgcolor="#9575139"><%
				for(int j = 2; j < 10; j++){
					if(i == 0){
						out.print("<th>" + j +"단</th>");
					}else{
						%>
	<td bgcolor="#808080">
	<font color=<%=randomColor()%>><%= j %> X <%= i %> = <%=i * j %></font>
	</td>
	<%
					}
				}
				%></tr><%
			}
						%>

</table>
