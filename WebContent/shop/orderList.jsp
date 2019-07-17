<%@page import="shop.productBean"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr" />
<jsp:useBean id="pMgr" class="shop.ProductMgr" />
<%
	if (session.getAttribute("idKey") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<html>
<head>
<title>Simple Shopping Mall</title>

<script src="script.js"></script>

<body bgcolor="#996600" topmargin="100">
<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%"  bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600" align="center"> 
		<td><font color="#FFFFFF">�ֹ���ȣ
		<td><font color="#FFFFFF">��ǰ
		<td><font color="#FFFFFF">�ֹ�����
		<td><font color="#FFFFFF">�ֹ���¥
		<td><font color="#FFFFFF">�ֹ�����
		
		<%Vector<OrderBean> vlist = orderMgr.getOrderList(id);
			if (vlist.isEmpty()) {%>
		<tr>
			<td colspan="5">
			�ֹ��Ͻ� ��ǰ�� �����ϴ�.
			
		
		<%} else {
				for (int i = 0; i < vlist.size(); i++) {
					OrderBean order = vlist.get(i);
					int productNo = order.getProductNo();
					productBean pbean = pMgr.getproduct(productNo);%>
						<tr align="center">
							<td><%=order.getNo()%>
							<td><%=pbean.getName()%></td>
							<td><%=order.getQuantity()%></td>
							<td><%=order.getDate()%></td>
							<td>
								<%switch (order.getState()) {
						case "1" :
							out.print("������");
							break;
						case "2" :
							out.print("����");
							break;
						case "3" :
							out.print("�Ա�Ȯ��");
							break;
						case "4" :
							out.print("����غ�");
							break;
						case "5" :
							out.print("�����");
							break;
						case "6" :
							out.print("�Ϸ�");
							break;
					} //switch%>
							</td>
						</tr>
		<%} // for
			} //if-else%>
		</table> 
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="productDetail.jsp" >
	<input type="hidden" name="no">
	</form>
</body>
</html>