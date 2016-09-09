<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.bbs2.*,java.io.*"%>
<%
	BbsManager mgr = BbsManager.getInstance();
	
	//�ѰԽù� ��
	int totalCount = mgr.getTotalGulCount();
	// �ѰԽù���:totalCount,
	// ������ ������ : pagesize --- ps[ 5�� ������ �����ֱ� ]
	// ���� ������ : cpage ----- cp[1������, 2������....]
	// �������� : pageCount

	String psStr = request.getParameter("ps");
	String cpStr = request.getParameter("cp");
	
	if(psStr == null || psStr.trim().equals("")){
		psStr=(String)session.getAttribute("ps");
		if(psStr==null|| psStr.trim().equals("")){
		psStr ="3"; // �⺻������ ������� 3�� ����
					   // �� 3�� ������ �����ֱ� 
		}
	}
	if(cpStr == null || cpStr.trim().equals("")){
		cpStr=(String)session.getAttribute("cp");
		if(cpStr==null|| cpStr.trim().equals("")){
			cpStr ="1"; 
		}
		// default = ������������ 1�������� ����....
	}
	
	session.setAttribute("cp",cpStr);
	session.setAttribute("ps",psStr);
	
	int pageSize = Integer.parseInt(psStr.trim());
	int cpage = Integer.parseInt(cpStr.trim());
	int pageCount = 0;
	
	//�������� ���ϱ�.....
	//pageSize : 5��
	//totalCount :1~ 4 |  5
	//pageCount : 1    | 1
	
	//if(totalCount%pageSize == 0){
	//	pageCount = totalCount/pageSize;
	//}else{
	//	pageCount = totalCount/pageSize+1;	
	//}
	
	pageCount = (totalCount-1)/pageSize+1;
	
	///////////////////////////////////////////////////////
	ArrayList<BbsDTO> arr = mgr.listAll(cpage,pageSize);
	// �Ű������� ����������[cpage]�� ������������[pageSize]�� �־�����..
	///////////////////////////////////////////////////////
		
	
	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>bbs_list.jsp</title>
<style>

<!--
a:link { text-decoration:none; }
a:visited { text-decoration:none; }
a:active { text-decoration:none; }
a:hover { color:rgb(82,156,255); text-decoration:none; }
-->

A:link, A:active A:visited { 
color: red; 
font-size: 11pt; 
text-decoration: none; 
}

A:visited { 
color: green; 
font-size: 11pt; 
text-decoration: none; 
}  

A:hover { 
color: 000000; 
font-size: 11pt; 
text-decoration: underline; 
}  

</style>
</head>
<body>
<center>
		<font size=5 color="blue" face="����ü">
			Hyun's �Խ���
		</font>
	<br>
	<hr width=500 color="red">
	<a href="/bbs2/bbs2/bbs_write.jsp">�۾���</a>|<a href="/bbs2/bbs2/bbs_list.jsp">HOME</a>
	<hr width=500 color="red">
	<br>
	<!-- ������ ������ ���� select�ڽ� -->
	<form name="f" method="get">
		<select name="ps" onchange="submit()">
		<%if (pageSize == 3) {%>
			<option value="3" selected>������ SIZE���� 3</option>
		<%}else{ %>
			<option value="3">������ SIZE���� 3</option>	
		<%} 
			for(int i=5;i<=20;i+=5){
				if(pageSize==i){
		%>
					<option value="<%=i %>" selected>������ SIZE���� <%=i %>
		<%			
				}else{
		%>
					<option value="<%=i %>">������ SIZE���� <%=i %>
		<%
				} //else -----
			} // for ----------
		
		
		%>
		</select>
	
	</form>
	<table width=500 border=1>
		<tr>
			<th width="10%">����</th>
			<th width="40%">����</th>
			<th width="15%">�۾���</th>
			<th width="20%">��¥</th>
			<th>��ȸ</th>
		</tr>
<%
		
	if( arr ==null || arr.size()==0){
%>	
	<Tr>
		<td colspan = 5 align="center">���������̰ų� �Խù��� �����</td>
	</Tr>		
<%
	}else{
		ListIterator it = arr.listIterator();
		// ������ �ڵ�
		// for(BbsDTO : arr)
		while(it.hasNext()){
			BbsDTO dto = (BbsDTO)it.next();
		// ������ǥ ����ϱ� ���ؼ�~~	
			String subject = dto.getSubject();
			String writer = dto.getWriter();
			
		if(subject != null && subject.length() >10){
			// ������ 10���� �̻��̶��...
			subject = subject.substring(0,11);
			subject += "...";
		}
		
		if(writer != null && writer.length() >10){
			// ������ 10���� �̻��̶��...
			writer = writer.substring(0,11);
			writer += "...";
		}
			
%>
		<tr align="center">
			<td><%= dto.getIdx() %></td>
			<td align="left">
			<%//���� ��Ʈ�� �����...
				// �鿩���� �ϱ� ���ؼ�~
				String qstr = "refer="+dto.getRefer()+"&sunbun="+dto.getSunbun()+"&lev="+dto.getLev()+"&";
			
				int lev = dto.getLev(); //��� �鿩����
				for(int i=0; i<lev; i++){
					out.println("&nbsp;&nbsp;&nbsp;");
				}
				if(lev >0){ // ����̶��....
					out.println("-->");
				}
			%>
			<a href="bbs_content.jsp?<%=qstr%>idx=<%=dto.getIdx()%>&cp=<%=cpage%>&ps=<%=pageSize%>">
				<%= subject %>
			</a></td>
			<td><a href="mailto:<%=dto.getEmail() %>">
				<%= writer %>
			</a></td>
			<td><%= dto.getWritedate() %></td>
			<td><%= dto.getReadnum() %></td>
		</tr>
		
<%
		}
	}
%>
		<tr>
			<td colspan=5 align = center>
			<hr width=500 color=greed>
			</td>
		</tr>
		<tr>
		<td colspan=3 align="center">
<% 
	if(cpage >1){
%>
		<a href="bbs_list.jsp?cp=<%=cpage-1%>&ps=<%=pageSize%>">������</a>|
<%		
	} // if ------

	for(int i =1; i<=pageCount; i++){

		if(cpage == i){
%>
			[<%= i %>]

<%
		}else{
%>
			<a href="bbs_list.jsp?cp=<%=i%>&ps=<%=pageSize%>">[<%= i %>]</a>
<%
		}
	} // for --------------
	if(cpage < pageCount){
%>
		|<a href="bbs_list.jsp?cp=<%=cpage+1%>&ps=<%=pageSize%>">���Ģ�</a>
<%
	}
%>
			</td>

			<td colspan=2 align="center">�� �Խù��� :<font 	color="red"><b> <%= totalCount %></b></font> 
			<br>���� ������<font color="blue"> <%=cpage%></font>/<%=pageCount %> </td>
		</tr>
	</table>
	
</center>
</body>
</html>