/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.8
 * Generated at: 2019-05-15 02:15:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.shop.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import shop.*;

public final class orderDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/shop/admin/top.jsp", Long.valueOf(1557880068303L));
    _jspx_dependants.put("/shop/admin/bottom.jsp", Long.valueOf(1557880068280L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("shop");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      shop.OrderMgr orderMgr = null;
      orderMgr = (shop.OrderMgr) _jspx_page_context.getAttribute("orderMgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (orderMgr == null){
        orderMgr = new shop.OrderMgr();
        _jspx_page_context.setAttribute("orderMgr", orderMgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      shop.ProductMgr pMgr = null;
      pMgr = (shop.ProductMgr) _jspx_page_context.getAttribute("pMgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (pMgr == null){
        pMgr = new shop.ProductMgr();
        _jspx_page_context.setAttribute("pMgr", pMgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');

		request.setCharacterEncoding("EUC-KR");
		int no = Integer.parseInt(request.getParameter("no"));
		OrderBean order = orderMgr.getOrderDetail(no);
		productBean product = pMgr.getproduct(order.getProductNo());

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Simple Shopping Mall Admin</title>\r\n");
      out.write("<link href=\"../style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script src=\"script.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#996600\" topmargin=\"100\">\r\n");
      out.write('\r');
      out.write('\n');

    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("adminLogin.jsp");
	}

      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("  <tr bgcolor=\"#FFCC00\"> \r\n");
      out.write("    <th><a href=\"../index.jsp\">홈</a></th>\r\n");
      out.write("    <th><a href=\"adminLogout.jsp\">로그아웃</a></th>\r\n");
      out.write("    <th><a href=\"memberMgr.jsp\">회원관리</a></th>\r\n");
      out.write("    <th><a href=\"productMgr.jsp\">상품관리</a></th>\r\n");
      out.write("    <th><a href=\"orderMgr.jsp\">주문관리</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table> ");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\" bgcolor=\"#FFFFCC\">\r\n");
      out.write("\t\t<form method=\"post\" name=\"order\" action=\"orderProc.jsp\">\r\n");
      out.write("\t\t<table width=\"95%\" align=\"center\" bgcolor=\"#FFFF99\" border=\"1\">\r\n");
      out.write("\t\t\t<tr bgcolor=\"#996600\">\r\n");
      out.write("\t\t\t\t<td colspan=\"2\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t<font color=\"#FFFFFF\">주문상세내역</font>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>고객아이디</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(order.getId());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>주문번호</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(order.getNo());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>제품번호</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(product.getNo());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>제품이름</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(product.getName());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>제품가격</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(UtilMgr.intFormat(product.getPrice()));
      out.write("원</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>주문수량</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(order.getQuantity() + "");
      out.write("개</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>재고수량</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(product.getStock());
      out.write("개</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>주문날짜</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(order.getDate());
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>금액</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print(UtilMgr.intFormat(order.getQuantity() * product.getPrice()));
      out.write("원</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td>주문상태</td>\r\n");
      out.write("\t\t\t\t<td><select name=\"state\">\r\n");
      out.write("\t\t\t\t\t<option value=\"1\">접수중</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"2\">접수</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"3\">입금확인</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"4\">배송준비</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"5\">배송중</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"6\">완료</option>\r\n");
      out.write("\t\t\t\t</select> <script>\r\n");
      out.write("\t\t\tdocument.order.state.value=");
      out.print(order.getState());
      out.write("\r\n");
      out.write("\t\t</script></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr align=\"center\">\r\n");
      out.write("\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t<input type=\"button\" value=\"수정\"\r\n");
      out.write("\t\t\t\t\tsize=\"3\" onclick=\"javascript:orderUpdate(this.form)\"> / <input\r\n");
      out.write("\t\t\t\t\ttype=\"button\" value=\"삭제\" size=\"3\"\r\n");
      out.write("\t\t\t\t\tonclick=\"javascript:orderDelete(this.form)\">\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"no\" value=\"");
      out.print(order.getNo());
      out.write("\"> <input\r\n");
      out.write("\t\t\ttype=\"hidden\" name=\"flag\">\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("  <tr bgcolor=\"#FFCC00\"> \r\n");
      out.write("  <th>\r\n");
      out.write("  \tSimple Shopping Mall 관리자 페이지 입니다.\r\n");
      out.write("  </th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table> ");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
