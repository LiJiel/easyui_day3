<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script>
        $(function () {

        });
        function subForm(){
            $("#inputForm").form('submit',{
                url:"save",
                success:function(data){//获取的数据为json格式 使用时需转换为js对象
                }
            });
        };
        function close() {
            $("#dialog").dialog('close');
        }
    </script>
</head>
<body>
    <div id="dialog" class="easyui-dialog" data-options="href:'${pageContext.request.contextPath}/div.jsp',buttons:[
    {
        text:'保存',
        iconCls:'icon-save',
        handler:subForm
    },{
         text:'取消',
        iconCls:'icon-cancel',
        handler:close
    }
    ],toolbar:'#tb',width:500,height:300">

        <div id="tb">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-help',plain:true">帮助</a>
        </div>

    </div>
</body>
</html>