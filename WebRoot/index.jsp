<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<link rel="stylesheet" type="text/css" href="css/icon.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/commom.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	$('#tt').tree({
    onClick: function(node){
        newTabs(node); // alert node text property when clicked
    }
	});
	tabsMenus();
});
</script>

</head>
<body class="easyui-layout" >
  
        <div data-options="region:'south',split:true" style="height:30px;"></div>
        <div data-options="region:'east',split:true" title="East" style="width:100px;"></div>
        <div data-options="region:'west',split:true" title="功能列表" style="width:180px;">
        	<ul id='tt' class="easyui-tree">
            <li>
                <span >demo</span>
                <ul>
                    <li  value=""><span >test</span></li>
                    <li >form</li>
                    <li >messager</li>
                    <li >dialog</li>
                    <li >rightMenu</li>
                </ul>
            </li>
            <li>
            	<span>权限管理</span>
            	<ul>
                    <li >user</li>
                    <li >role</li>
                    <li >menu</li>
                    <li >operate</li>
                </ul>
            </li>
        </ul>
        </div>
        <div id='tabs' class="easyui-tabs" data-options="region:'center'">
            <div title="数据交互" >
	            <table id='dg' class="easyui-datagrid"
	                    data-options="url:'findAll.do',toolbar:toolbar,pagination:true,method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
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
        <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
    </style>
        <script type="text/javascript">
        var url;
        var toolbar = [{
            text:'添加',
            iconCls:'icon-add',
            handler:function(){
            	 $('#dlg').dialog('open').dialog('setTitle','添加员工');
            	 $('#fm').form('clear');
                 url = 'addPerson.do';
            }
        },{
            text:'修改',
            iconCls:'icon-edit',
            handler:function(){
            	var row = $('#dg').datagrid('getSelected');
	            if (row){
	                $('#dlg').dialog('open').dialog('setTitle','修改员工');
	                $('#fm').form('load',row);
	                url = 'updatePerson.do?id='+row.id;
	            }
            }
        },'-',{
            text:'删除',
            iconCls:'icon-remove',
            handler:function(){
            	var row = $('#dg').datagrid('getSelected');
	            if (row){
	                $.messager.confirm('提示','确定删除吗?',function(r){
	                    if (r){
	                        $.post('deletePerson.do',{id:row.id},function(result){
	                            if (result == 'success'){
	                                $('#dg').datagrid('reload');    // reload the user data
	                            } else {
	                                $.messager.show({    // show error message
	                                    title: 'Error',
	                                    msg: result.errorMsg
	                                });
	                            }
	                        });
	                    }
	                });
	            }
	            }
        }];
      function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                   alert(result);
                   $('#dg').datagrid('reload'); 
                   $('#dlg').dialog('close');        // close the dialog
                   
                }
            });
        }
    </script>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">员工信息</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem">
                <label>姓名:</label>
                <input name="name" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>年龄:</label>
                <input name="age" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>地址:</label>
                <input name="address" class="easyui-validatebox" >
            </div>
        </form>
        <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>
    </div>
    
    <div id="tabsMenu" class="easyui-menu" style="width:120px;">  
    <div name="close">关闭</div>  
    <div name="Other">关闭其他</div>  
    <div name="All">关闭所有</div>
  </div> 
    
</body>
</html>