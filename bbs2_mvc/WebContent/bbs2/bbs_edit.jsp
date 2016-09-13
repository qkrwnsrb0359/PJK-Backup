<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.bbs2.*" %>
   <%request.setCharacterEncoding("euc-kr"); %>
<%
	//���� ���� ����ϱ� ���� �۹�ȣ�� ������.
	String idxStr = request.getParameter("idx");
	if(idxStr == null){
		response.sendRedirect("bbs_list.jsp");
		return;
	}
	
	idxStr = idxStr.trim();
	
	BbsManager mgr = BbsManager.getInstance();
	////////////////////////////////////////////////
	BbsDTO gul  =mgr.edit(idxStr);
	////////////////////////////////////////////////
	if(gul == null){
		response.sendRedirect("bbs_list.jsp");
		return;
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bbs_write.jsp</title>
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
			<b>�� �� ��</b>
		</font>
		<br>
	<hr width=500 color="red">
		<a href="/bbs2/bbs/bbs_list.jsp">LIST</a>|<a href="/bbs2/bbs2/bbs_list.jsp">HOME</a>
	<hr width=500 color="red">
	
	<form name="f" method="post" action="bbs_editOk.jsp">
	<input type="hidden" name="idx" value="<%=idxStr %>">
		<table border=1 width=600>
			<tr>
				<td width="20%" align="center"><B>�� ��</B></td>
				<td width="80%">
					<input type="text" name="subject" size=60 value="<%=gul.getSubject() %>">
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>�� ��</B></td>
				<td width="80%">
					<textarea name = content rows=10 cols=60 ><%=gul.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>�۾���</B></td>
				<td width="80%">
					<input type="text" name="writer" size=60 value="<%=gul.getWriter() %>">
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>�̸���</B></td>
				<td width="80%">
					<input type="text" name="email" size=60 value="<%=gul.getEmail() %>">
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>Ȩ������</B></td>
				<td width="80%">
					<input type="text" name="homepage" size=60 value="<%=gul.getHomepage() %>" >
				</td>
			</tr>
			<tr>
				<td width="20%" align="center"><B>��й�ȣ</B></td>
				<td width="80%">
					<input type="password" name="pwd" size=60 >
				</td>
			</tr>
			<tR>
				<td colspan="2" align="center">
					<input type="button" value="���� �ϱ�" onclick="check();">
					<input type ="reset" value="�ٽ� ����">
				</td>
			</tR>
		</table>
	</form>
</center>
</body>
</html>