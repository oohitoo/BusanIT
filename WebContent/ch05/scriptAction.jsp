<!-- scriptAction.jsp -->
<!-- SUN�� ��å�� jsp �ڵ忡 java�ڵ带 0%�� ����°� -->
<jsp:directive.page contentType="text/html; charset=EUC-KR" />
<jsp:declaration>
	public int max(int x, int y){
		return x > y? x:y;
	}
</jsp:declaration>
<jsp:scriptlet>
	int i = 22;
	int j = 23;
</jsp:scriptlet>

<h3><jsp:expression>max(i,j)</jsp:expression></h3>