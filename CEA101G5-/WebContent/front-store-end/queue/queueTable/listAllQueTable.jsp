<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.queuetable.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    QueTableService queTableSvc = new QueTableService();
    List<QueTableVO> list = queTableSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>listAllQueTable.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>listAllQueTable.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>tableid</th>
		<th>tabletype</th>
		<th>storeid</th>
		<th>tablettl</th>
		<th>tableusable</th>
		<th>tableocc</th>		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="queTableVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${queTableVO.queuetableid}</td>
			<td>${queTableVO.queuetabletype}</td>
			<td>${queTableVO.storeid}</td>
			<td>${queTableVO.queuetablettl}</td>
			<td>${queTableVO.queuetableusable}</td>
			<td>${queTableVO.queuetableocc}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-store-end/queue/queueTable/queueTable.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="queuetableid"  value="${queTableVO.queuetableid}">
			     <input type="hidden" name="storeid"  value="${queTableVO.storeid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-store-end/queue/queueTable/queueTable.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="queuetableid"  value="${queTableVO.queuetableid}">
			     <input type="hidden" name="storeid"  value="${queTableVO.storeid}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>