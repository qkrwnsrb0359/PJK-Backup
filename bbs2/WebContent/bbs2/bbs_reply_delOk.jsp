<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*"%>
<%
	String delPwd = request.getParameter("delPwd");
	String no = request.getParameter("no");
	// hidden���� �ѱ� idx�� �޾ƿ���.
	String idx = request.getParameter("idx");
	
	if(delPwd == null || delPwd.trim().equals("")){
	%>
		<script>
			alert("��й�ȣ�� �Է��� �ּ���!");
			location.href="bbs_content.jsp?idx=<%=idx%>";
		</script>
	<%	
	}
	
	if(delPwd == null || no == null || idx == null){
		out.println("delPwd or no or idx NULL");
		return;
	} //if -----------
	
	delPwd = delPwd.trim();
	no = no.trim();
	
	BbsManager mgr = BbsManager.getInstance();
	int result = mgr.replyDelPwd(no,delPwd); 
	
	String msg="", url="bbs_content.jsp?idx="+idx;
	
	if(result >0){
		msg ="������ ���� ����";
	}else{
		msg = "������ ���� ����";
	}
%>
<script type = "text/javascript">
	alert("<%=msg%>");
	location.href ="<%=url%>";
</script>