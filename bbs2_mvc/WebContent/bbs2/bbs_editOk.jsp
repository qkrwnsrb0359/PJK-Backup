<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*" %>

 <%
 	request.setCharacterEncoding("euc-kr");
 	
 	BbsManager mgr = BbsManager.getInstance();
 	int result = mgr.editOk(request);
 	String msg="", url="bbs_list.jsp";
 	
 	if(result >0){
 		msg = "글 편집 성공";
 	}else{
 		msg ="글 편집 실패 ! 비밀번호 확인 바람.";
 		url="javascript:history.go(-1)";
 	}
 %>
 <script type="text/javascript">
 <!--
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 //-->
 </script>