<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*"%>
<%
	// 1. ����ڰ� �Է��� ������ �ޱ� �� ������.
	request.setCharacterEncoding("euc-kr");
	String writer = request.getParameter("reply_writer");
	String content = request.getParameter("reply_content");
	String pwd = request.getParameter("reply_pwd");
	// hidden���� �ѱ� idx�� �޾ƿ���.
	String idx = request.getParameter("idx");
	String cp = (String)session.getAttribute("cp");
	String ps = (String)session.getAttribute("ps");
	
	// 2. null check
	if(idx == null || idx.trim().equals("")){
		response.sendRedirect("bbs_list.jsp");	
		return;
	}
	
	// �����Ͻ� �޼ҵ� ȣ�� //////////////////////
	BbsManager mgr = BbsManager.getInstance();
	int result = mgr.replySave(idx,writer,content,pwd); 
	
	String msg="";
	String url = "bbs_content.jsp?idx="+idx+"&cp="+cp+"&ps="+ps;
	
	if(result>0){
		msg= "������ �ޱ� ����";
	}else{
		msg = "������ �ޱ� ����";
	}
%>
<script type="text/javascript">
<!--
	alert("<%=msg%>");
	location.href = "<%=url%>";
//-->
</script>
