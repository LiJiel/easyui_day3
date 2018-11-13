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
            $("#table").datagrid({
                fitColumns:true,//列自适应宽度
                height:220,//数据表格的高度
                url:'${pageContext.request.contextPath}/findAll.json',//地址
                remoteSort:false,//关闭服务端远程排序
                toolbar:'#tb',//添加工具栏
                striped:true,//显示斑马线效果
                loadMsg:'正在加载请稍后...',//加载远程数据的信息
                pagination:true,//分页效果
                rownumbers:true,//显示行号
                pageSize:2,//每页显示记录数
                pageList:[2,4,8,10],
                columns:[[
                    {title:"cks",field:"cks",checkbox:true,width:120,},
                    {title:"id",field:"id",width:120,},
                    {title:"name",field:"name",width:120,fixed:true},
                    {title:"age",field:"age",width:120,sortable:true,formatter:function (value,row,index) {
                            console.log(value);
                            console.log(row);
                            if(value<25){
                                return "<font color='red'>"+value+"</font>";
                            }
                            return "<font color='blue'>"+value+"</font>";
                        }},
                    {title:"sex",field:"sex",width:120,},
                    {title:"address",field:"address",width:120,},
                    {title:"options",field:"options",width:120,formatter:function (value,row,index) {
                            return "<a href='javascript:void(0);'onclick=\"delRow('"+row.id+"')\" class='del'>删除</a>&nbsp;&nbsp;<a href='javascript:void(0);' class='edit'>修改</a>"
                        }},
                ]],
                onLoadSuccess:function () {
                    $(".del").linkbutton({iconCls:'icon-remove',plain:true});
                    $(".edit").linkbutton({iconCls:'icon-edit',plain:true});
                }
            });
        });
        function delRow(id) {
            $.post("user/delete",{"id":id},function (result) {//拿到的是json格式字符串 使用时需转换成js对象
                $("#table").datagrid('reload');//请求响应成功之后才会执行
            });
        }
    </script>
</head>
    <table id="table"></table>
    <%--工具栏--%>
    <div id="tb">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
    </div>

<body>
</body>
</html>