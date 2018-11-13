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
            $.post("${pageContext.request.contextPath}/menu.json",function (result) {
                console.log(result);
                //遍历一级菜单
                $.each(result,function (index,menu) {
                    console.log(menu);
                    //遍历二级菜单
                    var content="<div style='text-align: center'>";
                    $.each(menu.children,function (index,child) {
                        console.log(child.name);
                        content += "<div style='margin-top: 5px;'><a style='border:1px #95B8E7 solid;width:90%;' class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.iconCls+"',\">"+child.name+"</a></div><br>";
                    });
                        content += "</div>"
                    //添加一级菜单
                    $("#accordion").accordion('add',{
                        title:menu.name,
                        iconCls:menu.iconCls,
                        content:content,
                    });
                });
            });
        });
    </script>
</head>
<body>
    <div id="accordion" class="easyui-accordion" data-options="width:200,height:500">

    </div>
</body>
</html>