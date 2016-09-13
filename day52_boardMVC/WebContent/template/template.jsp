<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>템플릿 페이지를 사용한 웹어플리케이션</title>
</head>
<body>
   <div align=center>
      <table width=700 border=1 cellpading=2 cellspacing=0>
         <tr>
            <td colspan=2>
               <jsp:include page="../module/top.jsp" />
            </td>
         </tr>
         
         <tr>
            <td width=150 valign=top >
               <jsp:include page="../module/left.jsp"/>
            </td>
            
            <td width=600 valign=top >
               <jsp:include page="${CONTENT}"/>
            </td>
         </tr>
         
         <tr>
            <td width=150 valign=top align=center colspan="2">
               <img src="module/Penguins.jpg" border=0>
            </td>
         </tr>
         <tr>
            <td width=600 valign=top align="center" colspan="2">
               <jsp:include page="../module/bottom.jsp"/>
            </td>
         </tr>
      </table>
   </div>
</body>
</html>