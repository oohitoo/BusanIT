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
				<td><font color="#FFFFFF">제품</font></td>
				<td><font color="#FFFFFF">수량</font></td>
				<td><font color="#FFFFFF">가격</font></td>
				<td><font color="#FFFFFF">수정/삭제</font></td>
				<td><font color="#FFFFFF">조회</font></td>
			</tr>
			<%
				int total = 0;
				Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
				
				if(hCart.isEmpty()){
				%>
					<td colspan="5" align="center"> 장바구니 목록이 없습니다. </td>	
				<%
				}
				else{
					// 줄줄이 사탕 객체
					Enumeration<Integer> hCartKey = hCart.keys();
					// 요소 값이 더이상 있을때 까지
					while(hCartKey.hasMoreElements()){
						//hCart에 저장된 주문 객체를 return 
						OrderBean order = hCart.get(hCartKey.nextElement());
						int productNo = order.getProductNo();
						//상품 객체(상품 가격, 상품 이름)
						productBean pbean = pMgr.getproduct(productNo);
						int price = pbean.getPrice(); // 상품 가격
						int quantity = order.getQuantity(); // 주문 수량
						int subTotal = price * quantity; //상품 총액
						total += subTotal; //주문전체 총액
						String pName = pbean.getName();
					%>
					<tr>
						<form method="post" action="cartProc.jsp">
							<input type="hidden" name="productNo" value="<%= productNo%>">
							<input type="hidden" name="flag">
							<td><%= pName %></td>
							<td>
								<input name="quantity" value="<%= quantity%>" size="5">개
							</td>
							<td><%= UtilMgr.monFormat(subTotal) %></td>
							<td>
								<input type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)"> /
								<input type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
							</td>
							<td>
								<a href="javascript:productDetail('<%= productNo %>')">상세보기</a>
							</td>
						</form>
					</tr>
				<% } %>
				<tr>
					<td colspan="4" align="center">총 주문금액 : <%= UtilMgr.monFormat(total) %></td>
					<td align="center">
						<a href="orderProc.jsp">주문하기</a>
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