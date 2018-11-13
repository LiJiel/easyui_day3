<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
   $(function () {
        console.log("${param.id}");
        $("#editUserInputForm").form('load','${pageContext.request.contextPath}/emp/findOne?id=${param.id}');
    });
</script>
<div style="padding-top: 50px;text-align: center;">
    <form   method="get" class="easyui-form" id="editUserInputForm">
        <input type="hidden" name="id" value="${param.id}">
        <div style="margin-top:10px;">
            <input type="text" class="easyui-textbox" name="name"  data-options="required:true,validType:'uname',iconCls:'icon-man',labelWidth:40,label:'name:',width:220,height:30"><br>
        </div>
        <div style="margin-top:10px;">
            <input type="text"  name="age" class="easyui-textbox" data-options="labelWidth:40,label:'Age:',width:220,height:30"><br>
        </div>
        <div style="margin-top: 20px;">
            <select name="sex" id="" class="easyui-combobox"  data-options="panelHeight:50,labelWidth:40,label:'Sex:',width:220,height:30"><br>
                <option value="man">男</option>
                <option value="weman">女</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            <input type="text" name="bir" class="easyui-datebox"  data-options="labelWidth:40,label:'Bir:',width:220,height:30"><br>
        </div>
        <div style="margin-top: 20px;">
            <input type="text" name="address" class="easyui-textbox"  data-options="labelWidth:40,label:'Address:',width:220,height:30"><br>
        </div>
        </form>
</div>