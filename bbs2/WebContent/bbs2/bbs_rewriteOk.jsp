<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>

 <%
 	request.setCharacterEncoding("euc-kr");	
 
 	BbsManager mgr = BbsManager.getInstance();
 	MultipartRequest mr = null;
 	String upDir = application.getRealPath("/bbs2/Upload");
 	out.println(upDir);
 	//������ ���.
 	
 	try{
 		mr = new MultipartRequest(request, upDir, 10*1024*1024, "euc-kr", new DefaultFileRenamePolicy());	
 		
 	
 	
 	}catch(Exception e){
 	%>
 		<b>���� ÷�� ����</b>
 	<% 
 		e.printStackTrace();
 		return;
 	} 
 	//�����Ͻ� �޼ҵ� ȣ�� ////////////////////////////
 	int result = mgr.rewriteOk(mr);  
 	String cp = mr.getParameter("cp");
 	String ps = mr.getParameter("ps");
 	
 	String msg ="", url="bbs_list.jsp?cp="+cp+"&ps="+ps;
 	
 	if(result>0){
 		msg ="��� ���� ����!";
 	}else{
 		msg="��� ���� ����!";
 	}
 	
 	//////////////////////////////////////////////////
 %>
 <<script type="text/javascript">
<!--
	alert("<%=msg%>");
	location.href="<%=url%>";
//-->
</script>
    