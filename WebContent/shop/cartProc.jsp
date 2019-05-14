<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="order" class="shop.OrderBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String id = (String)session.getAttribute("idKey");
	
	if(id == null){
		response.sendRedirect("login.jsp");
	}
	else{
		String flag = request.getParameter("flag");
		String msg = "";
		order.setId(id);
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg = "장바구니에 추가하였습니다.";
		}
		else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "장바구니에 수정하였습니다.";
		}
		else if(flag.equals("del")){
			cMgr.deleteCart(order);
			msg = "장바구니에 삭제하였습니다.";
		}
	
%>
<script>
	alert("<%= msg %>");
	location.href = "cartList.jsp";
</script>
<% } %>