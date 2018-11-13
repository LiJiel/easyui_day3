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
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/form.validator.rules.js"></script>
    <script>
        $(function () {
            $("#table").datagrid({
                fitColumns:true,//列自适应宽度
                height:220,//数据表格的高度
                url:'${pageContext.request.contextPath}/emp/findByPage',//地址
                pageNumber:1,//当前页
                pageSize:2,//每页显示记录数
                pageList:[2,4,8,10],
                remoteSort:false,//关闭服务端远程排序
                toolbar:'#tb',//添加工具栏
                striped:true,//显示斑马线效果
                loadMsg:'正在加载请稍后...',//加载远程数据的信息
                pagination:true,//分页效果
                rownumbers:true,//显示行号
                columns:[[
                    {title:'cks',field:'cks',checkbox:true,width:120,},
                    {title:'id',field:'id',width:120,},
                    {title:'name',field:'name',width:120},
                    {title:'age',field:'age',width:120,sortable:true,formatter:function (value,row,index) {
                            console.log(value);
                            console.log(row);
                            if(value<25){
                                return "<font color='red'>"+value+"</font>";
                            }
                            return "<font color='blue'>"+value+"</font>";
                        }},
                    {title:'bir',field:'bir',width:120,},
                    {title:'address',field:'address',width:120,},
                    {title:'options',field:'options',width:120,formatter:function (value,row,index) {
                           console.log(row.id);
                            return "<a href='javascript:;'onclick=\"delRow('"+row.id+"')\" class='del'>删除</a>&nbsp;&nbsp;<a href='javascript:;' onclick=\"openEditDialog('"+row.id+"')\" class='edit'>修改</a>"
                        }},
                ]],
                onLoadSuccess:function () {
                    $(".del").linkbutton({iconCls:'icon-remove',plain:true});
                    $(".edit").linkbutton({iconCls:'icon-edit',plain:true});
                }
            });
        });
        //打开修改对话框
        function openEditDialog(id) {
            $("#editUserDialog").dialog({
                href:'${pageContext.request.contextPath}/edit.jsp?id='+id,
                buttons:[{
                    text:'修改',
                    iconCls:'icon-edit',
                    handler:function(){
                        $("#editUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/emp/update',
                            //响应成功之后关闭对话框
                            success:function (result) {
                                //提示信息
                                $.messager.show({title:'提示消息',msg:'用户修改成功'});
                                //重新加载对话框
                                $("#table").datagrid('reload');
                                //保存成功关闭对话框
                                $("#editUserDialog").dialog('close');

                            },

                        });
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#editUserDialog").dialog('close');
                    }
                }]
            });
        }
        //触发删除函数
        function delRow(id) {
            $.post("${pageContext.request.contextPath}/emp/delete",{"id":id},function (result) {//拿到的是json格式字符串 使用时需转换成js对象
               /* var parseJSON = $.parseJSON(result);
                if(parseJSON.success){
                    $.messager.show({title:'提示消息',msg:'删除成功'});*/
                    $("#table").datagrid('reload');//请求响应成功之后才会执行
               /* }else{
                    $.messager.show({title:'提示消息',msg:'删除失败'});
                    $("#table").datagrid('reload');//请求响应成功之后才会执行
                }
*/
            });
        }
        //触发批量删除
        function openDeleteMany() {
            var value = $("#table").datagrid('getSelections');
            if(value.length==0){
                $.messager.show({title:'提示信息',msg:'至少选择一个'});
            }else{
                var ids=[];
                for (var i=0;i<value.length;i++){
                    console.log(value[i].id);
                    ids.push(value[i].id);
                }
                console.log(ids);
                $.ajax({
                    url:"${pageContext.request.contextPath}/emp/deleteMany",
                    type:"POST",
                    traditional:true,//如果想传递数组类型的数据 必须设置traditional  为true
                    data:"id="+ids,
                    success:function(result){
                        //提示信息
                        $.messager.show({title:'提示消息',msg:'删除成功'});
                        //重新加载对话框
                        $("#table").datagrid('reload');
                    },
                    error:function(){
                        //提示信息
                        $.messager.show({title:'提示消息',msg:'删除失败'});
                        //重新加载对话框
                        $("#table").datagrid('reload');
                    }
                })
            }
        }
        //打开添加对话框
        function openSaveDialog() {
            $("#saveUserDialog").dialog({buttons:[{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                        $("#saveUserInputForm").form('submit',{
                            url:'${pageContext.request.contextPath}/emp/save',
                            success:function (result) {
                                //提示信息
                                $.messager.show({title:'提示消息',msg:'用户添加成功'});
                                //保存成功关闭对话框
                                $("#saveUserDialog").dialog('close');
                                //重新加载对话框
                                $("#table").datagrid('reload');
                            },

                        });
                    }
                },{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#saveUserDialog").dialog('close');
                    }
                }]});
        }
    </script>
</head>


<body>
<%--数据表格--%>
<table id="table"></table>
<%--工具栏--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" onclick="openSaveDialog()" data-options="iconCls:'icon-add',plain:true">添加</a>
    <a href="#" class="easyui-linkbutton" onclick="openDeleteMany()" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
</div>
<%--添加的对话框--%>
<div id="saveUserDialog" data-options="href:'${pageContext.request.contextPath}/save.jsp',iconCls:'icon-save',width:600,height:400,draggable:false,title:'保存对话框'">

</div>
<%--修改的对话框--%>
<div id="editUserDialog" data-options="iconCls:'icon-edit',width:600,height:400,draggable:false,title:'修改对话框'">

</div>
</body>
</html>