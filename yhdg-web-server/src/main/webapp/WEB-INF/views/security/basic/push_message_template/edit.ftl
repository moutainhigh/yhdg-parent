<div class="popup_body">
    <div class="ui_table">
        <form id="form_${pid}">
            <input type="hidden" name="id" value="${entity.id}">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td width="70" align="right">标题：</td>
                    <td><input type="text" maxlength="17" class="text easyui-validatebox" readonly required="true" name="title" value="${(entity.title)!''}" maxlength="40"/></td>
                    <td width="70" align="right"></td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td width="70" align="right">接收人：</td>
                    <td><input type="text" class="text easyui-validatebox" required="true" maxlength="10" name="receiver" readonly value="${(entity.receiver)!''}"/></td>
                    <td width="70" align="right"></td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td align="right">内容：</td>
                    <td colspan="3">
                        <textarea class="text easyui-validatebox" required="true"maxlength="160" name="content" style="width:435px; height: 32px;">${(entity.content)!''}</textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right">变量：</td>
                    <td colspan="3">
                        <textarea class="text easyui-validatebox" required="true" maxlength="80" name="variable" style="width:435px; height: 32px;">${(entity.variable)!''}</textarea>
                    </td>
                </tr>
                <td width="70" align="right">是否朗读：</td>
                <td>
                     <span class="radio_box">
                        <input type="radio" class="radio" name="isPlay" id="isPlay_1" <#if entity.isPlay?? && entity.isPlay == 1>checked</#if>  value="1"/><label for="isPlay_1">是</label>
                     </span>
                     <span class="radio_box">
                        <input type="radio" class="radio" name="isPlay" id="isPlay_0"  <#if entity.isPlay?? && entity.isPlay == 0>checked</#if> value="0"/><label for="isPlay_0">否</label>
                     </span>
                </td>
            </table>
        </form>
    </div>
</div>
<div class="popup_btn">
    <button class="btn btn_red ok">确定</button>
    <button class="btn btn_border close">关闭</button>
</div>

<script type="text/javascript">
    (function() {
        var pid = '${pid}', win = $('#' + pid), form = win.find('form');
        win.find('button.ok').click(function() {
            form.form('submit', {
                url: '${contextPath}/security/basic/push_message_template/update.htm',
                success: function(text) {
                    var json = $.evalJSON(text);
                    <@app.json_jump/>
                    if(json.success) {
                        $.messager.alert('提示信息', '操作成功', 'info');
                        win.window('close');
                    } else {
                        $.messager.alert('提示信息', json.message, 'info');
                    }
                }
            });
        });

        win.find('button.close').click(function() {
            win.window('close');
        });

    })();


</script>