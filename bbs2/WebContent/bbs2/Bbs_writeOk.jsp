<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	BbsManager mgr = BbsManager.getInstance();
	MultipartRequest mr = null;
	
	try{
		//web2/bbs2/Upload/�ȿ� ���ε�
		String upDir = application.getRealPath("/bbs2/Upload");
		// ServletContextŸ���� ���尴ü : application
		File up = new File(upDir);
		
		if(up != null){
			up.mkdir();
		}
		mr = new MultipartRequest(request,upDir,10*1024*1024,"euc-kr",new DefaultFileRenamePolicy());
		
	}catch(IOException e){
%>
	<b>���� ���ε� ����!</b>
<%
		e.getStackTrace();
	}
	
	int result = mgr.writeOk(mr);
	String msg = "�۾��� ";
	String url = request.getContextPath()+"/bbs2/bbs_list.jsp";
	
	if(result>0){
		msg +="����!";
	}else{
		msg +="����!";
		url = request.getContextPath()+"/bbs2/bbs_write.jsp";
	}
%>	
<script type = "text/javascript">
<!--
	alert("<%=msg%>");
	location.href=request.getContextPath() + "/bbs2/bbs_write.jsp";
-->
</script>



