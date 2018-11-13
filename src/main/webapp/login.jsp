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

        });
        function subForm(){
            $("#inputForm").form('submit',{
                url:"login",
                success:function(data){//获取的数据为json格式 使用时需转换为js对象
                }
            });
        };
    </script>
</head>
<body>
    <div id="dialog" class="easyui-dialog" data-options="title:'登录框',toolbar:'#tb',width:500,height:300">
        <div style="text-align: center;">
            <form action="" id="inputForm">
                <div style="margin-top: 50px;">
                    <input type="text" name="username" class="easyui-textbox" data-options="validType:'uname',required:true,prompt:'请输入用户名..',iconCls:'icon-man',labelWidth:70,width:220,height:30"><br>
                </div>
               <div style="margin-top: 20px;">
                   <input type="text" name="password" class="easyui-passwordbox" data-options="validType:'pwd',required:true,prompt:'密码..',labelWidth:70,width:220,height:30"><br>
               </div>
               <div style="margin-top: 20px;">
                   <input type="text" name="validate" class="easyui-textbox" data-options="required:true,prompt:'验证码..',labelWidth:70,width:220,height:30"><br>
               </div>
                <div style="margin-top: 15px;margin-left: 110px;">
                    <a href="javascript:void(0)" id="open" class="easyui-linkbutton" data-options="onClick:subForm,width:100">登陆</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>