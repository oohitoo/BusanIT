package ch15;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

//Helper Ŭ���� : ��ũ��Ʈ ������ ���� ������ �����ϴ� Ŭ����

public class ConnectionTagTEI extends TagExtraInfo{
	@Override
	public VariableInfo[] getVariableInfo(TagData data) {
		VariableInfo vInfo = new VariableInfo(data.getAttributeString
				("id"), "ch15.DBConnection", true, VariableInfo.AT_BEGIN);
		// ���� �±� ���� ���� JSP���
		VariableInfo[] vInfoArray = {vInfo};
		return vInfoArray;
	}
}
