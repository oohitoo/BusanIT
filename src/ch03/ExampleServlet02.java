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
@WebServlet("/ch03/exampleServlet02")
public class ExampleServlet02 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답 Page 문자셋 설정
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		System.out.println("Tomcat console Writer");
		//HTML Start
		out.println("<html>");
		out.println("<body>");
		out.println("<h1> URL mapping을 web.xml setting </h1>");
		out.println("</body>");
		out.println("</html>");
		//HTML End
	}

}
