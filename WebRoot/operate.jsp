<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h3>操作</h3>
  <div id="cc" class="easyui-layout" style="width:600px;height:350px;">
        <div data-options="region:'north'" style="height:40px">
        
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
        <div style='float:right;margin-top:10px;margin-right:10px'>
    </div>
        </div>
       
        <div data-options="region:'center'"  >
           <table id='dg' class="easyui-datagrid"
	                    data-options="url:'findAll.do',pagination:true,method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
	                <thead>
	                    <tr>
	                        <th data-options="field:'id'" width="80">ID</th>
	                        <th data-options="field:'name'" width="100">姓名</th>
	                        <th data-options="field:'address',align:'right'" width="80">地址</th>
	                        <th data-options="field:'age',align:'right'" width="80">年龄</th>
	                    </tr>
	                </thead>
	            </table>
        </div>
    </div>
</body>
</html>