<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*" %>

 <%
 	request.setCharacterEncoding("euc-kr");
 	
 	BbsManager mgr = BbsManager.getInstance();
 	int result = mgr.editOk(request);
 	String msg="", url="bbs_list.jsp";
 	
 	if(result >0){
 		msg = "�� ���� ����";
 	}else{
 		msg ="�� ���� ���� ! ��й�ȣ Ȯ�� �ٶ�.";
 		url="javascript:history.go(-1)";
 	}
 %>
 <script type="text/javascript">
 <!--
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 //-->
 </script>