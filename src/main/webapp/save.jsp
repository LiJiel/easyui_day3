<%@page pageEncoding="UTF-8" %>
<div style="padding-top: 50px;text-align: center;">
    <form action=""  method="post" class="easyui-form" id="saveUserInputForm">
        <div style="margin-top:10px;">
            <input type="text" class="easyui-textbox"  name="name"  data-options="required:true,validType:'uname',iconCls:'icon-man',labelWidth:40,label:'name:',width:220,height:30"><br>
        </div>
        <div style="margin-top:10px;">
            <input type="text"  name="age" class="easyui-textbox" data-options="labelWidth:40,label:'Age:',width:220,height:30"><br>
        </div>
        <div style="margin-top: 20px;">
            <select name="sex" id="" class="easyui-combobox" data-options="panelHeight:50,labelWidth:40,label:'Sex:',width:220,height:30"><br>
                <option value="man">男</option>
                <option value="weman">女</option>
            </select>
        </div>
        <div style="margin-top: 20px;">
            <input type="text" name="bir" class="easyui-datebox" data-options="labelWidth:40,label:'Bir:',width:220,height:30"><br>
        </div>
        <div style="margin-top: 20px;">
            <input type="text" name="address" class="easyui-textbox" data-options="labelWidth:40,label:'Address:',width:220,height:30"><br>
        </div>
        </form>
</div>