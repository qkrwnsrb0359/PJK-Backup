<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	//idx, cp, ps �޾ƿ���...
	String idx = request.getParameter("idx");
	String cp = request.getParameter("cp");
	String ps = request.getParameter("ps");
	
	if(idx ==null || cp ==null|| ps == null ||
			idx.trim().equals("") || cp.trim().equals("")||ps.trim().equals("")){
		response.sendRedirect("bbs_list.jsp");
		return;
	} // if -------------------------------
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bbs_rewrite.jsp</title>
<!-- SCRIPT -->
<script type="text/javascript">
	function check(){
		if(!f.subject.value){
			alert("���� �Է�");
			f.subject.focus();
			return;
		}
		if(!f.content.value){
			alert("���� �Է�");
			f.content.focus();
			return;
		}
		if(!f.writer.value){
			alert("�̸� �Է�");
			f.writer.focus();
			return;
		}
		if(!f.email.value){
			alert("�̸��� �Է�");
			f.email.focus();
			return;
		}
		if(!f.pwd.value){
			alert("��й�ȣ �Է�");
			f.pwd.focus();
			return;
		}
		
		document.f.submit();
	} // check() ----------------------
</script>
</head>
<body>
<center>
		<br>
		<font color="navy" size="5">
			<b>��� ����</b>
		</font>
		<br>
	<hr width=500 color="red">
		<a href="<%=request.getContextPath()%>/bbs2/bbs_list.jsp">LIST</a>|<a href="<%=request.getContextPath()%>/temp.jsp">HOME</a>
	<hr width=500 color="red">
	<!-- ���� ���۱��� �ϱ� ���ؼ�~~enctype�߰� -->
	<form name="f" method="post" enctype="multipart/form-data" action="bbs_rewriteOk.jsp">
	
	<!-- hidden���� idx ,ps, cp �ѱ�� MultipartRequest�� ���Ȱ� ����...-->
	<input type="hidden" name="idx" value="<%=idx.trim() %>">
	<input type="hidden" name="cp" value="<%=cp.trim() %>">
	<input type="hidden" name="ps" value="<%=ps.trim() %>">
	<!-- ----------------------------- -->
	
		<table border=1 width=600>
			<tr>
				<td width="20%" align="center" ><B>�� ��</B></td>
				<td width="80%">
					<input type="text" name="subject" size=60 value="[RE]">
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>�� ��</B></td>
				<td width="80%">
					<textarea name = content rows=10 cols=60></textarea>
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>�۾���</B></td>
				<td width="80%">
					<input type="text" name="writer" size=60>
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>�̸���</B></td>
				<td width="80%">
					<input type="text" name="email" size=60>
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>Ȩ������</B></td>
				<td width="80%">
					<input type="text" name="homepage" size=60 value="http://" >
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>��й�ȣ</B></td>
				<td width="80%">
					<input type="password" name="pwd" size=60>
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>÷������</B></td>
				<td width="80%">
					<input type="file" name="filename" size=40>
				</td>
			</tr>
			<tR>
				<td colspan="2" align="center">
					<input type="button" value="�۾���" onclick="check();">
					<input type ="reset" value="�ٽ� ����">
				</td>
			</tR>
		</table>
	</form>
</center>
</body>
</html>