<%@page import="shop.UtilMgr"%>
<%@page import="shop.productBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<% 
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
		}
%>
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600">
				<td><font color="#FFFFFF">��ǰ</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">����/����</font></td>
				<td><font color="#FFFFFF">��ȸ</font></td>
			</tr>
			<%
				int total = 0;
				Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
				
				if(hCart.isEmpty()){
				%>
					<td colspan="5" align="center"> ��ٱ��� ����� �����ϴ�. </td>	
				<%
				}
				else{
					// ������ ���� ��ü
					Enumeration<Integer> hCartKey = hCart.keys();
					// ��� ���� ���̻� ������ ����
					while(hCartKey.hasMoreElements()){
						//hCart�� ����� �ֹ� ��ü�� return 
						OrderBean order = hCart.get(hCartKey.nextElement());
						int productNo = order.getProductNo();
						//��ǰ ��ü(��ǰ ����, ��ǰ �̸�)
						productBean pbean = pMgr.getproduct(productNo);
						int price = pbean.getPrice(); // ��ǰ ����
						int quantity = order.getQuantity(); // �ֹ� ����
						int subTotal = price * quantity; //��ǰ �Ѿ�
						total += subTotal; //�ֹ���ü �Ѿ�
						String pName = pbean.getName();
					%>
					<tr>
						<form method="post" action="cartProc.jsp">
							<input type="hidden" name="productNo" value="<%= productNo%>">
							<input type="hidden" name="flag">
							<td><%= pName %></td>
							<td>
								<input name="quantity" value="<%= quantity%>" size="5">��
							</td>
							<td><%= UtilMgr.monFormat(subTotal) %></td>
							<td>
								<input type="button" value="����" size="3" onclick="javascript:cartUpdate(this.form)"> /
								<input type="button" value="����" size="3" onclick="javascript:cartDelete(this.form)">
							</td>
							<td>
								<a href="javascript:productDetail('<%= productNo %>')">�󼼺���</a>
							</td>
						</form>
					</tr>
				<% } %>
				<tr>
					<td colspan="4" align="center">�� �ֹ��ݾ� : <%= UtilMgr.monFormat(total) %></td>
					<td align="center">
						<a href="orderProc.jsp">�ֹ��ϱ�</a>
					</td>
				</tr>
				<%
				}
			%>
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