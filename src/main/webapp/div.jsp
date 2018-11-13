<%@page pageEncoding="UTF-8" %>
<div style="text-align: center;">
    <form action="" class="easyui-form" id="inputForm">
        <div style="margin-top: 50px;">
            <input type="text" name="username" class="easyui-textbox" data-options="iconCls:'icon-man',labelWidth:70,label:'username:',width:220,height:30"><br>
        </div>
        <div style="margin-top: 20px;">
            <input type="text" name="password" class="easyui-passwordbox" data-options="labelWidth:70,label:'password:',width:220,height:30"><br>
        </div>
        <div style="margin-top: 20px;">
            <input type="text" name="validate" class="easyui-textbox" data-options="labelWidth:70,label:'validate:',width:220,height:30"><br>
        </div>
        <a href="javascript:void(0)"  class="easyui-linkbutton" data-options="onClick:subForm,iconCls:'icon-save'">提交</a>
        <a href="javascript:void(0)"  class="easyui-linkbutton" data-options="onClick:close,iconCls:'icon-cancel'">取消</a>
    </form>
</div>