<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<!-- !������ ���� java ���� -->
<%! // ���� ����
	String declaration = "����";
	
	public String decMethod(){
		return declaration;
	}
%>
<% // ��ũ��Ʈ��
	String scriptlet = "��ũ��Ʈ ��";
	String comment = "�ּ�";
	
	//���尴ü cosole.logó�� �����°� 
	out.println("���尴ü�� �̿��� ��� : " +  declaration + "<p/>");
%>

������ ��� 1 : <%= declaration %> <p/>
������ ��� 2 : <%= decMethod() %> <p/>
��ũ��Ʈ���� ��� : <%= scriptlet %> <p/>