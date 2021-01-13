<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.queueno.model.*"%>

<%
  QueNoVO queNoVO = (QueNoVO) request.getAttribute("queNoVO");
	Integer pickupNo = (Integer) request.getAttribute("pickupNo");
%>
<%= queNoVO==null %>
<%= pickupNo==null %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>addQueNo.jsp</title>

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
		 <h3>addQueNo.jsp</h3></td><td>
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
<jsp:useBean id="queNoSvc" scope="session" class="com.queueno.model.QueNoService"/>
<FORM METHOD="post" ACTION="queueNo.do" name="form1">
<table>
	<tr>
		<td>queuenum:</td>
		<td><input type="TEXT" name="queuenum" size="45" 
			 value="<%= pickupNo%>" /></td>
	</tr>
	<tr>
		<td>memphone:</td>
		<td><input type="TEXT" name="memphone" size="45"
			 value="<%= (queNoVO==null)? "0921842851" : queNoVO.getMemphone()%>" /></td>
	</tr>
	<tr>
		<td>party:</td>
		<td><input type="TEXT" name="party" size="45"
			 value="<%= (queNoVO==null)? "2" : queNoVO.getParty()%>" /></td>
	</tr>
	<tr>
		<td>queuenotime:</td>
		<td><input name="queuenotime" class="quenotime" type="text"></td>
	</tr>
	<tr>
		<td>storeid:</td>
		<td><input type="TEXT" name="storeid" size="45"
			 value="<%= (queNoVO==null)? "S000001" : queNoVO.getStoreid()%>" /></td>
	</tr>
	<tr>
		<td>lineno:</td>
		<td><input type="TEXT" name="queuelineno" size="45"
			 value="<%= (queNoVO==null)? "1" : queNoVO.getQueuelineno()%>" /></td>
	</tr>
	<tr>
		<td>periodid:</td>
		<td><input type="TEXT" name="queueperiodid" size="45"
			 value="<%= (queNoVO==null)? "1" : queNoVO.getQueueperiodid()%>" /></td>
	</tr>
	
	<tr>
		<td>tableid:</td>
		<td><input type="TEXT" name="queuetableid" size="45"
			 value="<%= (queNoVO==null)? "1" : queNoVO.getQueuetableid()%>" /></td>
	</tr>
	

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>lineno:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<!-- 														 �ݥ�el�B��A�_�h��}�l�ŭȡA�Hjava�g�|���~�A1208�A16:50 -->
<%-- 				<option value="${deptVO.deptno}" ${(queNoVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
//   java.sql.Timestamp queuenotime = null;
//   try {
// 	  queuenotime = queNoVO.getQueuenotime();
//    } catch (Exception e) {
// 	   queuenotime = new java.sql.Timestamp(System.currentTimeMillis());
//    }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('.quenotime').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 30,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y/m/d H:i',         //format:'Y-m-d H:i:s',
		   value: '<%=new java.sql.Timestamp(System.currentTimeMillis())%>',  // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>