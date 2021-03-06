<div class="popup_body">
    <div class="ui_table">
        <form method="post">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right">运营商名称：</td>
                    <td>
                        <input name="agentId" id="agent_id_${pid}" class="easyui-combotree" editable="false"
                               disabled style="width: 184px; height: 28px;"
                               url="${contextPath}/security/basic/agent/tree.htm?dummy=${'无'?url}"
                               value="${Session['SESSION_KEY_USER'].agentId}">
                    </td>
                </tr>
                <tr>
                    <td align="right">手机号：</td>
                    <td><input type="text" name="mobile" maxlength="11" id="mobile_${pid}" class="text easyui-validatebox" required="true" validType="mobile[]" /></td>
                </tr>
                <tr>
                    <td width="70" align="right">备注：</td>
                    <td colspan="3"><textarea style="width:260px;height:50px;" name="memo" maxlength="200"></textarea></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="popup_btn">
    <button class="btn btn_red ok">确定</button>
    <button class="btn btn_border close">关闭</button>
</div>
<script>
    (function () {
        var pid = '${pid}',
                win = $('#' + pid),
                form = win.find('form');

        win.find('button.ok').click(function () {
            if(!form.form('validate')) {
                return false;
            }
            form.form('submit', {
                url: '${contextPath}/security/basic/customer_whitelist/create.htm',
                success: function (text) {
                    var json = $.evalJSON(text);
                <@app.json_jump/>
                    if (json.success) {
                        $.messager.alert('提示信息', '操作成功', 'info');
                        win.window('close');
                    } else {
                        $.messager.alert('提示信息', json.message, 'info');
                    }
                }
            });
        });
        win.find('button.close').click(function () {
            win.window('close');
        });
    })()
</script>