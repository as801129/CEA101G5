<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.queueline.model.*"%>

<%
  QueLineVO queLineVO = (QueLineVO) request.getAttribute("queLineVO");
%>
<%= queLineVO==null %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>addqueLine.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>addQueLine.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="queueLine.do" name="form1">
<table>
	<tr>
		<td>lineno:</td>
		<td><input type="TEXT" name="quelineno" size="45" 
			 value="<%= (queLineVO==null)? "1" : queLineVO.getQueuelineno()%>" /></td>
	</tr>
	<tr>
		<td>nocall:</td>
		<td><input type="TEXT" name="quenocall" size="45" readonly="readonly" 
			 value="1" /></td>
	</tr>
	<tr>
		<td>storeid:</td>
		<td><input type="TEXT" name="storeid" size="45" readonly="readonly"
	value="<%= (queLineVO==null)? "S000001" : queLineVO.getStoreid()%>" /></td>
	</tr>
	<tr>
		<td>tableid:</td>
		<td><input type="TEXT" name="quetableid" size="45"
			 value="<%= (queLineVO==null)? "1" : queLineVO.getQueuetableid()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>


