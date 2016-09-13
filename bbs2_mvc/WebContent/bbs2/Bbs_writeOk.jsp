<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="my.bbs2.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result > 0 }">
	<script type="text/javascript">
	alert("글쓰기 성공");
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
	alert("글쓰기 실패");
	</script>
</c:if>
<script type="text/javascript">
	location.href="/bbs2_mvc/bbs2/bbs_list.jsp"
</script>



