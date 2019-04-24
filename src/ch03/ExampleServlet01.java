package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * URL Mappings
 */
@WebServlet("/ch03/exampleServlet01")
public class ExampleServlet01 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���� Page ���ڼ� ����
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		System.out.println("Tomcat console Writer");
		//HTML Start
		out.println("<html>");
		out.println("<body>");
		out.println("<h1> ��Ŭ������ ���� ����� </h1>");
		out.println("</body>");
		out.println("</html>");
		//HTML End
	}

}
