<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function check(){
		if(!f.pwd.value){
			alert("��й�ȣ�� �Է��ؾ� �ؿ�");
			f.pwd.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body onloal="f.pwd.focus()">
<center>
	<form action="bbs_deletOk.jsp" name="f" method="post">
	<hr width=500 color=red>
	
	<!-- hidden���� idx���� �Ѱ�����. -->
	<%String idx = request.getParameter("idx"); %>
	
	<input type="hidden" name="idx" value="<%=idx%>">
	��й�ȣ:<input type="password" name="pwd">
	<input type="button" value="����" onclick="check()">
	<input type="reset" value="�ٽþ���">
	<hr width=500 color=red>
	
	</form>
</center>
</body>
</html>