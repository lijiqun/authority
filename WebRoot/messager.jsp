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
 <div style="margin:20px 0;">
        <a href="#" class="easyui-linkbutton" onclick="show()">Show</a>
        <a href="#" class="easyui-linkbutton" onclick="slide()">Slide</a>
        <a href="#" class="easyui-linkbutton" onclick="fade()">Fade</a>
        <a href="#" class="easyui-linkbutton" onclick="progress()">Progress</a>
    </div>
    <script type="text/javascript">
        function show(){
            $.messager.show({
                title:'My Title',
                msg:'Message will be closed after 4 seconds.',
                showType:'show'
            });
        }
        function slide(){
            $.messager.show({
                title:'My Title',
                msg:'Message will be closed after 5 seconds.',
                timeout:5000,
                showType:'slide'
            });
        }
        function fade(){
            $.messager.show({
                title:'My Title',
                msg:'Message never be closed.',
                timeout:0,
                showType:'fade'
            });
        }
        function progress(){
            var win = $.messager.progress({
                title:'Please waiting',
                msg:'Loading data...'
            });
            setTimeout(function(){
                $.messager.progress('close');
            },5000)
        }
    </script>
</body>
</html>