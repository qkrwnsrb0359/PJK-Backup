<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*" %>
<%--
	1. idx�� ��й�ȣ �޾ƿ���
	2. �� üũ
	3. BbsManager��ü ���ͼ�
	4. mgr�� deleteOk(idx, pwd)ȣ��
	5. �� ����� ���� �޽��� ���.
--%>

<%
	//1. ����
	String idx = request.getParameter("idx");
	String pwd = request.getParameter("pwd");

	if(idx == null || pwd ==null ||idx.trim().equals("idx")||pwd.trim().equals("pwd")){
		response.sendRedirect("bbs_list.jsp");
		return;
	}
	idx = idx.trim();
	pwd = pwd.trim();
	
	System.out.println(idx+"==="+pwd);
	
	BbsManager mgr = BbsManager.getInstance();
	int n = mgr.deleteOk(idx,pwd);
	
	
	String url="", message="";
	
	if(n>0){
		url ="bbs_list.jsp";
		message = "���� ����";
		
	}else{

		message = "���� ����";
		url = "bbs_content.jsp?idx="+idx;	
	}
%>
<script type="text/javascript">
<!--
	alert("<%=message%>");
	location.href="<%=url%>";
-->
</script>

