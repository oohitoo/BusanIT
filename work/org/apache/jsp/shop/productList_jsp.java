/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.8
 * Generated at: 2019-05-14 05:05:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import shop.UtilMgr;
import shop.productBean;
import java.util.Vector;

public final class productList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/shop/bottom.jsp", Long.valueOf(1557709920603L));
    _jspx_dependants.put("/shop/top.jsp", Long.valueOf(1557709920668L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Vector");
    _jspx_imports_classes.add("shop.productBean");
    _jspx_imports_classes.add("shop.UtilMgr");
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
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!-- ProductList.jsp -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      shop.ProductMgr pMgr = null;
      pMgr = (shop.ProductMgr) _jspx_page_context.getAttribute("pMgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (pMgr == null){
        pMgr = new shop.ProductMgr();
        _jspx_page_context.setAttribute("pMgr", pMgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');

	Vector<productBean> pvlist =pMgr.getproductlist();	

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Simple Shopping Mall</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script src=\"script.js\">\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#996600\" topmargin=\"100\">\r\n");
      out.write("\t");
      out.write('\r');
      out.write('\n');

	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>로그인</a>";
	else log = "<a href=logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>회원가입</a>";
	else reg = "<a href=memberUpdate.jsp>회원수정</a>";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("  <tr bgcolor=\"#FFCC00\"> \r\n");
      out.write("    <th>");
      out.print(log);
      out.write("</th>\r\n");
      out.write("    <th>");
      out.print(reg);
      out.write("</th>\r\n");
      out.write("    <th><a href=\"productList.jsp\">상품목록</a></th>\r\n");
      out.write("    <th><a href=\"cartList.jsp\">장바구니</a></th>\r\n");
      out.write("    <th><a href=\"orderList.jsp\">구매목록</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\t<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("\t<tr> \r\n");
      out.write("\t<td align=\"center\" bgcolor=\"#FFFFCC\">\r\n");
      out.write("\t\t<table width=\"95%\" bgcolor=\"#FFFF99\" border=\"1\">\r\n");
      out.write("\t\t\t<tr align=\"center\" bgcolor=\"#996600\"> \r\n");
      out.write("\t\t\t\t<td><font color=\"#FFFFFF\">이름</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=\"#FFFFFF\">가격</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=\"#FFFFFF\">날짜</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=\"#FFFFFF\">재고</font></td>\r\n");
      out.write("\t\t\t\t<td><font color=\"#FFFFFF\">상세보기</font></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t");
 
			for(int i =0; i < pvlist.size(); ++i){
				productBean pbean = pvlist.get(i);
		
      out.write("\r\n");
      out.write("\t\t\t<tr align=\"center\"> \r\n");
      out.write("\t\t\t\t<td>");
      out.print( pbean.getName() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( UtilMgr.monFormat(pbean.getPrice()) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( pbean.getDate() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( UtilMgr.monFormat(pbean.getStock()) );
      out.write("</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"button\" value=\"상세보기\" onclick=\"productDetail('");
      out.print( pbean.getNo() );
      out.write("')\" >\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t");

			}
		
      out.write("\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<form name=\"detail\" method=\"post\" action=\"productDetail.jsp\" >\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"no\">\r\n");
      out.write("\t</form>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("  <tr bgcolor=\"#FFCC00\">\r\n");
      out.write("  <th width=\"90%\">\r\n");
      out.write("  Simple Shopping Mall 에 오신 것을 환영합니다.\r\n");
      out.write("  </th>\r\n");
      out.write("  <th><a href=\"admin/Index.jsp\">관리자</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>");
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
