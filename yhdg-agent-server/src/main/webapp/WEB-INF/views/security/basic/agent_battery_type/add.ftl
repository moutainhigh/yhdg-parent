<div class="popup_body">
    <div class="ui_table">
        <form method="post">
            <input type="hidden" name="batteryType">
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
                    <td align="right">类型名称：</td>
                    <td><input type="text" class="text easyui-validatebox"  name="typeName" readonly required="true" maxlength="40" /></td>
                </tr>
                <tr>
                    <td align="right">额定电压：</td>
                    <td><input type="text" id="rated_voltage_${pid}" readonly class="text easyui-validatebox"  data-options="precision:3" style="width:184px;height: 28px;" maxlength="10" value="${(entity.ratedVoltage/1000)!''}" >V</td>
                </tr>
                <tr>
                    <td align="right">额定容量：</td>
                    <td><input type="text" id="rated_capacity_${pid}" readonly class="text easyui-validatebox""  data-options="precision:3" style="width:184px;height: 28px;" maxlength="10" value="${(entity.ratedCapacity/1000)!''}" >Ah</td>
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
                windowData = win.data('windowData'),
                form = win.find('form');

        win.find('input[name=typeName]').click(function() {
            selectBatteryType();
        });

        function selectBatteryType() {
            App.dialog.show({
                css: 'width:826px;height:522px;overflow:visible;',
                title: '选择电池类型',
                href: "${contextPath}/security/basic/system_battery_type/select_battery_type.htm",
                windowData: {
                    getOk: function(config) {
                        win.find('input[name=batteryType]').val(config.systemBatteryType.id);
                        win.find('input[name=typeName]').val(config.systemBatteryType.typeName);
                        $('#rated_voltage_${pid}').val(config.systemBatteryType.ratedVoltage/1000);
                        $('#rated_capacity_${pid}').val(config.systemBatteryType.ratedCapacity/1000);
                    }
                },
                event: {
                    onClose: function() {
                    }
                }
            });
        }

        win.find('button.ok').click(function () {
            var ratedVoltage = $('#rated_voltage_${pid}').val();
            var ratedCapacity = $('#rated_capacity_${pid}').val();
            if(ratedVoltage == '' || ratedCapacity == '') {
                $.messager.alert('提示信息', '请输入电池类型', 'info');
                return;
            }
            form.form('submit', {
                url: '${contextPath}/security/basic/agent_battery_type/create.htm',
                onSubmit: function(param) {
                    param.ratedVoltage = parseInt(Math.round(ratedVoltage * 1000));
                    param.ratedCapacity = parseInt(Math.round(ratedCapacity * 1000));
                    return true;
                },
                success: function (text) {
                    var json = $.evalJSON(text);
                <@app.json_jump/>
                    if (json.success) {
                        $.messager.alert('提示信息', '操作成功', 'info');
                        windowData.getOk(json.data);
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