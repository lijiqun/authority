<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Demo</title>
     <link rel="stylesheet" type="text/css" href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			    findName()
		});
		
		function findName(keyWord){
			$('#name').combobox({  
			    url:'findNameByKeyWord.do',  
			    valueField:'text',  
			    displayField:'text',
			    delay:10,
			    onChange : function(keyWord){
			    	$('#name').combobox('reload','findNameByKeyWord.do?name='+keyWord); 
			    }  
			});  
		}
	</script>
  </head>
  
  <body >
  	<form action="" onkeypress="findName">
  		<input class="easyui-combobox" id="name" name="name" data-options="valueField:'id',textField:'text'">
  	</form>
		
  </body>
</html>
