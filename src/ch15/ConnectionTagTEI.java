package ch15;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

//Helper 클래스 : 스크립트 변수에 관한 정보를 제공하는 클래스

public class ConnectionTagTEI extends TagExtraInfo{
	@Override
	public VariableInfo[] getVariableInfo(TagData data) {
		VariableInfo vInfo = new VariableInfo(data.getAttributeString
				("id"), "ch15.DBConnection", true, VariableInfo.AT_BEGIN);
		// 시작 태그 이후 부터 JSP사용
		VariableInfo[] vInfoArray = {vInfo};
		return vInfoArray;
	}
}
