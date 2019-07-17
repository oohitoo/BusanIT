package ch15;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ConnectionTag extends SimpleTagSupport{
	
	private String id;
		
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		try {
			getJspContext().setAttribute(id, new DBConnection());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
