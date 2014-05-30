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
<title>右键菜单</title>
</head>
<body>
 <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="javascript:alert('new')">New</div>
        <div>
            <span>Open</span>
            <div style="width:150px;">
                <div><b>Word</b></div>
                <div>Excel</div>
                <div>PowerPoint</div>
                <div>
                    <span>M1</span>
                    <div style="width:120px;">
                        <div>sub1</div>
                        <div>sub2</div>
                        <div>
                            <span>Sub</span>
                            <div style="width:80px;">
                                <div onclick="javascript:alert('sub21')">sub21</div>
                                <div>sub22</div>
                                <div>sub23</div>
                            </div>
                        </div>
                        <div>sub3</div>
                    </div>
                </div>
                <div>
                    <span>Window Demos</span>
                    <div style="width:120px;">
                        <div data-options="href:'window.html'">Window</div>
                        <div data-options="href:'dialog.html'">Dialog</div>
                        <div><a href="http://www.jeasyui.com" target="_blank">EasyUI</a></div>
                    </div>
                </div>
            </div>
        </div>
        <div data-options="iconCls:'icon-save'">Save</div>
        <div data-options="iconCls:'icon-print',disabled:true">Print</div>
        <div class="menu-sep"></div>
        <div>Exit</div>
    </div>
    <div id='test' style='width:100px;height:100px;border:1px solid red'></div>
    <script>
        $(function(){
            $("#test").bind('contextmenu',function(e){
                e.preventDefault();
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            });
        });
    </script>
</body>
</html>