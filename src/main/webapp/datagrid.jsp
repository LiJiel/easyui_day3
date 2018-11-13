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
    </script>
</head>
<body>
    <table class="easyui-datagrid" data-options="remoteSort:false,url:'${pageContext.request.contextPath}/findAll.json'">
        <thead>
            <tr>
                <th data-options="field:'id'">ID</th>
                <th data-options="field:'name',width:100,align:'center',halign:'left'">NAME</th>
                <th data-options="field:'age',sortable:true">AGE</th>
                <th data-options="field:'sex'">SEX</th>
                <th data-options="field:'address'">ADDRESS</th>
            </tr>
        </thead>
      <tbody>
            <tr>
                <td>21</td>
                <td>张三</td>
                <td>21</td>
                <td>男</td>
                <td>北京市海淀区</td>
            </tr>
        </tbody>
    </table>
</body>
</html>